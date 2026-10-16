#!/usr/bin/env ruby
# Creates the page stubs for one app: /<slug>/{privacy,terms,support}/ for the
# default language and /<slug>/<lang>/<doc>/ for the others. The stubs only
# carry front matter; the text comes from _includes/docs/ + _data/apps.yml.
#
#   ruby scripts/new_app.rb <slug>
require "yaml"
require "fileutils"
require "date"

DOCS = %w[privacy terms support].freeze
root = File.expand_path("..", __dir__)
slug = ARGV[0] or abort "usage: ruby scripts/new_app.rb <slug>"
abort "slug must be lowercase-kebab-case" unless slug.match?(/\A[a-z0-9]+(-[a-z0-9]+)*\z/)

languages = YAML.load_file(File.join(root, "_config.yml")).fetch("languages")
apps = YAML.load_file(File.join(root, "_data/apps.yml"), permitted_classes: [Date]) || {}

languages.each_with_index do |lang, i|
  dir = i.zero? ? File.join(root, slug) : File.join(root, slug, lang)
  FileUtils.mkdir_p(dir)
  DOCS.each do |doc|
    path = File.join(dir, "#{doc}.md")
    next puts("exists  #{path.delete_prefix(root + '/')}") if File.exist?(path)
    File.write(path, <<~MD)
      ---
      layout: legal
      app: #{slug}
      doc: #{doc}
      lang: #{lang}
      ---
    MD
    puts "created #{path.delete_prefix(root + '/')}"
  end
end

unless apps.key?(slug)
  warn "\n'#{slug}' is not in _data/apps.yml yet — copy an existing entry and adjust its flags."
end

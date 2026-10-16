#!/usr/bin/env ruby
# Writes gmail/mailFilters.xml: one Gmail filter per app that labels its
# support mail as "Apps/<name>" and never marks it as spam. With
# studio.support.plus_aliases the filter matches the app's plus-alias;
# otherwise it matches mail to studio.support.email whose subject names the
# app (the site's mailto links and the apps put the app name in the subject).
# Only useful if the support inbox is read in Gmail (or forwarded to it).
# Import: Gmail → Settings → Filters and Blocked Addresses → Import filters.
#
#   ruby scripts/gmail_filters.rb
require "yaml"
require "date"
require "cgi"
require_relative "support_email"

root = File.expand_path("..", __dir__)
studio = YAML.load_file(File.join(root, "_data/studio.yml"))
apps = YAML.load_file(File.join(root, "_data/apps.yml"), permitted_classes: [Date])
plus_aliases = studio.fetch("support")["plus_aliases"]

entries = apps.map do |_slug, app|
  props = { "to" => support_email(studio, app) }
  props["subject"] = %("#{app['name']}") unless plus_aliases
  props["label"] = "Apps/#{app['name']}"
  props["shouldNeverSpam"] = "true"
  props["sizeOperator"] = "s_sl"
  props["sizeUnit"] = "s_smb"
  lines = props.map { |k, v| "  <apps:property name='#{k}' value='#{CGI.escapeHTML(v)}'/>\n" }.join
  "<entry>\n  <category term='filter'></category>\n  <title>Mail Filter</title>\n  <content></content>\n#{lines}</entry>\n"
end

xml = <<~XML
  <?xml version='1.0' encoding='UTF-8'?>
  <feed xmlns='http://www.w3.org/2005/Atom' xmlns:apps='http://schemas.google.com/apps/2006'>
    <title>Mail Filters</title>
  #{entries.join.gsub(/^/, '  ').rstrip}
  </feed>
XML

out = File.join(root, "gmail/mailFilters.xml")
File.write(out, xml)
puts "wrote #{out.delete_prefix(root + '/')} (#{apps.size} filter#{'s' unless apps.size == 1})"

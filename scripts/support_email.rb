# Support address for one app, the same rule as _includes/support-email.html:
# studio.support.email, or <local>+<email_tag>@<domain> when plus_aliases is on.
def support_email(studio, app = nil)
  support = studio.fetch("support")
  email = support.fetch("email")
  tag = app && app["email_tag"]
  return email unless support["plus_aliases"] && tag && !tag.empty?

  local, domain = email.split("@", 2)
  "#{local}+#{tag}@#{domain}"
end

# eiz-dev.github.io

Developer website for all studio apps: privacy policies, terms, support pages,
legal notice and `app-ads.txt`. Plain GitHub Pages + Jekyll — no CI, no plugins, $0.
Implements `drum-app/LEGAL_HOSTING_PLAN.md`.

> **Status: mock content.** The document texts (governing law and the review of the wording) are still
> mock; owner name, support email and AdMob publisher ID are real. A "Draft" banner shows
> on every page until `mock_content: false`.

## Layout

```
_config.yml              site URL, languages (en/uk/de), mock banner switch
_data/studio.yml         developer facts: owner, support email, AdMob pub ID
_data/apps.yml           one entry per app + flags (ads, iap, sdks, local data, FAQ)
_data/i18n.yml           UI strings per language
_includes/docs/          privacy/terms/support templates, one per language
_layouts/legal.html      renders a doc template for one app + language
<app>/                   per-app page stubs (front matter only)
app-ads.txt              generated from studio.admob_publisher_id
legal-notice.html        contact / legal notice (simple Impressum)
scripts/                 new_app.rb, legal_config.rb, gmail_filters.rb
gmail/mailFilters.xml    Gmail filters to import (generated)
```

URLs (default language has no prefix):

| Page               | URL                                                           |
| ------------------ | ------------------------------------------------------------- |
| App list + contact | `/`                                                           |
| AdMob              | `/app-ads.txt`                                                |
| Legal notice       | `/legal-notice/`                                              |
| Privacy            | `/<app>/privacy/`, `/<app>/uk/privacy/`, `/<app>/de/privacy/` |
| Terms              | `/<app>/terms/` (+ `/uk/`, `/de/`)                            |
| Support            | `/<app>/support/` (+ `/uk/`, `/de/`)                          |

## How the per-app documents work

There is one template per document and language in `_includes/docs/`. It
switches paragraphs on the app's flags in `_data/apps.yml` — `ads`, `iap` /
`iap_kind`, `accounts`, `analytics`, the `sdks` table, the `local_data` list,
`delete_data_path` and the app-specific `faq`, plus optional flags for apps with a
server, Telegram publishing or user content (listed at the top of `apps.yml`;
`stickerzzz` uses them). So each policy matches its app,
which is what the stores check, and nothing is copy-pasted.

Keep the flags true to what the shipped build actually does. If you add an SDK
to an app, add it to `sdks` in the same change.

## Adding an app

1. Add an entry to `_data/apps.yml`. Copy `stick-and-kick` and adjust it.
2. `ruby scripts/new_app.rb <slug>`: creates the 9 page stubs.
3. `ruby scripts/gmail_filters.rb`, then re-import `gmail/mailFilters.xml` (only if
   the support inbox is read in Gmail).
4. `ruby scripts/legal_config.rb <slug>`: paste the output into the app's
   `lib/src/legal/legal_config.dart`.
5. Commit and push. Pages redeploys within a minute.

## Local preview

```sh
bundle install
bundle exec jekyll serve      # http://localhost:4000
```

GitHub Pages builds with its own pinned Jekyll (3.x). The templates only use
features both versions support.

## One-time setup (plan §7)

- [ ] **Org + repo.** Create the free GitHub Organization **eiz-dev** (no
      company registration needed). Push this repo as **`eiz-dev/eiz-dev.github.io`**
      and keep it **public** (free Pages requires that).
- [ ] **Pages.** Settings → Pages → _Deploy from a branch_ → `main` / root.
      Check `https://eiz-dev.github.io/app-ads.txt`.
- [ ] **Real texts.** Port the reviewed drafts from `drum-app/docs/legal/` into
      `_includes/docs/*.md`, keeping the `{% if app.* %}` switches. Do not indent
      lines (Markdown would turn them into code blocks). Then set `mock_content: false`.
- [x] **Studio facts.** `owner_name`, `support.email` and `admob_publisher_id`
      are set.
- [ ] **Support inbox.** Every page uses `support.email` (`support@eizdev.com`).
      Make sure that address receives mail. If the inbox supports sub-addressing,
      set `support.plus_aliases: true` to give each app `support+<email_tag>@…`.
      If it is read in Gmail, import `gmail/mailFilters.xml` via Settings →
      Filters and Blocked Addresses → _Import filters_: it labels each app's mail
      `Apps/<name>` (by alias, or by the app name in the subject).
- [ ] **Optional form.** Create one Google Form with a "Which app?" dropdown.
      Put its embed URL (`…/viewform?embedded=true`) in `support.form_url`. The
      privacy policy then names `form_processor` automatically.
- [ ] **DSA trader details.** Set up the physical address (own, FOP, or a
      virtual-office service) and a separate SIM for the phone. Enter them once
      in App Store Connect and Play Console only; they are deliberately not
      in this public repo or on the site.
- [ ] **App config.** Paste the `scripts/legal_config.rb` output into each app's
      `legal_config.dart`.
- [ ] **Consoles.** Enter the privacy, support and marketing URLs in App Store
      Connect, Play Console and AdMob, using `https://eiz-dev.github.io/` as the
      developer website. In AdMob, open Apps → _app-ads.txt_ and verify.
- [ ] **Optional custom domain** (~$10/yr). Add a `CNAME` file, update `url`, and
      re-verify app-ads.txt on the new domain.

## EizDev is a brand, not a company

EizDev is not registered, so legally the developer is the individual in
`studio.owner_name`. The documents say so: "<owner>, an individual developer
publishing as EizDev". Where the brand shows up:

- **Google Play (personal account):** the developer name shown on the listing
  can be "EizDev".
- **App Store (individual account):** Apple shows your **personal legal name**
  as the seller. Showing "EizDev" there needs an organization account with a
  D-U-N-S number, which means a registered entity.
- **DSA trader details:** these are always your own name, address and phone.

If you register a FOP later, update `owner_name` and the wording in
`_includes/docs/` and `legal-notice.html`.

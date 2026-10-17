{% comment %}
Privacy policy template, English. One template per language; the {% raw %}{% if app.* %}{% endraw %}
switches and _data/apps.yml fit it to each app. Keep the five languages in step.
Do not indent lines (Markdown would turn them into code blocks).
{% endcomment %}
# {{ t.privacy }}

**{{ t.effective_date }}:** {{ app.effective_date | date: "%Y-%m-%d" }}

This policy explains what happens to information when you use **{{ app.name }}** ("the app").

- {% if app.accounts %}The app keeps a small record on our server — see "Information on our server" below.{% else %}We have no accounts and no servers. What you create in the app stays on your device.{% endif %}
{% if app.telegram %}- To publish sticker packs you can connect your Telegram account. Published packs live on Telegram.
{% endif %}{% if app.ads %}- The free version shows ads from Google AdMob.{% unless app.ads_consent == false %} In the EEA, UK and Switzerland we ask for your consent first.{% endunless %}{% if app.iap %} {% if app.ads_paid_note %}{{ app.ads_paid_note[lang] }}{% else %}{{ app.premium_name }} removes ads entirely.{% endif %}{% endif %}
{% endif %}{% if app.iap %}- Purchases go through Apple or Google. We never see your payment details.
{% endif %}

## Who is responsible

{{ studio.owner_name }} (individual developer, publishing as {{ studio.name }})<br>
Email: [{{ email }}](mailto:{{ email }})

## Information that stays on your device

The app stores the following only on your device. {% if app.telegram %}It is not sent to us, except the finished stickers of a pack you publish (see "Telegram" below):{% else %}It is never sent to us:{% endif %}

{% for item in app.local_data %}- {{ item[lang] }}
{% endfor %}
These data may be included in your device's own backups (iCloud / Android Backup) if you enabled them.
{% if app.delete_data_path[lang] %}You can erase them at any time via **{{ app.delete_data_path[lang] }}**, or by uninstalling the app.{% else %}Uninstalling the app erases them.{% endif %}

{% if app.accounts %}## Information on our server

The app signs in anonymously: it gets a random ID from Firebase Authentication. We never ask for your name, email address or phone number. Our server, hosted by {{ app.server.host }}, stores:

{% for item in app.server.data %}- {{ item[lang] }}
{% endfor %}
We use these data only to run the app: to link your packs and purchases to your app ID, to publish and manage your packs, and to apply the free limits. We do not sell them or use them for advertising. The hosting provider processes technical data such as IP addresses to deliver and protect the server and keeps short-lived request logs for troubleshooting. We keep the record while you use the app.

{% if app.server_delete[lang] %}{{ app.server_delete[lang] }}{% else %}To have your record deleted, email us. We delete it within 30 days.{% endif %}
{% endif %}

{% if app.telegram %}## Telegram

Connecting Telegram is optional and only needed to publish. When you send the connect code to our bot [@{{ app.telegram_bot }}](https://t.me/{{ app.telegram_bot }}), our server receives your Telegram user ID, username and first name from Telegram and links them to your app ID. The bot does not keep your messages.

When you publish a pack, or add a sticker to a published pack, the app sends the finished sticker images, their emojis, the pack title and link name to our server, which uploads them to Telegram through the Telegram Bot API. The pack is created under your Telegram account and is public: anyone with its link (t.me/addstickers/…) can see and add it. To show your published packs, our server fetches their images from Telegram. Deleting a pack in the app deletes it on Telegram too.

Telegram processes these data under its own [privacy policy](https://telegram.org/privacy). You can disconnect at any time via **{{ app.telegram_disconnect_path[lang] }}**; your packs stay on Telegram.
{% endif %}

{% if app.ads %}## Advertising

The free version shows ads served by Google AdMob{% if app.ad_formats %}: {{ app.ad_formats[lang] }}{% endif %}. Google's software on your device may collect device identifiers (such as the Android Advertising ID), your IP address, device and app information and interactions with ads, in order to show, cap, measure and — only with your consent — personalise ads. Google acts as an independent controller.

{% if app.ads_consent == false %}The app does not show its own consent message. Where the law requires consent for personalised ads (for example in the EEA, UK and Switzerland), Google does not serve personalised ads without it and may show non-personalised or limited ads instead. You can reset your advertising ID or opt out of personalised ads in your device settings (Android: Settings → Google → Ads, or Settings → Privacy → Ads).{% if app.iap and app.ads_paid_note %} {{ app.ads_paid_note[lang] }}{% endif %}{% else %}In the EEA, UK and Switzerland the app first shows Google's consent message (Google User Messaging Platform) and requests no ad before you answer. If you don't consent, Google shows only non-personalised or limited ads. Your choice is stored on your device; you can change it at any time in {% if app.ads_privacy_path[lang] %}**{{ app.ads_privacy_path[lang] }}**{% else %}the app's settings{% endif %}.{% if app.iap %} {% if app.ads_paid_note %}{{ app.ads_paid_note[lang] }}{% else %}If you buy {{ app.premium_name }}, the ad software is no longer started.{% endif %}{% endif %}{% endif %}
{% endif %}

{% if app.iap %}## Purchases

{% if app.iap_kind == "subscription" %}Subscriptions are{% elsif app.iap_plans %}{{ app.iap_plans[lang] }} are one-time purchases{% else %}{{ app.premium_name }} is a one-time purchase{% endif %} processed entirely by the Apple App Store or Google Play. The app only receives a confirmation that the purchase was made or restored.{% if app.iap_server_check %} To unlock it, the app sends this confirmation (product and purchase token) to our server, which checks it with Google Play and records which plan you own.{% endif %}
{% endif %}

{% if app.analytics %}## Analytics and crash reporting

{{ app.analytics_note[lang] }}
{% else %}## Analytics

The app contains no analytics or crash-reporting service.
{% endif %}

## Third-party services

{% if app.sdks.size > 0 %}| Service | Provider | Purpose |
|---|---|---|
{% for sdk in app.sdks %}| [{{ sdk.name }}]({{ sdk.privacy_url }}) | {{ sdk.provider }} | {{ sdk.purpose[lang] }} |
{% endfor %}{% else %}The app uses no third-party services that process personal data.{% endif %}

## Legal bases

Where the GDPR or a similar law applies, we process data on these bases:

{% if app.accounts or app.iap %}- **Our contract with you** (Art. 6(1)(b) GDPR): {% if app.accounts %}the record on our server{% if app.telegram %}, connecting Telegram and publishing your packs{% endif %}{% if app.iap %}, and {% endif %}{% endif %}{% if app.iap %}unlocking what you bought{% endif %}.
{% endif %}{% if app.ads %}- **Your consent** (Art. 6(1)(a) GDPR): personalised ads. **Our legitimate interest** in funding the free version (Art. 6(1)(f) GDPR): non-personalised ads, limiting how often ads appear and preventing ad fraud.
{% endif %}{% if app.analytics %}- **Our legitimate interest** in a stable app (Art. 6(1)(f) GDPR): crash and error reports.
{% endif %}- **Our legitimate interest** in answering you (Art. 6(1)(f) GDPR): messages you send us.

## Where data is processed

We are based in Ukraine. {% if app.sdks.size > 0 %}The services listed above may process data in other countries, including the United States. For data from the EEA, the UK and Switzerland they rely on an adequacy decision (such as the EU–US Data Privacy Framework) or on the European Commission's Standard Contractual Clauses.{% else %}The app's data stays on your device.{% endif %}

## How long we keep data

- On your device: until you delete it in the app or uninstall the app.
{% if app.accounts %}- The record on our server: while you use the app, and at most 30 days after you ask us to delete it.
- Our server's request logs: a few days.
{% endif %}{% if app.analytics %}- Crash and error reports: 90 days.
{% endif %}- Emails to us: as long as we need them to answer you.

{% if app.accounts %}## Security

The app talks to our server only over encrypted connections (HTTPS), and only the developer can access the server and its database.
{% endif %}

## When you contact us

If you email us{% if studio.support.form_url != "" %} or use the support form (processed by {{ studio.support.form_processor }}){% endif %}, we use your message and address only to answer you and delete them when no longer needed.

## Your rights

Depending on where you live, you may access, correct, delete or export your data, restrict or object to its processing, and withdraw your consent at any time (this doesn't affect processing before the withdrawal). We answer within one month. {% if app.accounts %}Data on your device you control directly; for data on our server, email us.{% else %}Because the app keeps your data on your device, you control it directly.{% endif %} You may also complain to a data-protection authority.

## Children

The app is not directed at children under 13. We do not knowingly collect personal information from children. If you are under the age of digital consent in your country (up to 16 in the EU), ask a parent or guardian before using the app.

## Changes

We will update the effective date above when this policy changes.

## Contact

[{{ email }}](mailto:{{ email }})

{% comment %}
MOCK privacy policy template. Replace with the reviewed text from
drum-app/docs/legal/privacy-policy.md, keeping the {% raw %}{% if app.* %}{% endraw %} switches
so one template fits every app. Do not indent lines (Markdown code blocks).
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

{% if app.ads_consent == false %}The app does not show its own consent message. Where the law requires consent for personalised ads (for example in the EEA, UK and Switzerland), Google does not serve personalised ads without it and may show non-personalised or limited ads instead. You can reset your advertising ID or opt out of personalised ads in your device settings (Android: Settings → Google → Ads, or Settings → Privacy → Ads).{% if app.iap and app.ads_paid_note %} {{ app.ads_paid_note[lang] }}{% endif %}{% else %}In the EEA, UK and Switzerland a consent message is shown before any ad is requested. You can change your choice at any time in the app's settings.{% if app.iap %} If you buy {{ app.premium_name }}, the ad software is no longer started.{% endif %}{% endif %}
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

## When you contact us

If you email us{% if studio.support.form_url != "" %} or use the support form (processed by {{ studio.support.form_processor }}){% endif %}, we use your message and address only to answer you and delete them when no longer needed.

## Your rights

Depending on where you live, you may access, correct or delete your data, object to processing, and withdraw consent. {% if app.accounts %}Data on your device you control directly; for data on our server, email us.{% else %}Because the app keeps your data on your device, you control it directly.{% endif %} You may also complain to a data-protection authority.

## Children

The app is not directed at children under 13. We do not knowingly collect personal information from children.

## Changes

We will update the effective date above when this policy changes.

## Contact

[{{ email }}](mailto:{{ email }})

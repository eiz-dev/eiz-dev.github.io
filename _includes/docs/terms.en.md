{% comment %}
Terms of use template, English. One template per language; the {% raw %}{% if app.* %}{% endraw %}
switches and _data/apps.yml fit it to each app. Keep the five languages in step.
Do not indent lines (Markdown would turn them into code blocks).
{% endcomment %}
# {{ t.terms }}

**{{ t.effective_date }}:** {{ app.effective_date | date: "%Y-%m-%d" }}

These terms apply to **{{ app.name }}** ("the app"), provided by {{ studio.owner_name }}, an individual developer publishing as {{ studio.name }} ("we"). By using the app you accept them. The store's own terms (Apple Media Services Terms / Google Play Terms of Service) also apply.{% if app.telegram %} When you publish to Telegram, [Telegram's Terms of Service](https://telegram.org/tos) apply as well.{% endif %}

## Licence

We grant you a personal, non-exclusive, non-transferable licence to use the app on devices you own or control. Do not copy, resell or reverse-engineer it except where the law allows.

## Who can use the app

You must be at least 13 years old. If you are under the age of majority where you live, use the app only with a parent's or guardian's permission.

{% if app.iap %}## Purchases

{% if app.iap_kind == "subscription" %}Subscriptions renew automatically until cancelled in your store account settings.{% elsif app.iap_plans %}{{ app.iap_plans[lang] }} are one-time purchases that unlock extra features on all devices signed in to the same store account.{% else %}{{ app.premium_name }} is a one-time purchase that unlocks extra features on all devices signed in to the same store account.{% endif %} Payments, refunds and restores are handled by Apple or Google. You can restore a purchase from within the app. Purchases are digital content supplied at once: where EU consumer law applies, the store asks at checkout for your consent to that, and the 14-day right of withdrawal then ends. Otherwise refunds follow the store's policy; your statutory rights are not affected.
{% endif %}

{% if app.ads %}## Advertising

The free version shows ads provided by third parties. We are not responsible for the content of third-party ads.{% if app.iap %} {% if app.ads_paid_note %}{{ app.ads_paid_note[lang] }}{% else %}{{ app.premium_name }} removes ads.{% endif %}{% endif %}
{% endif %}

## Your content

{% if app.user_content %}Your photos and stickers remain yours. Drafts stay on your device; keep your own backups, we cannot recover lost drafts.

You may only use photos and other material that you own or have permission to use, including permission from people shown in them. Do not create or publish content that is illegal, infringes others' rights (copyright, trademarks, privacy), harasses, threatens or sexualises anyone, shows sexual content involving minors, promotes violence or hatred, or is otherwise abusive. You are responsible for what you create and publish.

When you publish, you allow us to process your stickers and upload them to Telegram on your behalf, only for that purpose. Published packs are public on Telegram{% if app.telegram %} and subject to Telegram's rules{% endif %}. If we learn that a pack breaks these terms or the law, we may delete it and stop providing the service to you. To report a pack made with the app, email us its link (t.me/addstickers/…). We look at every report without undue delay.{% else %}Content you create in the app stays on your device and remains yours. Keep your own backups; we cannot recover lost data.{% endif %}

## No warranty

The app is provided "as is". {% if app.warranty_note[lang] %}We do not guarantee that it is error-free. {{ app.warranty_note[lang] }}{% else %}It is a practice aid; we do not guarantee that it is error-free or that its measurements are exact.{% endif %}

## Liability

We are liable without limitation for intent and gross negligence and as mandatory law requires. Otherwise our liability is limited to the amount you paid for the app in the last twelve months. Mandatory consumer rights in your country remain unaffected.

## Changes and termination

We may update the app and these terms. You may stop using the app at any time by uninstalling it.{% if app.accounts %} To also remove your data from our server, see the [privacy policy]({{ privacy_url }}).{% endif %}

## Governing law

The law of Ukraine applies, without depriving consumers of the protection of the mandatory law of their country of residence.

## Contact

[{{ email }}](mailto:{{ email }}) · [{{ t.privacy }}]({{ privacy_url }})

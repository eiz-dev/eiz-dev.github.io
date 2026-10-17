{% comment %}
Support page template, English. One template per language; the {% raw %}{% if app.* %}{% endraw %}
switches and _data/apps.yml fit it to each app. Keep the five languages in step. App-specific questions come from app.faq in _data/apps.yml.
Do not indent lines (Markdown would turn them into code blocks).
{% endcomment %}
# {{ t.support }}

Questions, bugs, ideas? Email **[{{ email }}]({{ mailto }})** — we usually reply within {{ studio.support.response_days }} working days. Please include your device model, OS version and the app version.

{% if studio.support.form_url != "" %}Or use the form below:

<iframe class="support-form" src="{{ studio.support.form_url }}" title="Support form" loading="lazy"></iframe>
{% endif %}

## Frequently asked questions

{% if app.iap %}{% if app.iap_plans %}**I bought a plan but it isn't unlocked.**<br>
Open the app's plans screen or Settings and tap **Restore purchases**, signed in to the same Google account you bought it with.{% else %}**I bought {{ app.premium_name }} but it isn't unlocked.**<br>
Open the app's {{ app.premium_name }} screen and tap **Restore purchase**, signed in to the same Apple or Google account you bought it with.{% endif %}

**How do I get a refund?**<br>
Refunds are handled by the store: [Apple](https://reportaproblem.apple.com) · [Google Play](https://support.google.com/googleplay/answer/2479637).

{% endif %}{% for item in app.faq %}**{{ item.q[lang] }}**<br>
{{ item.a[lang] }}

{% endfor %}**Where is my data stored?**<br>
{% if app.data_location[lang] %}{{ app.data_location[lang] }}{% elsif app.accounts %}In your account on our servers — see the privacy policy.{% else %}Only on your device. We have no accounts and no servers.{% endif %}

{% if app.delete_data_path[lang] %}**How do I delete my data?**<br>
{% if app.accounts %}{{ app.delete_data_path[lang] }} deletes the data on your phone{% if app.telegram %} and disconnects Telegram{% endif %}; uninstalling does the same for the phone. To have your record on our server deleted too, email us — see the [privacy policy]({{ privacy_url }}).{% else %}{{ app.delete_data_path[lang] }}. Uninstalling the app deletes everything as well.{% endif %}

{% endif %}{% if app.ads %}{% if app.ads_consent == false %}**How do I limit ad personalisation?**<br>
In your device settings (Android: Settings → Google → Ads, or Settings → Privacy → Ads).{% if app.iap %} {% if app.ads_paid_note %}{{ app.ads_paid_note[lang] }}{% else %}{{ app.premium_name }} removes ads entirely.{% endif %}{% endif %}{% else %}**How do I change my ad consent?**<br>
{% if app.ads_privacy_path[lang] %}In **{{ app.ads_privacy_path[lang] }}**{% else %}In the app's settings, under ad privacy choices{% endif %} (shown in the EEA, the UK and Switzerland, where consent applies).{% if app.iap %} {% if app.ads_paid_note %}{{ app.ads_paid_note[lang] }}{% else %}{{ app.premium_name }} removes ads entirely.{% endif %}{% endif %}{% endif %}

{% endif %}## Legal

[{{ t.privacy }}]({{ privacy_url }}) · [{{ t.terms }}]({{ terms_url }}) · [{{ t.legal_notice }}]({{ '/legal-notice/' | relative_url }})

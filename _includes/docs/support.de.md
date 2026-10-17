{% comment %}
Support page template, German. One template per language; the {% raw %}{% if app.* %}{% endraw %}
switches and _data/apps.yml fit it to each app. Keep the five languages in step. App-specific questions come from app.faq in _data/apps.yml.
Do not indent lines (Markdown would turn them into code blocks).
{% endcomment %}
# {{ t.support }}

Fragen, Fehler, Ideen? Schreib an **[{{ email }}]({{ mailto }})** — wir antworten meist innerhalb von {{ studio.support.response_days }} Werktagen. Bitte nenne Gerätemodell, Betriebssystem- und App-Version.

{% if studio.support.form_url != "" %}Oder nutze das Formular:

<iframe class="support-form" src="{{ studio.support.form_url }}" title="Support-Formular" loading="lazy"></iframe>
{% endif %}

## Häufige Fragen

{% if app.iap %}{% if app.iap_plans %}**Ich habe einen Plan gekauft, aber er ist nicht freigeschaltet.**<br>
Öffne in der App den Plan-Bildschirm oder die Settings und tippe auf **Restore purchases** — angemeldet mit demselben Google-Konto wie beim Kauf.{% else %}**Ich habe {{ app.premium_name }} gekauft, aber es ist nicht freigeschaltet.**<br>
Öffne in der App den {{ app.premium_name }}-Bildschirm und tippe auf **Kauf wiederherstellen** — angemeldet mit demselben Apple- bzw. Google-Konto wie beim Kauf.{% endif %}

**Wie bekomme ich eine Erstattung?**<br>
Erstattungen laufen über den Store: [Apple](https://reportaproblem.apple.com) · [Google Play](https://support.google.com/googleplay/answer/2479637).

{% endif %}{% for item in app.faq %}**{{ item.q[lang] }}**<br>
{{ item.a[lang] }}

{% endfor %}**Wo werden meine Daten gespeichert?**<br>
{% if app.data_location[lang] %}{{ app.data_location[lang] }}{% elsif app.accounts %}In deinem Konto auf unseren Servern — siehe Datenschutzerklärung.{% else %}Nur auf deinem Gerät. Wir haben keine Konten und keine Server.{% endif %}

{% if app.delete_data_path[lang] %}**Wie lösche ich meine Daten?**<br>
{% if app.accounts %}{{ app.delete_data_path[lang] }} löscht die Daten auf deinem Telefon{% if app.telegram %} und trennt Telegram{% endif %}; Deinstallieren tut dasselbe für das Telefon. Um auch deinen Eintrag auf unserem Server löschen zu lassen, schreib uns — siehe [Datenschutzerklärung]({{ privacy_url }}).{% else %}{{ app.delete_data_path[lang] }}. Auch das Deinstallieren der App löscht alles.{% endif %}

{% endif %}{% if app.ads %}{% if app.ads_consent == false %}**Wie schränke ich personalisierte Werbung ein?**<br>
In den Geräteeinstellungen (Android: Einstellungen → Google → Werbung bzw. Einstellungen → Datenschutz → Werbung).{% if app.iap %} {% if app.ads_paid_note %}{{ app.ads_paid_note[lang] }}{% else %}{{ app.premium_name }} entfernt Werbung vollständig.{% endif %}{% endif %}{% else %}**Wie ändere ich meine Werbe-Einwilligung?**<br>
{% if app.ads_privacy_path[lang] %}Unter **{{ app.ads_privacy_path[lang] }}**{% else %}In den Einstellungen der App unter den Datenschutzoptionen für Werbung{% endif %} (angezeigt im EWR, im Vereinigten Königreich und in der Schweiz, wo eine Einwilligung nötig ist).{% if app.iap %} {% if app.ads_paid_note %}{{ app.ads_paid_note[lang] }}{% else %}{{ app.premium_name }} entfernt Werbung vollständig.{% endif %}{% endif %}{% endif %}

{% endif %}## Rechtliches

[{{ t.privacy }}]({{ privacy_url }}) · [{{ t.terms }}]({{ terms_url }}) · [{{ t.legal_notice }}]({{ '/legal-notice/' | relative_url }})

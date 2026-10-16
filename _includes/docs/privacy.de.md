{% comment %}
MOCK — durch den geprüften Text aus drum-app/docs/legal/privacy-policy.de.md ersetzen.
{% endcomment %}
# {{ t.privacy }}

**{{ t.effective_date }}:** {{ app.effective_date | date: "%d.%m.%Y" }}

Diese Erklärung beschreibt, was mit Informationen passiert, wenn du **{{ app.name }}** („die App“) nutzt.

- {% if app.accounts %}Die App speichert einen kleinen Eintrag auf unserem Server — siehe „Daten auf unserem Server“ unten.{% else %}Wir haben keine Konten und keine Server. Was du in der App erstellst, bleibt auf deinem Gerät.{% endif %}
{% if app.telegram %}- Um Sticker-Packs zu veröffentlichen, kannst du dein Telegram-Konto verbinden. Veröffentlichte Packs liegen auf Telegram.
{% endif %}{% if app.ads %}- Die kostenlose Version zeigt Werbung von Google AdMob.{% unless app.ads_consent == false %} Im EWR, im Vereinigten Königreich und in der Schweiz fragen wir zuerst nach deiner Einwilligung.{% endunless %}{% if app.iap %} {% if app.ads_paid_note %}{{ app.ads_paid_note[lang] }}{% else %}{{ app.premium_name }} entfernt die Werbung vollständig.{% endif %}{% endif %}
{% endif %}{% if app.iap %}- Käufe laufen über Apple oder Google. Wir sehen deine Zahlungsdaten nie.
{% endif %}

## Verantwortlicher

{{ studio.owner_name }} (Einzelentwickler, veröffentlicht als {{ studio.name }})<br>
{{ t.email }}: [{{ email }}](mailto:{{ email }})

## Daten, die auf deinem Gerät bleiben

Die App speichert Folgendes ausschließlich auf deinem Gerät. {% if app.telegram %}Es wird nicht an uns übertragen, außer den fertigen Stickern eines Packs, das du veröffentlichst (siehe „Telegram“ unten):{% else %}Es wird nie an uns übertragen:{% endif %}

{% for item in app.local_data %}- {{ item[lang] }}
{% endfor %}
Diese Daten können in den Gerätesicherungen (iCloud / Android Backup) enthalten sein, wenn du diese aktiviert hast.
{% if app.delete_data_path[lang] %}Du kannst sie jederzeit löschen: **{{ app.delete_data_path[lang] }}**, oder indem du die App deinstallierst.{% else %}Beim Deinstallieren der App werden sie gelöscht.{% endif %}

{% if app.accounts %}## Daten auf unserem Server

Die App meldet sich anonym an: Sie erhält eine zufällige ID von Firebase Authentication. Wir fragen nie nach deinem Namen, deiner E-Mail-Adresse oder Telefonnummer. Unser Server, gehostet bei {{ app.server.host }}, speichert:

{% for item in app.server.data %}- {{ item[lang] }}
{% endfor %}
Wir nutzen diese Daten nur für den Betrieb der App (Art. 6 Abs. 1 lit. b DSGVO): um deine Packs und Käufe deiner App-ID zuzuordnen, deine Packs zu veröffentlichen und zu verwalten und die kostenlosen Limits anzuwenden. Wir verkaufen sie nicht und nutzen sie nicht für Werbung. Der Hosting-Anbieter verarbeitet technische Daten wie IP-Adressen, um den Server auszuliefern und zu schützen, und speichert kurzlebige Anfrage-Logs zur Fehlersuche. Wir speichern den Eintrag, solange du die App nutzt.

{% if app.server_delete[lang] %}{{ app.server_delete[lang] }}{% else %}Um deinen Eintrag löschen zu lassen, schreib uns. Wir löschen ihn innerhalb von 30 Tagen.{% endif %}
{% endif %}

{% if app.telegram %}## Telegram

Telegram zu verbinden ist freiwillig und nur zum Veröffentlichen nötig. Wenn du den Verbindungscode an unseren Bot [@{{ app.telegram_bot }}](https://t.me/{{ app.telegram_bot }}) sendest, erhält unser Server von Telegram deine Telegram-Nutzer-ID, deinen Benutzernamen und Vornamen und verknüpft sie mit deiner App-ID. Der Bot speichert deine Nachrichten nicht.

Wenn du ein Pack veröffentlichst oder einem veröffentlichten Pack einen Sticker hinzufügst, sendet die App die fertigen Sticker-Bilder, ihre Emojis, den Pack-Titel und den Link-Namen an unseren Server, der sie über die Telegram Bot API zu Telegram hochlädt. Das Pack wird in deinem Telegram-Konto angelegt und ist öffentlich: Jeder mit dem Link (t.me/addstickers/…) kann es sehen und hinzufügen. Um deine veröffentlichten Packs anzuzeigen, lädt unser Server ihre Bilder von Telegram. Wenn du ein Pack in der App löschst, wird es auch auf Telegram gelöscht.

Telegram verarbeitet diese Daten nach seiner eigenen [Datenschutzerklärung](https://telegram.org/privacy). Du kannst die Verbindung jederzeit trennen: **{{ app.telegram_disconnect_path[lang] }}**; deine Packs bleiben auf Telegram.
{% endif %}

{% if app.ads %}## Werbung

Die kostenlose Version zeigt Werbung über Google AdMob{% if app.ad_formats %}: {{ app.ad_formats[lang] }}{% endif %}. Googles Software auf deinem Gerät kann Gerätekennungen (z. B. die Android-Werbe-ID), deine IP-Adresse, Geräte- und App-Informationen sowie Interaktionen mit Anzeigen erfassen, um Werbung auszuliefern, zu begrenzen, zu messen und — nur mit deiner Einwilligung (Art. 6 Abs. 1 lit. a DSGVO, § 25 TDDDG) — zu personalisieren. Google ist eigenständig Verantwortlicher.

{% if app.ads_consent == false %}Die App zeigt keinen eigenen Einwilligungsdialog. Wo das Gesetz für personalisierte Werbung eine Einwilligung verlangt (z. B. im EWR, im Vereinigten Königreich und in der Schweiz), liefert Google ohne sie keine personalisierte Werbung aus und kann stattdessen nicht personalisierte oder eingeschränkte Anzeigen zeigen. Du kannst deine Werbe-ID zurücksetzen oder personalisierte Werbung in den Geräteeinstellungen abwählen (Android: Einstellungen → Google → Werbung bzw. Einstellungen → Datenschutz → Werbung).{% if app.iap and app.ads_paid_note %} {{ app.ads_paid_note[lang] }}{% endif %}{% else %}Im EWR, im Vereinigten Königreich und in der Schweiz erscheint vor der ersten Anzeigenanfrage ein Einwilligungsdialog. Du kannst deine Wahl jederzeit in den Einstellungen der App ändern.{% if app.iap %} Nach dem Kauf von {{ app.premium_name }} wird die Werbesoftware nicht mehr gestartet.{% endif %}{% endif %}
{% endif %}

{% if app.iap %}## Käufe

{% if app.iap_kind == "subscription" %}Abonnements werden{% elsif app.iap_plans %}{{ app.iap_plans[lang] }} sind Einmalkäufe und werden{% else %}{{ app.premium_name }} ist ein Einmalkauf und wird{% endif %} vollständig über den Apple App Store oder Google Play abgewickelt. Die App erhält nur eine Bestätigung, dass der Kauf erfolgt oder wiederhergestellt ist.{% if app.iap_server_check %} Zum Freischalten sendet die App diese Bestätigung (Produkt und Kauf-Token) an unseren Server, der sie bei Google Play prüft und speichert, welchen Plan du besitzt.{% endif %}
{% endif %}

{% if app.analytics %}## Analyse und Absturzberichte

MOCK — Anbieter, Daten, Zweck und Rechtsgrundlage beschreiben.
{% else %}## Analyse

Die App enthält keine Analyse- oder Absturzberichtsdienste.
{% endif %}

## Drittanbieter

{% if app.sdks.size > 0 %}| Dienst | Anbieter | Zweck |
|---|---|---|
{% for sdk in app.sdks %}| [{{ sdk.name }}]({{ sdk.privacy_url }}) | {{ sdk.provider }} | {{ sdk.purpose[lang] }} |
{% endfor %}{% else %}Die App nutzt keine Drittanbieter, die personenbezogene Daten verarbeiten.{% endif %}

## Wenn du uns kontaktierst

Wenn du uns eine E-Mail schreibst{% if studio.support.form_url != "" %} oder das Support-Formular nutzt (verarbeitet durch {{ studio.support.form_processor }}){% endif %}, nutzen wir Nachricht und Adresse nur zur Beantwortung (Art. 6 Abs. 1 lit. f DSGVO) und löschen sie, sobald sie nicht mehr benötigt werden.

## Deine Rechte

Du hast das Recht auf Auskunft, Berichtigung, Löschung, Einschränkung, Datenübertragbarkeit, Widerspruch und Widerruf deiner Einwilligung. {% if app.accounts %}Daten auf deinem Gerät hast du selbst in der Hand; für Daten auf unserem Server schreib uns.{% else %}Da die Daten auf deinem Gerät liegen, hast du sie selbst in der Hand.{% endif %} Außerdem kannst du dich bei einer Datenschutz-Aufsichtsbehörde beschweren.

## Kinder

Die App richtet sich nicht an Kinder unter 13 Jahren (bzw. unter dem Mindestalter für die Einwilligung in deinem Land).

## Änderungen

Bei Änderungen aktualisieren wir das Datum oben.

## {{ t.contact }}

[{{ email }}](mailto:{{ email }})

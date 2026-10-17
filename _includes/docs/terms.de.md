{% comment %}
Terms of use template, German. One template per language; the {% raw %}{% if app.* %}{% endraw %}
switches and _data/apps.yml fit it to each app. Keep the five languages in step.
Do not indent lines (Markdown would turn them into code blocks).
{% endcomment %}
# {{ t.terms }}

**{{ t.effective_date }}:** {{ app.effective_date | date: "%d.%m.%Y" }}

Diese Bedingungen gelten für **{{ app.name }}** („die App“), angeboten von {{ studio.owner_name }}, einem Einzelentwickler, der unter dem Namen {{ studio.name }} veröffentlicht („wir“). Mit der Nutzung der App akzeptierst du sie. Zusätzlich gelten die Bedingungen des jeweiligen Stores (Apple Media Services Terms / Google Play-Nutzungsbedingungen).{% if app.telegram %} Beim Veröffentlichen auf Telegram gelten außerdem die [Nutzungsbedingungen von Telegram](https://telegram.org/tos).{% endif %}

## Lizenz

Wir räumen dir eine persönliche, nicht ausschließliche, nicht übertragbare Lizenz zur Nutzung der App auf Geräten ein, die du besitzt oder kontrollierst. Kopieren, Weiterverkaufen und Dekompilieren sind nur erlaubt, soweit das Gesetz es gestattet.

## Wer die App nutzen darf

Du musst mindestens 13 Jahre alt sein. Bist du nach dem Recht deines Landes noch nicht volljährig, nutze die App nur mit Erlaubnis deiner Eltern oder Erziehungsberechtigten.

{% if app.iap %}## Käufe

{% if app.iap_kind == "subscription" %}Abonnements verlängern sich automatisch, bis du sie in deinem Store-Konto kündigst.{% elsif app.iap_plans %}{{ app.iap_plans[lang] }} sind Einmalkäufe, die Zusatzfunktionen auf allen Geräten mit demselben Store-Konto freischalten.{% else %}{{ app.premium_name }} ist ein Einmalkauf, der Zusatzfunktionen auf allen Geräten mit demselben Store-Konto freischaltet.{% endif %} Zahlung, Erstattung und Wiederherstellung erfolgen über Apple oder Google. Du kannst einen Kauf in der App wiederherstellen. Käufe sind digitale Inhalte, die sofort bereitgestellt werden: Wo EU-Verbraucherrecht gilt, holt der Store beim Kauf deine Zustimmung dazu ein, und das 14-tägige Widerrufsrecht erlischt damit. Erstattungen richten sich im Übrigen nach den Regeln des Stores; deine gesetzlichen Rechte bleiben unberührt.
{% endif %}

{% if app.ads %}## Werbung

Die kostenlose Version zeigt Werbung von Drittanbietern. Für deren Inhalte sind wir nicht verantwortlich.{% if app.iap %} {% if app.ads_paid_note %}{{ app.ads_paid_note[lang] }}{% else %}{{ app.premium_name }} entfernt die Werbung.{% endif %}{% endif %}
{% endif %}

## Deine Inhalte

{% if app.user_content %}Deine Fotos und Sticker gehören dir. Entwürfe bleiben auf deinem Gerät; bitte erstelle eigene Sicherungen, verlorene Entwürfe können wir nicht wiederherstellen.

Verwende nur Fotos und anderes Material, das dir gehört oder das du nutzen darfst, auch mit Erlaubnis der abgebildeten Personen. Erstelle oder veröffentliche keine Inhalte, die rechtswidrig sind, Rechte anderer verletzen (Urheberrecht, Marken, Privatsphäre), andere belästigen, bedrohen oder sexualisieren, sexuelle Inhalte mit Minderjährigen zeigen, zu Gewalt oder Hass aufrufen oder anderweitig missbräuchlich sind. Du bist für das verantwortlich, was du erstellst und veröffentlichst.

Wenn du veröffentlichst, erlaubst du uns, deine Sticker zu verarbeiten und in deinem Namen zu Telegram hochzuladen — nur zu diesem Zweck. Veröffentlichte Packs sind auf Telegram öffentlich{% if app.telegram %} und unterliegen den Regeln von Telegram{% endif %}. Erfahren wir, dass ein Pack gegen diese Bedingungen oder das Gesetz verstößt, können wir es löschen und dir den Dienst nicht mehr bereitstellen. Um ein mit der App erstelltes Pack zu melden, schick uns seinen Link (t.me/addstickers/…). Wir prüfen jede Meldung unverzüglich.{% else %}Was du in der App erstellst, bleibt auf deinem Gerät und gehört dir. Bitte erstelle eigene Sicherungen; verlorene Daten können wir nicht wiederherstellen.{% endif %}

## Gewährleistung

Es gelten die gesetzlichen Gewährleistungsrechte. {% if app.warranty_note[lang] %}{{ app.warranty_note[lang] }}{% else %}Die App ist eine Übungshilfe; wir garantieren nicht, dass Messwerte exakt sind.{% endif %}

## Haftung

Wir haften unbeschränkt bei Vorsatz und grober Fahrlässigkeit, bei Verletzung von Leben, Körper oder Gesundheit sowie nach dem Produkthaftungsgesetz. Bei leichter Fahrlässigkeit haften wir nur für die Verletzung wesentlicher Vertragspflichten, begrenzt auf den vorhersehbaren, vertragstypischen Schaden.

## Änderungen und Beendigung

Wir können die App und diese Bedingungen aktualisieren. Du kannst die Nutzung jederzeit durch Deinstallation beenden.{% if app.accounts %} Wie du auch deine Daten auf unserem Server löschen lässt, steht in der [Datenschutzerklärung]({{ privacy_url }}).{% endif %}

## Anwendbares Recht

Es gilt ukrainisches Recht; zwingende Verbraucherschutzvorschriften deines Wohnsitzstaates bleiben unberührt.

## {{ t.contact }}

[{{ email }}](mailto:{{ email }}) · [{{ t.privacy }}]({{ privacy_url }})

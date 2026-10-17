{% comment %}
Support page template, Ukrainian. One template per language; the {% raw %}{% if app.* %}{% endraw %}
switches and _data/apps.yml fit it to each app. Keep the five languages in step. App-specific questions come from app.faq in _data/apps.yml.
Do not indent lines (Markdown would turn them into code blocks).
{% endcomment %}
# {{ t.support }}

Питання, помилки, ідеї? Пишіть на **[{{ email }}]({{ mailto }})** — зазвичай відповідаємо протягом {{ studio.support.response_days }} робочих днів. Вкажіть модель пристрою, версію ОС і версію застосунку.

{% if studio.support.form_url != "" %}Або скористайтеся формою нижче:

<iframe class="support-form" src="{{ studio.support.form_url }}" title="Форма підтримки" loading="lazy"></iframe>
{% endif %}

## Часті запитання

{% if app.iap %}{% if app.iap_plans %}**Я купив(-ла) тариф, але його не розблоковано.**<br>
Відкрийте в застосунку екран тарифів або Налаштування і натисніть **Відновити покупки**, увійшовши в той самий обліковий запис Google, з якого купували.{% else %}**Я купив(-ла) {{ app.premium_name }}, але його не розблоковано.**<br>
Відкрийте екран {{ app.premium_name }} у застосунку і натисніть **Відновити покупку**, увійшовши в той самий обліковий запис Apple або Google, з якого купували.{% endif %}

**Як повернути кошти?**<br>
Повернення коштів здійснює магазин: [Apple](https://reportaproblem.apple.com) · [Google Play](https://support.google.com/googleplay/answer/2479637).

{% endif %}{% for item in app.faq %}**{{ item.q[lang] }}**<br>
{{ item.a[lang] }}

{% endfor %}**Де зберігаються мої дані?**<br>
{% if app.data_location[lang] %}{{ app.data_location[lang] }}{% elsif app.accounts %}У вашому обліковому записі на наших серверах — див. політику конфіденційності.{% else %}Лише на вашому пристрої. У нас немає облікових записів і серверів.{% endif %}

{% if app.delete_data_path[lang] %}**Як видалити мої дані?**<br>
{% if app.accounts %}«{{ app.delete_data_path[lang] }}» видаляє дані на телефоні{% if app.telegram %} і відключає Telegram{% endif %}; видалення застосунку робить те саме для телефона. Щоб видалити також ваш запис на нашому сервері, напишіть нам — див. [політику конфіденційності]({{ privacy_url }}).{% else %}{{ app.delete_data_path[lang] }}. Видалення застосунку також стирає все.{% endif %}

{% endif %}{% if app.ads %}{% if app.ads_consent == false %}**Як обмежити персоналізацію реклами?**<br>
У налаштуваннях пристрою (Android: Налаштування → Google → Реклама або Налаштування → Конфіденційність → Реклама).{% if app.iap %} {% if app.ads_paid_note %}{{ app.ads_paid_note[lang] }}{% else %}{{ app.premium_name }} повністю прибирає рекламу.{% endif %}{% endif %}{% else %}**Як змінити згоду на рекламу?**<br>
{% if app.ads_privacy_path[lang] %}У розділі **{{ app.ads_privacy_path[lang] }}**{% else %}У налаштуваннях застосунку, у розділі налаштувань конфіденційності реклами{% endif %} (показується в ЄЕЗ, Великій Британії та Швейцарії, де потрібна згода).{% if app.iap %} {% if app.ads_paid_note %}{{ app.ads_paid_note[lang] }}{% else %}{{ app.premium_name }} повністю прибирає рекламу.{% endif %}{% endif %}{% endif %}

{% endif %}## Правова інформація

[{{ t.privacy }}]({{ privacy_url }}) · [{{ t.terms }}]({{ terms_url }}) · [{{ t.legal_notice }}]({{ '/legal-notice/' | relative_url }})

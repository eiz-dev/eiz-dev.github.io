{% comment %}
Support page template, Spanish. One template per language; the {% raw %}{% if app.* %}{% endraw %}
switches and _data/apps.yml fit it to each app. Keep the five languages in step. App-specific questions come from app.faq in _data/apps.yml.
Do not indent lines (Markdown would turn them into code blocks).
{% endcomment %}
# {{ t.support }}

¿Preguntas, errores, ideas? Escribe a **[{{ email }}]({{ mailto }})**; solemos responder en {{ studio.support.response_days }} días laborables. Incluye el modelo de tu dispositivo, la versión del sistema y la versión de la app.

{% if studio.support.form_url != "" %}O usa el formulario de abajo:

<iframe class="support-form" src="{{ studio.support.form_url }}" title="Formulario de soporte" loading="lazy"></iframe>
{% endif %}

## Preguntas frecuentes

{% if app.iap %}{% if app.iap_plans %}**He comprado un plan, pero no se ha desbloqueado.**<br>
Abre la pantalla de planes de la app o los Ajustes y toca **Restaurar compras**, con la misma cuenta de Google con la que lo compraste.{% else %}**He comprado {{ app.premium_name }}, pero no se ha desbloqueado.**<br>
Abre la pantalla {{ app.premium_name }} de la app y toca **Restaurar compra**, con la misma cuenta de Apple o Google con la que lo compraste.{% endif %}

**¿Cómo consigo un reembolso?**<br>
Los reembolsos los gestiona la tienda: [Apple](https://reportaproblem.apple.com) · [Google Play](https://support.google.com/googleplay/answer/2479637).

{% endif %}{% for item in app.faq %}**{{ item.q[lang] }}**<br>
{{ item.a[lang] }}

{% endfor %}**¿Dónde se guardan mis datos?**<br>
{% if app.data_location[lang] %}{{ app.data_location[lang] }}{% elsif app.accounts %}En tu cuenta en nuestros servidores; consulta la política de privacidad.{% else %}Solo en tu dispositivo. No hay cuentas ni servidores.{% endif %}

{% if app.delete_data_path[lang] %}**¿Cómo borro mis datos?**<br>
{% if app.accounts %}{{ app.delete_data_path[lang] }} borra los datos de tu teléfono{% if app.telegram %} y desconecta Telegram{% endif %}; desinstalar la app hace lo mismo en el teléfono. Para que borremos también tu registro en nuestro servidor, escríbenos; consulta la [política de privacidad]({{ privacy_url }}).{% else %}{{ app.delete_data_path[lang] }}. Desinstalar la app también lo borra todo.{% endif %}

{% endif %}{% if app.ads %}{% if app.ads_consent == false %}**¿Cómo limito la personalización de los anuncios?**<br>
En los ajustes del dispositivo (Android: Ajustes → Google → Anuncios, o Ajustes → Privacidad → Anuncios).{% if app.iap %} {% if app.ads_paid_note %}{{ app.ads_paid_note[lang] }}{% else %}{{ app.premium_name }} elimina los anuncios por completo.{% endif %}{% endif %}{% else %}**¿Cómo cambio mi consentimiento para anuncios?**<br>
{% if app.ads_privacy_path[lang] %}En **{{ app.ads_privacy_path[lang] }}**{% else %}En los ajustes de la app, en las opciones de privacidad de anuncios{% endif %} (se muestra en el EEE, el Reino Unido y Suiza, donde se aplica el consentimiento).{% if app.iap %} {% if app.ads_paid_note %}{{ app.ads_paid_note[lang] }}{% else %}{{ app.premium_name }} elimina los anuncios por completo.{% endif %}{% endif %}{% endif %}

{% endif %}## Legal

[{{ t.privacy }}]({{ privacy_url }}) · [{{ t.terms }}]({{ terms_url }}) · [{{ t.legal_notice }}]({{ '/legal-notice/' | relative_url }})

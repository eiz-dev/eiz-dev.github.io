{% comment %}
Privacy policy template, Spanish. One template per language; the {% raw %}{% if app.* %}{% endraw %}
switches and _data/apps.yml fit it to each app. Keep the five languages in step.
Do not indent lines (Markdown would turn them into code blocks).
{% endcomment %}
# {{ t.privacy }}

**{{ t.effective_date }}:** {{ app.effective_date | date: "%Y-%m-%d" }}

Esta política explica qué ocurre con la información cuando usas **{{ app.name }}** («la app»).

- {% if app.accounts %}La app guarda un pequeño registro en nuestro servidor; consulta «Información en nuestro servidor» más abajo.{% else %}No hay cuentas ni servidores. Lo que creas en la app se queda en tu dispositivo.{% endif %}
{% if app.telegram %}- Para publicar packs de stickers puedes conectar tu cuenta de Telegram. Los packs publicados se alojan en Telegram.
{% endif %}{% if app.ads %}- La versión gratuita muestra anuncios de Google AdMob.{% unless app.ads_consent == false %} En el EEE, el Reino Unido y Suiza te pedimos primero tu consentimiento.{% endunless %}{% if app.iap %} {% if app.ads_paid_note %}{{ app.ads_paid_note[lang] }}{% else %}{{ app.premium_name }} elimina los anuncios por completo.{% endif %}{% endif %}
{% endif %}{% if app.iap %}- Las compras se hacen a través de Apple o Google. Nunca vemos tus datos de pago.
{% endif %}

## Responsable

{{ studio.owner_name }} (desarrollador individual que publica como {{ studio.name }})<br>
Correo electrónico: [{{ email }}](mailto:{{ email }})

## Información que se queda en tu dispositivo

La app guarda lo siguiente solo en tu dispositivo. {% if app.telegram %}No se nos envía, salvo los stickers terminados de un pack que publiques (consulta «Telegram» más abajo):{% else %}Nunca se nos envía:{% endif %}

{% for item in app.local_data %}- {{ item[lang] }}
{% endfor %}
Estos datos pueden incluirse en las copias de seguridad de tu dispositivo (iCloud / copia de seguridad de Android) si las tienes activadas.
{% if app.delete_data_path[lang] %}Puedes borrarlos en cualquier momento en **{{ app.delete_data_path[lang] }}** o desinstalando la app.{% else %}Al desinstalar la app se borran.{% endif %}

{% if app.accounts %}## Información en nuestro servidor

La app inicia sesión de forma anónima: recibe un identificador aleatorio de Firebase Authentication. Nunca te pedimos tu nombre, tu correo electrónico ni tu número de teléfono. Nuestro servidor, alojado por {{ app.server.host }}, guarda:

{% for item in app.server.data %}- {{ item[lang] }}
{% endfor %}
Usamos estos datos solo para que la app funcione: para vincular tus packs y compras a tu identificador de app, para publicar y gestionar tus packs y para aplicar los límites gratuitos. No los vendemos ni los usamos con fines publicitarios. El proveedor de alojamiento trata datos técnicos como las direcciones IP para entregar y proteger el servidor, y guarda registros de solicitudes de corta duración para resolver problemas. Conservamos el registro mientras uses la app.

{% if app.server_delete[lang] %}{{ app.server_delete[lang] }}{% else %}Para que borremos tu registro, escríbenos. Lo borramos en un plazo de 30 días.{% endif %}
{% endif %}

{% if app.telegram %}## Telegram

Conectar Telegram es opcional y solo hace falta para publicar. Cuando envías el código de conexión a nuestro bot [@{{ app.telegram_bot }}](https://t.me/{{ app.telegram_bot }}), nuestro servidor recibe de Telegram tu ID de usuario de Telegram, tu nombre de usuario y tu nombre, y los vincula a tu identificador de app. El bot no guarda tus mensajes.

Cuando publicas un pack, o añades un sticker a un pack publicado, la app envía a nuestro servidor las imágenes terminadas de los stickers, sus emoji, el título del pack y el nombre del enlace; el servidor los sube a Telegram mediante la Telegram Bot API. El pack se crea en tu cuenta de Telegram y es público: cualquiera con su enlace (t.me/addstickers/…) puede verlo y añadirlo. Para mostrar tus packs publicados, nuestro servidor obtiene sus imágenes de Telegram. Borrar un pack en la app también lo borra en Telegram.

Telegram trata estos datos según su propia [política de privacidad](https://telegram.org/privacy). Puedes desconectarte en cualquier momento en **{{ app.telegram_disconnect_path[lang] }}**; tus packs se quedan en Telegram.
{% endif %}

{% if app.ads %}## Publicidad

La versión gratuita muestra anuncios servidos por Google AdMob{% if app.ad_formats %}: {{ app.ad_formats[lang] }}{% endif %}. El software de Google en tu dispositivo puede recoger identificadores del dispositivo (como el ID de publicidad de Android), tu dirección IP, información del dispositivo y de la app e interacciones con los anuncios, para mostrar, limitar, medir y —solo con tu consentimiento— personalizar los anuncios. Google actúa como responsable independiente.

{% if app.ads_consent == false %}La app no muestra su propio mensaje de consentimiento. Donde la ley exige consentimiento para los anuncios personalizados (por ejemplo, en el EEE, el Reino Unido y Suiza), Google no sirve anuncios personalizados sin él y puede mostrar en su lugar anuncios no personalizados o limitados. Puedes restablecer tu ID de publicidad o desactivar los anuncios personalizados en los ajustes del dispositivo (Android: Ajustes → Google → Anuncios, o Ajustes → Privacidad → Anuncios).{% if app.iap and app.ads_paid_note %} {{ app.ads_paid_note[lang] }}{% endif %}{% else %}En el EEE, el Reino Unido y Suiza, la app muestra primero el mensaje de consentimiento de Google (Google User Messaging Platform) y no solicita ningún anuncio antes de que respondas. Si no das tu consentimiento, Google solo muestra anuncios no personalizados o limitados. Tu elección se guarda en tu dispositivo; puedes cambiarla en cualquier momento en {% if app.ads_privacy_path[lang] %}**{{ app.ads_privacy_path[lang] }}**{% else %}los ajustes de la app{% endif %}.{% if app.iap %} {% if app.ads_paid_note %}{{ app.ads_paid_note[lang] }}{% else %}Si compras {{ app.premium_name }}, el software publicitario deja de iniciarse.{% endif %}{% endif %}{% endif %}
{% endif %}

{% if app.iap %}## Compras

{% if app.iap_kind == "subscription" %}Las suscripciones las gestiona{% elsif app.iap_plans %}{{ app.iap_plans[lang] }} son compras únicas que gestiona{% else %}{{ app.premium_name }} es una compra única que gestiona{% endif %} por completo la App Store de Apple o Google Play. La app solo recibe la confirmación de que la compra se ha hecho o restaurado.{% if app.iap_server_check %} Para desbloquearla, la app envía esta confirmación (producto y token de compra) a nuestro servidor, que la comprueba con Google Play y registra qué planes tienes.{% endif %}
{% endif %}

{% if app.analytics %}## Analítica e informes de errores

{{ app.analytics_note[lang] }}
{% else %}## Analítica

La app no contiene ningún servicio de analítica ni de informes de errores.
{% endif %}

## Servicios de terceros

{% if app.sdks.size > 0 %}| Servicio | Proveedor | Finalidad |
|---|---|---|
{% for sdk in app.sdks %}| [{{ sdk.name }}]({{ sdk.privacy_url }}) | {{ sdk.provider }} | {{ sdk.purpose[lang] }} |
{% endfor %}{% else %}La app no usa servicios de terceros que traten datos personales.{% endif %}

## Bases jurídicas

Cuando se aplica el RGPD o una ley similar, tratamos los datos con estas bases:

{% if app.accounts or app.iap %}- **Nuestro contrato contigo** (art. 6.1.b RGPD): {% if app.accounts %}el registro en nuestro servidor{% if app.telegram %}, la conexión con Telegram y la publicación de tus packs{% endif %}{% if app.iap %}, y {% endif %}{% endif %}{% if app.iap %}el desbloqueo de lo que compraste{% endif %}.
{% endif %}{% if app.ads %}- **Tu consentimiento** (art. 6.1.a RGPD): los anuncios personalizados. **Nuestro interés legítimo** en financiar la versión gratuita (art. 6.1.f RGPD): los anuncios no personalizados, la limitación de su frecuencia y la prevención del fraude publicitario.
{% endif %}{% if app.analytics %}- **Nuestro interés legítimo** en una app estable (art. 6.1.f RGPD): los informes de fallos y errores.
{% endif %}- **Nuestro interés legítimo** en responderte (art. 6.1.f RGPD): los mensajes que nos envías.

## Dónde se tratan los datos

Estamos en Ucrania. {% if app.sdks.size > 0 %}Los servicios de la lista anterior pueden tratar datos en otros países, incluidos los Estados Unidos. Para los datos del EEE, el Reino Unido y Suiza se basan en una decisión de adecuación (como el EU–US Data Privacy Framework) o en las cláusulas contractuales tipo de la Comisión Europea.{% else %}Los datos de la app se quedan en tu dispositivo.{% endif %}

## Cuánto tiempo guardamos los datos

- En tu dispositivo: hasta que los borres en la app o desinstales la app.
{% if app.accounts %}- El registro en nuestro servidor: mientras uses la app y como máximo 30 días después de que nos pidas borrarlo.
- Los registros de solicitudes de nuestro servidor: unos días.
{% endif %}{% if app.analytics %}- Los informes de fallos y errores: 90 días.
{% endif %}- Los correos que nos envías: el tiempo necesario para responderte.

{% if app.accounts %}## Seguridad

La app se comunica con nuestro servidor solo mediante conexiones cifradas (HTTPS), y solo el desarrollador tiene acceso al servidor y a su base de datos.
{% endif %}

## Cuando nos contactas

Si nos escribes{% if studio.support.form_url != "" %} o usas el formulario de soporte (gestionado por {{ studio.support.form_processor }}){% endif %}, usamos tu mensaje y tu dirección solo para responderte y los borramos cuando ya no hacen falta.

## Tus derechos

Según dónde vivas, puedes acceder a tus datos, corregirlos, borrarlos u obtener una copia (portabilidad), limitar su tratamiento u oponerte a él, y retirar tu consentimiento en cualquier momento (sin que afecte al tratamiento anterior). Respondemos en el plazo de un mes. {% if app.accounts %}Los datos de tu dispositivo los controlas tú directamente; para los datos de nuestro servidor, escríbenos.{% else %}Como la app guarda tus datos en tu dispositivo, los controlas tú directamente.{% endif %} También puedes presentar una reclamación ante una autoridad de protección de datos (en España, la AEPD).

## Menores

La app no está dirigida a menores de 13 años. No recogemos a sabiendas información personal de menores. Si no tienes la edad de consentimiento digital de tu país (14 años en España, hasta 16 en la UE), pide permiso a tu madre, padre o tutor antes de usar la app.

## Cambios

Actualizaremos la fecha de entrada en vigor de arriba cuando cambie esta política.

## Contacto

[{{ email }}](mailto:{{ email }})

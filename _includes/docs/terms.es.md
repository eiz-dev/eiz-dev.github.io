{% comment %}
MOCK terms of use template (Spanish). Keep it in step with terms.en.md and its
app.* switches.
{% endcomment %}
# {{ t.terms }}

**{{ t.effective_date }}:** {{ app.effective_date | date: "%Y-%m-%d" }}

Estas condiciones se aplican a **{{ app.name }}** («la app»), proporcionada por {{ studio.owner_name }}, desarrollador individual que publica como {{ studio.name }} («nosotros»). Al usar la app las aceptas. También se aplican las condiciones de la tienda (Condiciones de los Servicios Multimedia de Apple / Términos del Servicio de Google Play).{% if app.telegram %} Cuando publicas en Telegram, se aplican además las [Condiciones del Servicio de Telegram](https://telegram.org/tos).{% endif %}

## Licencia

Te concedemos una licencia personal, no exclusiva e intransferible para usar la app en los dispositivos que te pertenecen o controlas. No la copies, revendas ni apliques ingeniería inversa, salvo en la medida en que la ley lo permita.

{% if app.iap %}## Compras

{% if app.iap_kind == "subscription" %}Las suscripciones se renuevan automáticamente hasta que las canceles en los ajustes de tu cuenta de la tienda.{% elsif app.iap_plans %}{{ app.iap_plans[lang] }} son compras únicas que desbloquean funciones adicionales en todos los dispositivos con la misma cuenta de la tienda.{% else %}{{ app.premium_name }} es una compra única que desbloquea funciones adicionales en todos los dispositivos con la misma cuenta de la tienda.{% endif %} Los pagos, reembolsos y restauraciones los gestiona Apple o Google. Puedes restaurar una compra desde la app.
{% endif %}

{% if app.ads %}## Publicidad

La versión gratuita muestra anuncios de terceros. No somos responsables del contenido de los anuncios de terceros.{% if app.iap %} {% if app.ads_paid_note %}{{ app.ads_paid_note[lang] }}{% else %}{{ app.premium_name }} elimina los anuncios.{% endif %}{% endif %}
{% endif %}

## Tu contenido

{% if app.user_content %}Tus fotos y stickers siguen siendo tuyos. Los borradores se quedan en tu dispositivo; haz tus propias copias de seguridad, no podemos recuperar borradores perdidos.

Solo puedes usar fotos y otro material que te pertenezca o que tengas permiso para usar, incluido el permiso de las personas que aparecen en ellos. No crees ni publiques contenido que sea ilegal, que vulnere derechos ajenos (derechos de autor, marcas, privacidad), que acose, amenace o sexualice a nadie, que muestre contenido sexual con menores, que promueva la violencia o el odio, o que sea abusivo de cualquier otro modo. Eres responsable de lo que creas y publicas.

Al publicar, nos permites tratar tus stickers y subirlos a Telegram en tu nombre, solo con ese fin. Los packs publicados son públicos en Telegram{% if app.telegram %} y están sujetos a las normas de Telegram{% endif %}. Si sabemos que un pack incumple estas condiciones o la ley, podemos borrarlo y dejar de prestarte el servicio.{% else %}El contenido que creas en la app se queda en tu dispositivo y sigue siendo tuyo. Haz tus propias copias de seguridad; no podemos recuperar datos perdidos.{% endif %}

## Sin garantía

La app se ofrece «tal cual». {% if app.warranty_note[lang] %}No garantizamos que esté libre de errores. {{ app.warranty_note[lang] }}{% else %}Es una herramienta de práctica; no garantizamos que esté libre de errores ni que sus mediciones sean exactas.{% endif %}

## Responsabilidad

Respondemos sin limitación en caso de dolo y negligencia grave, y en la medida en que lo exija la ley. En los demás casos, nuestra responsabilidad se limita al importe que hayas pagado por la app en los últimos doce meses. Los derechos imperativos de los consumidores de tu país no se ven afectados.

## Cambios y terminación

Podemos actualizar la app y estas condiciones. Puedes dejar de usar la app en cualquier momento desinstalándola.{% if app.accounts %} Para borrar también tus datos de nuestro servidor, consulta la [política de privacidad]({{ privacy_url }}).{% endif %}

## Ley aplicable

Se aplica la ley de Ucrania, sin privar a los consumidores de la protección de las normas imperativas del país en el que residen.

## Contacto

[{{ email }}](mailto:{{ email }}) · [{{ t.privacy }}]({{ privacy_url }})

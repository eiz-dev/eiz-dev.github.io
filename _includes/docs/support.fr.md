{% comment %}
Support page template, French. One template per language; the {% raw %}{% if app.* %}{% endraw %}
switches and _data/apps.yml fit it to each app. Keep the five languages in step. App-specific questions come from app.faq in _data/apps.yml.
Do not indent lines (Markdown would turn them into code blocks).
{% endcomment %}
# {{ t.support }}

Des questions, des bugs, des idées ? Écrivez à **[{{ email }}]({{ mailto }})** — nous répondons en général sous {{ studio.support.response_days }} jours ouvrés. Indiquez le modèle de votre appareil, la version du système et la version de l’app.

{% if studio.support.form_url != "" %}Ou utilisez le formulaire ci-dessous :

<iframe class="support-form" src="{{ studio.support.form_url }}" title="Formulaire d’assistance" loading="lazy"></iframe>
{% endif %}

## Questions fréquentes

{% if app.iap %}{% if app.iap_plans %}**J’ai acheté une offre, mais elle n’est pas débloquée.**<br>
Ouvrez l’écran des offres de l’app ou les Réglages et touchez **Restaurer les achats**, en étant connecté au même compte Google que lors de l’achat.{% else %}**J’ai acheté {{ app.premium_name }}, mais ce n’est pas débloqué.**<br>
Ouvrez l’écran {{ app.premium_name }} de l’app et touchez **Restaurer l’achat**, en étant connecté au même compte Apple ou Google que lors de l’achat.{% endif %}

**Comment obtenir un remboursement ?**<br>
Les remboursements sont gérés par la boutique : [Apple](https://reportaproblem.apple.com) · [Google Play](https://support.google.com/googleplay/answer/2479637).

{% endif %}{% for item in app.faq %}**{{ item.q[lang] }}**<br>
{{ item.a[lang] }}

{% endfor %}**Où sont stockées mes données ?**<br>
{% if app.data_location[lang] %}{{ app.data_location[lang] }}{% elsif app.accounts %}Dans votre compte sur nos serveurs — voir la politique de confidentialité.{% else %}Uniquement sur votre appareil. Il n’y a ni compte ni serveur.{% endif %}

{% if app.delete_data_path[lang] %}**Comment supprimer mes données ?**<br>
{% if app.accounts %}{{ app.delete_data_path[lang] }} supprime les données de votre téléphone{% if app.telegram %} et déconnecte Telegram{% endif %} ; désinstaller l’app fait de même pour le téléphone. Pour faire supprimer aussi votre enregistrement sur notre serveur, écrivez-nous — voir la [politique de confidentialité]({{ privacy_url }}).{% else %}{{ app.delete_data_path[lang] }}. Désinstaller l’app supprime aussi tout.{% endif %}

{% endif %}{% if app.ads %}{% if app.ads_consent == false %}**Comment limiter la personnalisation des publicités ?**<br>
Dans les réglages de votre appareil (Android : Paramètres → Google → Annonces, ou Paramètres → Confidentialité → Annonces).{% if app.iap %} {% if app.ads_paid_note %}{{ app.ads_paid_note[lang] }}{% else %}{{ app.premium_name }} supprime entièrement les publicités.{% endif %}{% endif %}{% else %}**Comment modifier mon consentement publicitaire ?**<br>
{% if app.ads_privacy_path[lang] %}Dans **{{ app.ads_privacy_path[lang] }}**{% else %}Dans les réglages de l’app, sous les choix de confidentialité publicitaire{% endif %} (affiché dans l’EEE, au Royaume-Uni et en Suisse, où le consentement s’applique).{% if app.iap %} {% if app.ads_paid_note %}{{ app.ads_paid_note[lang] }}{% else %}{{ app.premium_name }} supprime entièrement les publicités.{% endif %}{% endif %}{% endif %}

{% endif %}## Mentions légales

[{{ t.privacy }}]({{ privacy_url }}) · [{{ t.terms }}]({{ terms_url }}) · [{{ t.legal_notice }}]({{ '/legal-notice/' | relative_url }})

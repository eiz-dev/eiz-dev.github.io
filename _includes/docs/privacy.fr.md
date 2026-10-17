{% comment %}
Privacy policy template, French. One template per language; the {% raw %}{% if app.* %}{% endraw %}
switches and _data/apps.yml fit it to each app. Keep the five languages in step.
Do not indent lines (Markdown would turn them into code blocks).
{% endcomment %}
# {{ t.privacy }}

**{{ t.effective_date }} :** {{ app.effective_date | date: "%Y-%m-%d" }}

Cette politique explique ce qu’il advient des informations lorsque vous utilisez **{{ app.name }}** (« l’app »).

- {% if app.accounts %}L’app conserve un petit enregistrement sur notre serveur — voir « Informations sur notre serveur » ci-dessous.{% else %}Il n’y a ni compte ni serveur. Ce que vous créez dans l’app reste sur votre appareil.{% endif %}
{% if app.telegram %}- Pour publier des packs de stickers, vous pouvez connecter votre compte Telegram. Les packs publiés sont hébergés par Telegram.
{% endif %}{% if app.ads %}- La version gratuite affiche des publicités de Google AdMob.{% unless app.ads_consent == false %} Dans l’EEE, au Royaume-Uni et en Suisse, nous vous demandons d’abord votre consentement.{% endunless %}{% if app.iap %} {% if app.ads_paid_note %}{{ app.ads_paid_note[lang] }}{% else %}{{ app.premium_name }} supprime entièrement les publicités.{% endif %}{% endif %}
{% endif %}{% if app.iap %}- Les achats passent par Apple ou Google. Nous ne voyons jamais vos données de paiement.
{% endif %}

## Responsable

{{ studio.owner_name }} (développeur individuel, publiant sous le nom {{ studio.name }})<br>
E-mail : [{{ email }}](mailto:{{ email }})

## Informations qui restent sur votre appareil

L’app enregistre les éléments suivants uniquement sur votre appareil. {% if app.telegram %}Ils ne nous sont pas envoyés, sauf les stickers finis d’un pack que vous publiez (voir « Telegram » ci-dessous) :{% else %}Ils ne nous sont jamais envoyés :{% endif %}

{% for item in app.local_data %}- {{ item[lang] }}
{% endfor %}
Ces données peuvent être incluses dans les sauvegardes de votre appareil (iCloud / sauvegarde Android) si vous les avez activées.
{% if app.delete_data_path[lang] %}Vous pouvez les effacer à tout moment via **{{ app.delete_data_path[lang] }}**, ou en désinstallant l’app.{% else %}Désinstaller l’app les efface.{% endif %}

{% if app.accounts %}## Informations sur notre serveur

L’app se connecte de façon anonyme : elle reçoit un identifiant aléatoire de Firebase Authentication. Nous ne vous demandons jamais votre nom, votre adresse e-mail ni votre numéro de téléphone. Notre serveur, hébergé par {{ app.server.host }}, conserve :

{% for item in app.server.data %}- {{ item[lang] }}
{% endfor %}
Nous utilisons ces données uniquement pour faire fonctionner l’app : relier vos packs et vos achats à votre identifiant d’app, publier et gérer vos packs, et appliquer les limites gratuites. Nous ne les vendons pas et ne les utilisons pas à des fins publicitaires. L’hébergeur traite des données techniques comme les adresses IP pour acheminer les requêtes et protéger le serveur, et conserve des journaux de requêtes de courte durée pour le diagnostic. Nous conservons l’enregistrement tant que vous utilisez l’app.

{% if app.server_delete[lang] %}{{ app.server_delete[lang] }}{% else %}Pour faire supprimer votre enregistrement, écrivez-nous. Nous le supprimons sous 30 jours.{% endif %}
{% endif %}

{% if app.telegram %}## Telegram

Connecter Telegram est facultatif et n’est nécessaire que pour publier. Lorsque vous envoyez le code de connexion à notre bot [@{{ app.telegram_bot }}](https://t.me/{{ app.telegram_bot }}), notre serveur reçoit de Telegram votre identifiant d’utilisateur Telegram, votre nom d’utilisateur et votre prénom, et les relie à votre identifiant d’app. Le bot ne conserve pas vos messages.

Lorsque vous publiez un pack, ou ajoutez un sticker à un pack publié, l’app envoie à notre serveur les images finies des stickers, leurs emoji, le titre du pack et son nom de lien ; le serveur les envoie à Telegram via la Telegram Bot API. Le pack est créé sous votre compte Telegram et il est public : toute personne disposant de son lien (t.me/addstickers/…) peut le voir et l’ajouter. Pour afficher vos packs publiés, notre serveur récupère leurs images auprès de Telegram. Supprimer un pack dans l’app le supprime aussi sur Telegram.

Telegram traite ces données selon sa propre [politique de confidentialité](https://telegram.org/privacy). Vous pouvez vous déconnecter à tout moment via **{{ app.telegram_disconnect_path[lang] }}** ; vos packs restent sur Telegram.
{% endif %}

{% if app.ads %}## Publicité

La version gratuite affiche des publicités diffusées par Google AdMob{% if app.ad_formats %} : {{ app.ad_formats[lang] }}{% endif %}. Le logiciel de Google sur votre appareil peut collecter des identifiants d’appareil (comme l’identifiant publicitaire Android), votre adresse IP, des informations sur l’appareil et l’app ainsi que vos interactions avec les publicités, afin d’afficher, de plafonner, de mesurer et — uniquement avec votre consentement — de personnaliser les publicités. Google agit en tant que responsable de traitement indépendant.

{% if app.ads_consent == false %}L’app n’affiche pas son propre message de consentement. Là où la loi exige un consentement pour les publicités personnalisées (par exemple dans l’EEE, au Royaume-Uni et en Suisse), Google ne diffuse pas de publicités personnalisées sans lui et peut afficher à la place des publicités non personnalisées ou limitées. Vous pouvez réinitialiser votre identifiant publicitaire ou refuser les publicités personnalisées dans les réglages de votre appareil (Android : Paramètres → Google → Annonces, ou Paramètres → Confidentialité → Annonces).{% if app.iap and app.ads_paid_note %} {{ app.ads_paid_note[lang] }}{% endif %}{% else %}Dans l’EEE, au Royaume-Uni et en Suisse, l’app affiche d’abord le message de consentement de Google (Google User Messaging Platform) et ne demande aucune publicité avant votre réponse. Si vous refusez, Google n’affiche que des publicités non personnalisées ou limitées. Votre choix est enregistré sur votre appareil ; vous pouvez le modifier à tout moment {% if app.ads_privacy_path[lang] %}dans **{{ app.ads_privacy_path[lang] }}**{% else %}dans les réglages de l’app{% endif %}.{% if app.iap %} {% if app.ads_paid_note %}{{ app.ads_paid_note[lang] }}{% else %}Si vous achetez {{ app.premium_name }}, le logiciel publicitaire n’est plus lancé.{% endif %}{% endif %}{% endif %}
{% endif %}

{% if app.iap %}## Achats

{% if app.iap_kind == "subscription" %}Les abonnements sont traités{% elsif app.iap_plans %}{{ app.iap_plans[lang] }} sont des achats uniques traités{% else %}{{ app.premium_name }} est un achat unique traité{% endif %} entièrement par l’App Store d’Apple ou Google Play. L’app reçoit seulement la confirmation que l’achat a été effectué ou restauré.{% if app.iap_server_check %} Pour le débloquer, l’app envoie cette confirmation (produit et jeton d’achat) à notre serveur, qui la vérifie auprès de Google Play et enregistre les offres que vous possédez.{% endif %}
{% endif %}

{% if app.analytics %}## Analyse et rapports de plantage

{{ app.analytics_note[lang] }}
{% else %}## Analyse

L’app ne contient aucun service d’analyse ni de rapport de plantage.
{% endif %}

## Services tiers

{% if app.sdks.size > 0 %}| Service | Fournisseur | Finalité |
|---|---|---|
{% for sdk in app.sdks %}| [{{ sdk.name }}]({{ sdk.privacy_url }}) | {{ sdk.provider }} | {{ sdk.purpose[lang] }} |
{% endfor %}{% else %}L’app n’utilise aucun service tiers traitant des données personnelles.{% endif %}

## Bases légales

Lorsque le RGPD ou une loi similaire s’applique, nous traitons les données sur les bases suivantes :

{% if app.accounts or app.iap %}- **Notre contrat avec vous** (art. 6(1)(b) RGPD) : {% if app.accounts %}l’enregistrement sur notre serveur{% if app.telegram %}, la connexion à Telegram et la publication de vos packs{% endif %}{% if app.iap %}, ainsi que {% endif %}{% endif %}{% if app.iap %}le déblocage de vos achats{% endif %}.
{% endif %}{% if app.ads %}- **Votre consentement** (art. 6(1)(a) RGPD) : les publicités personnalisées. **Notre intérêt légitime** à financer la version gratuite (art. 6(1)(f) RGPD) : les publicités non personnalisées, la limitation de leur fréquence et la lutte contre la fraude publicitaire.
{% endif %}{% if app.analytics %}- **Notre intérêt légitime** à disposer d’une app stable (art. 6(1)(f) RGPD) : les rapports de plantage et d’erreur.
{% endif %}- **Notre intérêt légitime** à vous répondre (art. 6(1)(f) RGPD) : les messages que vous nous envoyez.

## Où les données sont traitées

Nous sommes établis en Ukraine. {% if app.sdks.size > 0 %}Les services listés ci-dessus peuvent traiter des données dans d’autres pays, notamment aux États-Unis. Pour les données provenant de l’EEE, du Royaume-Uni et de la Suisse, ils s’appuient sur une décision d’adéquation (comme le EU–US Data Privacy Framework) ou sur les clauses contractuelles types de la Commission européenne.{% else %}Les données de l’app restent sur votre appareil.{% endif %}

## Durée de conservation

- Sur votre appareil : jusqu’à ce que vous les supprimiez dans l’app ou désinstalliez l’app.
{% if app.accounts %}- L’enregistrement sur notre serveur : tant que vous utilisez l’app, et au plus 30 jours après votre demande de suppression.
- Les journaux de requêtes de notre serveur : quelques jours.
{% endif %}{% if app.analytics %}- Les rapports de plantage et d’erreur : 90 jours.
{% endif %}- Les e-mails que vous nous envoyez : le temps nécessaire pour vous répondre.

{% if app.accounts %}## Sécurité

L’app communique avec notre serveur uniquement via des connexions chiffrées (HTTPS), et seul le développeur a accès au serveur et à sa base de données.
{% endif %}

## Lorsque vous nous contactez

Si vous nous écrivez{% if studio.support.form_url != "" %} ou utilisez le formulaire d’assistance (traité par {{ studio.support.form_processor }}){% endif %}, nous utilisons votre message et votre adresse uniquement pour vous répondre et les supprimons lorsqu’ils ne sont plus nécessaires.

## Vos droits

Selon votre lieu de résidence, vous pouvez accéder à vos données, les rectifier, les supprimer ou en obtenir une copie (portabilité), en limiter le traitement ou vous y opposer, et retirer votre consentement à tout moment (sans effet sur le traitement antérieur). Nous répondons sous un mois. {% if app.accounts %}Vous contrôlez directement les données sur votre appareil ; pour les données sur notre serveur, écrivez-nous.{% else %}Comme l’app conserve vos données sur votre appareil, vous les contrôlez directement.{% endif %} Vous pouvez aussi introduire une réclamation auprès d’une autorité de protection des données (en France, la CNIL).

## Enfants

L’app ne s’adresse pas aux enfants de moins de 13 ans. Nous ne collectons pas sciemment d’informations personnelles concernant des enfants. Si vous n’avez pas l’âge du consentement numérique dans votre pays (15 ans en France, jusqu’à 16 ans dans l’UE), demandez l’accord d’un parent ou tuteur avant d’utiliser l’app.

## Modifications

Nous mettrons à jour la date d’entrée en vigueur ci-dessus lorsque cette politique changera.

## Contact

[{{ email }}](mailto:{{ email }})

{% comment %}
Terms of use template, French. One template per language; the {% raw %}{% if app.* %}{% endraw %}
switches and _data/apps.yml fit it to each app. Keep the five languages in step.
Do not indent lines (Markdown would turn them into code blocks).
{% endcomment %}
# {{ t.terms }}

**{{ t.effective_date }} :** {{ app.effective_date | date: "%Y-%m-%d" }}

Les présentes conditions s’appliquent à **{{ app.name }}** (« l’app »), fournie par {{ studio.owner_name }}, développeur individuel publiant sous le nom {{ studio.name }} (« nous »). En utilisant l’app, vous les acceptez. Les conditions propres à la boutique (Conditions générales des services multimédias Apple / Conditions d’utilisation de Google Play) s’appliquent également.{% if app.telegram %} Lorsque vous publiez sur Telegram, les [conditions d’utilisation de Telegram](https://telegram.org/tos) s’appliquent aussi.{% endif %}

## Licence

Nous vous accordons une licence personnelle, non exclusive et non transférable d’utilisation de l’app sur les appareils que vous possédez ou contrôlez. Ne la copiez pas, ne la revendez pas et ne la décompilez pas, sauf dans la mesure où la loi le permet.

## Qui peut utiliser l’app

Vous devez avoir au moins 13 ans. Si vous êtes mineur selon la loi de votre pays, n’utilisez l’app qu’avec l’accord d’un parent ou tuteur.

{% if app.iap %}## Achats

{% if app.iap_kind == "subscription" %}Les abonnements se renouvellent automatiquement jusqu’à leur résiliation dans les réglages de votre compte de la boutique.{% elsif app.iap_plans %}{{ app.iap_plans[lang] }} sont des achats uniques qui débloquent des fonctions supplémentaires sur tous les appareils connectés au même compte de la boutique.{% else %}{{ app.premium_name }} est un achat unique qui débloque des fonctions supplémentaires sur tous les appareils connectés au même compte de la boutique.{% endif %} Les paiements, remboursements et restaurations sont gérés par Apple ou Google. Vous pouvez restaurer un achat depuis l’app. Les achats sont des contenus numériques fournis immédiatement : lorsque le droit de la consommation de l’UE s’applique, la boutique vous demande votre accord au moment du paiement, et le droit de rétractation de 14 jours prend alors fin. Pour le reste, les remboursements suivent la politique de la boutique ; vos droits légaux ne sont pas affectés.
{% endif %}

{% if app.ads %}## Publicité

La version gratuite affiche des publicités fournies par des tiers. Nous ne sommes pas responsables du contenu des publicités de tiers.{% if app.iap %} {% if app.ads_paid_note %}{{ app.ads_paid_note[lang] }}{% else %}{{ app.premium_name }} supprime les publicités.{% endif %}{% endif %}
{% endif %}

## Votre contenu

{% if app.user_content %}Vos photos et vos stickers vous appartiennent. Les brouillons restent sur votre appareil ; faites vos propres sauvegardes, nous ne pouvons pas récupérer des brouillons perdus.

Vous ne pouvez utiliser que des photos et d’autres contenus qui vous appartiennent ou que vous avez le droit d’utiliser, y compris avec l’accord des personnes qui y figurent. Ne créez ni ne publiez aucun contenu illégal, portant atteinte aux droits d’autrui (droit d’auteur, marques, vie privée), harcelant, menaçant ou sexualisant qui que ce soit, montrant des contenus sexuels impliquant des mineurs, faisant l’apologie de la violence ou de la haine, ou abusif de toute autre manière. Vous êtes responsable de ce que vous créez et publiez.

Lorsque vous publiez, vous nous autorisez à traiter vos stickers et à les envoyer sur Telegram en votre nom, uniquement à cette fin. Les packs publiés sont publics sur Telegram{% if app.telegram %} et soumis aux règles de Telegram{% endif %}. Si nous apprenons qu’un pack enfreint les présentes conditions ou la loi, nous pouvons le supprimer et cesser de vous fournir le service. Pour signaler un pack créé avec l’app, envoyez-nous son lien (t.me/addstickers/…). Nous examinons chaque signalement sans retard injustifié.{% else %}Le contenu que vous créez dans l’app reste sur votre appareil et vous appartient. Faites vos propres sauvegardes ; nous ne pouvons pas récupérer des données perdues.{% endif %}

## Absence de garantie

L’app est fournie « en l’état ». {% if app.warranty_note[lang] %}Nous ne garantissons pas qu’elle soit exempte d’erreurs. {{ app.warranty_note[lang] }}{% else %}C’est un outil d’entraînement ; nous ne garantissons pas qu’elle soit exempte d’erreurs ni que ses mesures soient exactes.{% endif %}

## Responsabilité

Nous sommes responsables sans limitation en cas de faute intentionnelle ou de faute lourde, et dans la mesure où la loi l’impose. Pour le reste, notre responsabilité est limitée au montant que vous avez payé pour l’app au cours des douze derniers mois. Les droits impératifs des consommateurs de votre pays ne sont pas affectés.

## Modifications et résiliation

Nous pouvons mettre à jour l’app et les présentes conditions. Vous pouvez cesser d’utiliser l’app à tout moment en la désinstallant.{% if app.accounts %} Pour supprimer aussi vos données de notre serveur, consultez la [politique de confidentialité]({{ privacy_url }}).{% endif %}

## Droit applicable

Le droit ukrainien s’applique, sans priver les consommateurs de la protection des dispositions impératives du droit de leur pays de résidence.

## Contact

[{{ email }}](mailto:{{ email }}) · [{{ t.privacy }}]({{ privacy_url }})

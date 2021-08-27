#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Response.destroy_all
Question.destroy_all
Project.destroy_all
User.destroy_all

user1 = User.create(username: 'Maxence', email: 'maxencelerouge1@gmail.com', password: 'anniversaire')
user2 = User.create(username: 'Estelle', email: 'estelle.dourthe40@orange.fr', password: 'anniversaire')
user3 = User.create(username: 'Violette', email: 'violetteruccio@gmail.com', password: 'anniversaire')

project1 = Project.new(title: "Mon superbe Appart", project_type: "appartement", address: "avenue des saules Lomme")
project1.user = user1
project1.save!

project2 = Project.new(title: "Ma belle Maison", project_type: "maison", address: "avenue de l'Hippodrome Lambersart")
project2.user = user2
project2.save!


project1 = Project.new(title: "Mon Appart stylé", project_type: "appartement", address: "place du Maréchal Leclerc")
project1.user = user1
project1.save!


#STEP 1
step1 = Step.create(number: 1, title: "Se préparer à la vente")
step2 = Step.create(number: 2, title: "Les questions financières")
step3 = Step.create(number: 3, title: "Trouver un acheteur")
step4 = Step.create(number: 4, title: "Finalisation de la vente")

################################QUESTION1#######################################

question1A = Question.create!(step: step1, content: "Souhaitez-vous connaître les prix des biens près de chez vous ?", name: "estimation-approximative")

response1A = Response.create!(question: question1A, content: "Absolument !", next_question_name: "partage-estimation")

response1B = Response.create!(question: question1A, content: "Non merci", next_question_name: "choix-notaire")

question1B = Question.create!(step: step1, content: "Dans votre quartier, les prix au mètre carré pour les maisons sont en moyenne de %s.
D’après mon expérience et les dernières transactions réalisées, votre bien a une valeur comprise entre  %s et %s. Si cela vous intéresse, je vous proposerai d’effectuer une estimation plus précise plus tard !
N’oubliez pas en passant de particulier à particulier, vous économisez 5 à 6% de frais d’agence. Foncez !", name: "partage-estimation", next_question_name: "choix-notaire")
p question1B

question1C = Question.create!(step: step1, content: "Très bien", name: "très bien-estimation", next_question_name: "choix-notaire")


################################QUESTION2#######################################

question2A = Question.create!(step: step1, content: "Le choix du notaire est essentiel dans la vente de votre bien ! En avez-vous déjà un ?", name: "choix-notaire")


response2A = Response.create!(question: question2A, content: "Oui, j'en ai déjà un", next_question_name: "parfait-notaire")

response2B = Response.create!(question: question2A, content: "Non, je n'en ai pas", next_question_name: "propositions-notaire")


question2B = Question.create!(step: step1, content: "Parfait, passons à la suite.", name: "parfait-notaire", next_question_name: "questions-diagnostics")


question2C = Question.create!(step: step1, content: "Nous vous proposons les notaires ci-dessous qui se situent proches de chez vous.

N'hésitez pas à en contacter un ou à demander à votre entourage de vous en recommander un : vous ne pourrez pas vendre votre bien sans notaire", name: "propositions-notaire", next_question_name: "questions-diagnostics")


################################QUESTION3#######################################

question3A = Question.create!(
  step: step1, name: "questions-diagnostics", next_question_name: "a-jour",
  content: "Pour vendre votre bien, il y a plusieurs diagnostics à réaliser. Pas de panique ! Ce n’est pas aussi cher que cela en a l’air ! Comptez entre 100€ et 500€ pour l’intégralité du pack.

N’oubliez pas : un mauvais diagnostic n’empêche pas la conclusion d’une vente !

De même, rien ne vous oblige à effectuer des travaux ni à les financer mais, bien sûr, l’acheteur est libre de négocier le prix au regard des diagnostics.

Avez-vous réalisé les diagnostics suivants ? Cochez ceux que vous avez réalisés." )

response3A = Response.create!(question: question3A, content: "
- Le diagnostic amiante + Seulement pour les biens dont le permis de construire date d’avant le 1er juillet 1997. Il est valable 5 ans. Si le diagnostic est positif en grande quantité, le désamiantage peut être imposé par le préfet.
- Le diagnostic plomb + Seulement pour les biens à usage d’habitation construits avant le 1er janvier 1949. Le diagnostic est valable 1 an.
- Le diagnostic termites + Il est valable pendant seulement 6 mois ! Attention à bien vendre votre bien dans ce délai !
- Le diagnostic électricité + Seulement pour les biens dont l’installation intérieure d’électricité a moins de 15 ans. Il est valable pendant 3 ans.
- Le diagnostic gaz + Seulement pour les biens dont l’installation intérieure de gaz à moins de 15 ans. Il est valable pendant 3 ans.
- L'état des risques et pollutions + Il est valable 6 mois.
- Le diagnostic de performance énergétique + Il est valable 10 ans.
- Le diagnostic assainissement + Il est obligatoire pour un bien raccordé à une installation d’assainissement non collectif. Dans ce cas, il est valable 3 ans.
- Le diagnostic mérules + Il faut le faire pour chaque transaction !
- L’étude de sol
- État des nuisances sonores aériennes
- La surface loi Carrez + Seulement pour les lots en copropriété. Il faut le faire pour chaque transaction !", next_question_name: "a-jour")


question3B = Question.create!(step: step1, content: "Parfait, vous avez pris de l’avance. Vous pourrez compléter cette liste à tout moment.", name: "a-jour",next_question_name: "coproriete")


question3C = Question.create!(step: step1, content: "Parfait, vous êtes à jour. Déposez les documents sur votre espace projet 👇  Nous allons en avoir besoin pour la création de l’annonce.")


question3D = Question.create!(step: step1, content: "Voici quelques diagnostiqueurs proches de chez vous. N'hésitez pas à rappeler ceux qui ont déjà travaillé sur votre bien.", name: "choix diagnostiqueurs", next_question_name: "coproriete")


################################QUESTION4#######################################

question4A = Question.create!(step: step1, content: "Êtes vous en copropriété ?", name: "coproriete")


response4A = Response.new(content: "Oui", next_question_name: "documents-copropriete")
response4A.question = question4A
response4A.save!

response4B = Response.new(content: "Non", next_question_name: "estimation-precise")
response4B.question = question4A
response4B.save!

question4B = Question.create!(step: step1, content: "
L’acheteur pourrait vous demander des documents complémentaires. Bien que vous n’ayez aucune obligation de les fournir, cela favorise une vente paisible :
  - Les diagnostics relatifs aux parties communes
  - Le règlement de copropriété
  - Le carnet d'entretien de l'immeuble
  - Le montant des charges courantes
  - L’état des finances du syndicat des copropriétaires

 👏  Vous disposez désormais d’un notaire et avez réalisé les diagnostics obligatoires.
 Il est temps de créer votre annonce ! Pour cela nous avons de superbes conseils pour garantir l’afflux de visiteurs !", name: "documents-copropriete", next_question_name: "estimation-precise")


question4C = Question.create!(step: step1, content: "Okay")


################################QUESTION5#######################################

question5A = Question.create!(step: step2, content: "Souhaitez-vous une estimation plus précise de votre bien ?", name: "estimation-precise")


response5A = Response.new(content: "Oui s'il-te-plait", next_question_name: "estimation-votre-maison")
response5A.question = question5A
response5A.save!

response5B = Response.new(content: "Non merci", next_question_name: "frais-notaire")
response5B.question = question5A
response5B.save!

question5B = Question.create!(step: step2, content: "J’estime que votre bien peut être vendu entre %s € et %s €", name: "estimation-votre-maison")

question5C = Question.create!(step: step2, content: "Très bien, mais n’oubliez pas de faire appel à plusieurs professionnels pour comparer les estimations effectuées.
Cela dit, attention à ne jamais signer de contrat d’exclusivité avec une agence !", next_question_name: "frais-notaire")


################################QUESTION6#######################################

question6A = Question.create!(step: step2, content: "Et si nous parlions un peu des frais de notaire :

Les frais de notaire sont acquittés par l’acheteur et comprennent les frais et débours (l’ensemble des sommes acquittées par le Notaire pour le compte du client) et les émoluments (la rémunération du notaire).

Pour donner un ordre d’idée, ces frais sont compris entre 2% et 3 % du prix de vente pour un bien neuf et peuvent aller jusqu’à 8 % du prix de vente pour un bien ancien.

Utile à savoir, non ?", name: "frais de notaire", next_question_name: "creation-annonce")


################################QUESTION7#######################################

question7A = Question.create!(step: step3, content: "Nous allons désormais pouvoir créer l’annonce de vente de votre bien.", name: "creation-annonce")


question7B = Question.create!(step: step3, content: "Ça y est, votre annonce est créée ! Vous pouvez la visualiser à tout instant sur votre espace personnel.")


################################QUESTION8#######################################

question8A = Question.create!(step: step3, content: "Regardez, je vous ai créé un agenda qui vous permettra de suivre en temps réel les demandes de visite de vos potentiels acheteurs !

Ici, vous pourrez accepter ou refuser les demandes de visite et bloquer les créneaux auxquels vous n’êtes pas disponible.

Vous recevrez aussi des notifications sur votre agenda téléphonique personnel pour vous rappeler les visites programmées !")


question8B = Question.create!(step: step3, content:
"Pour une meilleure expérience, essayez de vous ménager des plages horaires de disponibilité fixes afin de regrouper les visites et suffisamment grandes pour pouvoir dédier une journée ou a minima une demi-journée entière aux visites.")


################################QUESTION9#######################################

question9A = Question.create!(step: step3, content: "Comment choisir parmi les différentes offres d’achat ? Ce n’est pas toujours facile ! Voulez-vous des conseils ?")


response9A = Response.new(content: "Oui s'il-te-plait")
response9A.question = question9A
response9A.save!

response9B = Response.new(content: "Non merci")
response9B.question = question9A
response9B.save!

question9B = Question.create!(step: step3, content:
"Départager les différentes offres d’achat est loin d’être aussi évident que cela en a l’air.

  - Le prix proposé est évidemment l’argument numéro 1 à regarder de près : l’acheteur a-t-il proposé un prix égal ou inférieur à ce que vous demandiez ? Si le prix est inférieur, entre-t-il tout de même dans la marge de négociation que vous étiez prêts à céder ?

  - L’apport personnel et les moyens de financement de l’acheteur sont également essentiels : avez-vous vérifié la solvabilité de votre acheteur ? Sachez que si votre acheteur n’obtient pas ses financements, il pourra retirer purement et simplement son offre.

Privilégiez donc les acheteurs faisant des offres sans condition suspensive de crédit pour garantir de vendre votre bien rapidement ou la présence d’accord de principe d’une banque.")


question9C = Question.create!(step: step3, content: "Aucun problème ! Voyons la suite.")


################################QUESTION10######################################

question10A = Question.create!(step: step3, content: "Quand comptez-vous vendre et libérer votre bien ?")


response10A = Response.new(content: "Dans moins de 6 mois")
response10A.question = question10A
response10A.save!

response10B = Response.new(content: "Dans plus de 6 mois")
response10B.question = question10A
response10B.save!

question10B = Question.create!(step: step3, content: "Il s’agit donc d’une vente classique.")

question10C = Question.create!(step: step3, content: "Il s’agit donc d’une vente longue.
N’oubliez pas de notifier vos futurs acheteurs que votre bien ne sera pas immédiatement disponible.
Si votre acheteur est pressé, regardez les solutions de location existantes ou de prêt relais. ")


################################QUESTION11######################################

question11A = Question.create!(step: step3, content: "Qu’en est-il de la négociation avec un potentiel acheteur ? Besoin de conseils ?")


response11A = Response.new(content: "Avec plaisir !")
response11A.question = question11A
response11A.save!

response11B = Response.new(content: "Non merci")
response11B.question = question11A
response11B.save!

question11B = Question.create!(step: step3, content:
"L’anticipation du prix

Avant tout, il faut bien connaître la valeur de son bien (pour ça vous avez l’estimation que nous vous avons proposé précédemment). A partir de là, vous pouvez fixer le prix minimum jusqu’auquel vous êtes prêt à descendre.

Anticipez également la marge de négociation de l’acheteur : d’après les derniers relevés, elle est d’environ 3,2% pour les appartements et de 3,9% du prix de vente pour les maisons. Il est probable que l’acheteur cherche à baisser le prix de manière correspondante.

N’hésitez surtout pas à faire une contre-proposition à l’acheteur pour atteindre le prix maximum souhaité.")


question11C = Question.create!(step: step3, content:
"La déductibilité du mobilier sur les frais de notaire

Sachez que votre acheteur a le droit de déduire du prix d’achat de votre bien le prix des meubles que vous lui avez laissé, ce qui lui permet de diminuer les frais de notaire.
Dans le calcul : les frais de notaire sont un pourcentage du prix de vente de la maison. L’acheteur vient soustraire le prix des meubles que vous laissez pour adapter le montant des frais de notaire.

Vous n’êtes pas directement impacté par ce processus puisque cela vient uniquement réduire les frais acquittés par l’acheteur. Néanmoins, c’est à vous d’effectuer cette démarche (du moins si votre acheteur vous sollicite). Alors autant être prêt !

Votre acheteur pourrait alors vous demander de réaliser l’inventaire des meubles non-scellés de votre bien (ceux non fixés et démontables sans détérioration tels le mobilier et l’électroménager) que vous laissez dans votre bien et de lui fournir leur prix.")


question11D = Question.create!(step: step3, content:
"L’acompte

Il est courant de demander un acompte à l’acheteur afin de le décourager à se retirer de la vente sans motif et ainsi vous protéger.

Le montant de l’acompte demandé est libre (maximum de 10% du prix de vente). A noter : certains acheteurs ne seront pas très réceptifs à l’idée de verser une telle somme. A vous de juger si vous souhaitez tout de même insister et pour quel montant.

L’acompte est ensuite bloqué par votre notaire lors de la signature du compromis.

Si l’acquéreur se retire après le délai de rétractation sans raison prévue par une clause suspensive, l’acompte vous sera versé pour compenser la perte de temps et d’argent généré.")


question11E = Question.create!(step: step3, content:
"Le type de vente a-t-il un impact sur la négociation ?

Si vous optez pour une vente longue, cela peut générer des désagréments et des frais supplémentaires pour votre acquéreur notamment des frais de location ou de garde meubles.  Celui-ci tentera alors certainement de négocier le prix d’acquisition de votre bien.

Prévoyez donc une marge de négociation ou une réduction de l’acompte demandé pour ce cas de figure

A vous de jouer !")


question11F = Question.create!(step: step3, content: "Très bien, soyez tout de même vigilant.")


################################QUESTION12######################################

question12A = Question.create!(step: step4, content: "Vous avez trouvé votre acheteur ? Il est maintenant temps de passer à la phase de rédaction du contrat de vente. Connaissez-vous les différents contrats à votre disposition ?")


response12A = Response.new(content: "Je les connais déjà")
response12A.question = question12A
response12A.save!

response12B = Response.new(content: "Non, pouvez-vous m’éclairer ?")
response12B.question = question12A
response12B.save!

question12B = Question.create!(step: step4, content: "Parfait !")


question12C = Question.create!(step: step4, content:
"Vous pouvez avoir recours pour votre vente à la promesse unilatérale de vente et au compromis de vente.

Je vous déconseille d’utiliser la promesse unilatérale puisqu’elle n’engage que vous : l’acheteur est libre d’acheter ou non votre bien, sans justification en cas de refus.

Au contraire, le compromis de vente scelle définitivement l'accord entre vous deux  (l’acheteur disposera uniquement d’un délai de rétractation de 10 jours) et fixe les modalités exactes de la vente en attendant la signature de l'acte définitif.

Le délai entre compromis et vente est généralement de 3 mois.")


################################QUESTION13######################################

question13A = Question.create!(step: step4, content: "Avez-vous déjà entendu parler du droit de préemption ?")


response13A = Response.new(content: "Oui, je connais déjà.")
response13A.question = question13A
response13A.save!

response13B = Response.new(content: "Non, je veux bien en apprendre plus.")
response13B.question = question13A
response13B.save!

question13B = Question.create!(step: step4, content: "Continuons alors.")


question13C = Question.create!(step: step4, content:
"Définition du droit de préemption

Si votre bien se situe dans une zone de préemption urbaine (zone définie par la mairie de votre ville), la mairie a la possibilité de préempter votre bien dans un délai de 2 mois (suivant la réception d’une déclaration envoyée par votre notaire). Cela signifie donc que votre vente ne pourra réellement être conclue qu’à l’issue de ce délai (soit minimum 2 mois après la signature du compromis).

N’hésitez pas à contacter le service urbanisme de votre mairie pour vérifier si votre maison se situe dans l’une de ces zones.")

question13D = Question.create!(step: step4, content:
"Que signifie préempter ?

C’est le fait pour la mairie de racheter votre bien au prix convenu avec votre acquéreur à sa place.")

question13E = Question.create!(step: step4, content:
"Pouvez-vous agir contre cette décision ?

Votre acheteur et vous, pouvez néanmoins agir contre cette action si la mairie l’a réalisée sans objectif d'opération d'aménagement urbain. N’hésitez pas à vous entretenir avec votre notaire pour de plus amples informations.")


################################QUESTION14######################################

question14A = Question.create!(step: step4, content: "Souhaitez-vous obtenir un aperçu du compromis de vente et des conseils sur les clauses à regarder de près ?")



response14A = Response.new(content: "Non merci, je fais confiance à mon notaire.")
response14A.question = question14A
response14A.save!

response14B = Response.new(content: "Oui, je préfère garder la main sur l’acte.")
response14B.question = question14A
response14B.save!

question14B = Question.create!(step: step4, content: "Très bien, n’oublions pas que le notaire est un professionnel qualifié qui saura éviter toute erreur dans le contrat, néanmoins conservez un droit de regard sur certaines clauses pour vous assurer de ne pas passez à côté de garanties et de protections additionnelles.")


question14C = Question.create!(step: step4, content:
"Très bien, voici donc quelques conseils précieux.

Le compromis doit obligatoirement contenir les clauses suivantes :

  - L’identification du prix de vente du bien immobilier
  - La description détaillée du bien ainsi que des équipements qu’il contient
  - La date de disponibilité du bien
  - Les modalités de paiement du bien
  - Le montant des honoraires du notaire chargé de la transaction (Rappel : environ 2 à 3 % dans le neuf, jusqu’à 8 % pour l’ancien. Néanmoins, il faut demander confirmation du montant exact à votre notaire).")


question14D = Question.create!(step: step4, content:
"Pour vous protéger, il est possible d'ajouter certaines clauses spécifiques dans le compromis de vente, en concertation avec l'autre partie :

  - Les clauses suspensives suspendent l'exécution du contrat jusqu'à ce que certains événements définis se produisent et enclenchent alors la vente.

  - Les clauses résolutoires permettent à l'inverse le bon déroulement du contrat mais l'annulent si des événements définis se réalisent (par exemple : la non-obtention d'un permis de construire...)

  - Les clauses de dédit permettent à chacune des parties de renoncer à la transaction contre le versement d'une somme convenue à l'avance.

  - La clause d’acompte, comme nous en avons parlé plus haut, permet de vous protéger contre le retrait de l’acheteur au-delà du délai de rétractation et en l’absence de clause suspensive prévoyant le cas de figure en question.")


################################QUESTION15######################################

question15A = Question.create!(step: step4, content: "Souhaitez-vous obtenir un modèle de contrat?")


response15A = Response.new(content: "Oui")
response15A.question = question15A
response15A.save!

response15B = Response.new(content: "Non")
response15B.question = question15A
response15B.save!

question15B = Question.create!(step: step4, content: "Voici un modèle de compromis :")


question15C = Question.create!(step: step4, content: "Passons à la suite, dans ce cas.")


################################QUESTION16######################################

question16A = Question.create!(step: step4, content: "Attention au délai de rétractation de l’acheteur ! En savoir plus ?")


response16A = Response.new(content: "Oui")
response16A.question = question16A
response16A.save!

response16B = Response.new(content: "Non")
response16B.question = question16A
response16B.save!

question16B = Question.create!(step: step4, content:
"Qu’est-ce que le droit de rétractation ?

La loi française (Loi Macron du 6 août 2015) donne la possibilité à l’acheteur de se rétracter après un compromis de vente lorsque le bien vendu est à usage d'habitation et uniquement pour les acquéreurs personnes physiques (les sociétés ne bénéficient pas du délai de rétractation).")


question16C = Question.create!(step: step4, content:
"Quel est le délai de rétractation ?

Le délai est de 10 jours et commence à courir au lendemain de la signature du compromis de vente et permet à l’acheteur de se retirer de la vente en récupérant les fonds engagés (le dépôt de garantie) et sans avoir à invoquer un quelconque motif.

Le délai intègre les jours ouvrés, le week-end et les jours fériés.

Attention : Si le 10e jour tombe sur un jour chômé, le délai est prolongé automatiquement jusqu’au jour ouvrable suivant.

Remarques :
  - Le délai de rétractation ne fait pas obstacle aux clauses suspensives du compromis de vente.
  - Le délai de rétractation ne s’applique qu’à l’acheteur, sa signature vous engage de manière irréversible.")


question16D = Question.create!(step: step4, content:
"Quelques exemples :

Exemple 1 :
  - Lundi 3 juin : signature du compromis de vente devant notaire et remise d’un exemplaire à l’acheteur.
  - Mardi 4 juin : début du délai de 10 jours de rétractation.
  - Jeudi 13 juin à minuit : fin du délai de rétractation de 10 jours.

Exemple 2 : (10ème jour non ouvré : report au jour ouvrable suivant)
  - Jeudi 6 juin : signature du compromis de vente devant notaire et remise d’un exemplaire à l’acheteur.
  - Vendredi 7 juin : début du délai de rétractation de 10 jours.
  - Dimanche 16 juin à minuit : fin du délai de rétractation de 10 jours (étant donné que c’est un dimanche, la fin du délai est reportée au 1er jour ouvrable suivant, soit le lundi 17 juin).

Exemple 3 : (le délai de 10 jours inclut un ou plusieurs jours non ouvrés : ils sont comptés dans le délai des 10 jours)
  - Lundi 23 avril : signature du compromis de vente devant notaire et remise d’un exemplaire à l’acheteur
  - Mardi 24 avril : début du délai de rétractation de 10 jours.
  - Mardi 1er mai : jour férié qui n’impacte pas le décompte
  - Jeudi 3 mai à minuit : fin du délai de rétractation de 10 jours")

question16E = Question.create!(step: step4, content:
"Comment l’acheteur peut-il mettre en œuvre son droit de rétractation ?

L’acquéreur doit simplement envoyer un courrier recommandé avec avis de réception qui vous sera directement adressé ou à votre intermédiaire, votre notaire.

Attention : Dans ce cas de figure, vous devrez restituer le dépôt de garantie dans un délai de 21 jours à compter de la rétractation (c’est-à-dire le jour de réception du courrier recommandé).")


question16F = Question.create!(step: step4, content:
"L’hypothèse de la copropriété :

Comme nous l’avons dit plus haut, si le bien vendu dépend d’une copropriété, le délai de rétractation commencera uniquement à partir du jour où vous recevrez les documents supplémentaires requis de la part de votre acheteur.")


question16G = Question.create!(step: step4, content: "Très bien, continuons.")


################################QUESTION17######################################

question17A = Question.create!(step: step4, content: "Connaissez-vous déjà les modalités du dépôt de garantie ?")


response17A = Response.new(content: "Je connais !")
response17A.question = question17A
response17A.save!

response17B = Response.new(content: "Pas du tout, dis m'en plus.")
response17B.question = question17A
response17B.save!

question17B = Question.create!(step: step4, content: "Parfait")


question17C = Question.create!(step: step4, content:
"​​La signature du compromis s’accompagne généralement du versement de la somme de 5 à 10% du prix de vente par l’acquéreur. Ce versement est considéré  comme “dépôt de garantie” et sera soustrait du prix de vente.

Remarque : Si la vente est réalisée sans faire appel à un professionnel, aucun dépôt de garantie ne peut être demandé avant le délai de rétractation du compromis de vente.")


################################QUESTION18######################################

question18A = Question.create!(step: step4, content: "Dernière étape : la signature devant le notaire. Savez-vous comment cela se déroule ?")


response18A = Response.new(content: "Oui, je sais.")
response18A.question = question18A
response18A.save!

response18B = Response.new(content: "Non, je veux bien des informations.")
response18B.question = question18A
response18B.save!

question18B = Question.create!(step: step4, content:
"Génial ! Vous avez terminé toutes les étapes et vendu votre bien ! Je suis contente d’avoir pu vous accompagner dans votre aventure.

A bientôt.")


question18C = Question.create!(step: step4, content:
"​​L’acte authentique est signé en présence des deux parties (en cas d’absence, il est possible de se faire représenter au moyen d’une procuration).

Si l’acheteur ne se présente pas ou ne souhaite plus signer, vous devez tout de même vous rendre chez le notaire pour signer l’acte de vente. Le notaire constate l’absence de l’acheteur et vous pourrez ensuite effectuer des demandes de réparations (dommages et intérêts, voire exécution forcée de la vente).

Une fois l’acte authentique signé, le transfert des clés est effectué !")


question18D = Question.create!(step: step4, content:
"Génial ! Vous avez terminé toutes les étapes et vendu votre bien ! Je suis contente d’avoir pu vous accompagner dans votre aventure.

A bientôt.")

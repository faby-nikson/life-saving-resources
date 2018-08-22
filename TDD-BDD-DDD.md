test unitaire != micro test
unit = a definir par le developpeur pour s'aider lui meme à dev

test fonctionnel => plus haut niveau

tdd: tester par l'exemple
écrire un test pour le faire échouer, amener réflexion pour le corriger, pour ensuite refactor le code

refactor au fur et a mesure = important, mais nécessite des test pour pas tout péter!

atdd => acceptance test driven dev

oreinté point de vue métier et non technique

permet déviter de partir trop en vrille à ere trop bas

bdd =tdd orienté comportement => fonctionnel
behaviour domain devleopment

## bonne pratique:
declare(strict_types=1); => en haut de fichier

## DDD
domain knowledge
domain model
ubiquitous language

glossaire de termes à définir avant de commencer le projet

partir de l'exemple et use case plutôt que de partir sur du merise/uml

adaptateurs primaires = input sur le domain => ACTION sur le domain, point d'entrée, action principale (make reservation)
adaptateurs secondaires = output du domaine: le domaine fait des choses


Correction : 
https://github.com/lucascourot/PHPKataTrainReservation
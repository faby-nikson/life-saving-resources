<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [TDD / BDD / DDD](#tdd--bdd--ddd)
  - [Tools](#tools)
  - [Training](#training)
    - [tdd: tester par l'exemple](#tdd-tester-par-lexemple)
    - [bdd =tdd orienté comportement => fonctionnel](#bdd-tdd-orient%C3%A9-comportement--fonctionnel)
    - [DDD](#ddd)
    - [Correction](#correction)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

TDD / BDD / DDD
======

Tools
------

### Deptrac

https://github.com/sensiolabs-de/deptrac

Training
------

test unitaire != micro test
unit = a definir par le developpeur pour s'aider lui meme à dev

test fonctionnel => plus haut niveau

### tdd: tester par l'exemple

écrire un test pour le faire échouer, amener réflexion pour le corriger, pour ensuite refactor le code

refactor au fur et a mesure = important, mais nécessite des test pour pas tout péter!

atdd => acceptance test driven dev

oreinté point de vue métier et non technique

permet déviter de partir trop en vrille à ere trop bas

### bdd =tdd orienté comportement => fonctionnel

behaviour domain devleopment

### DDD

domain knowledge
domain model
ubiquitous language

glossaire de termes à définir avant de commencer le projet

partir de l'exemple et use case plutôt que de partir sur du merise/uml

adaptateurs primaires = input sur le domain => ACTION sur le domain, point d'entrée, action principale (make reservation)
adaptateurs secondaires = output du domaine: le domaine fait des choses

### Correction

https://github.com/lucascourot/PHPKataTrainReservation
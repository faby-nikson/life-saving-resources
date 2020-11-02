# Vue Js

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Misc](#misc)
  - [alias](#alias)
  - [computed: {}](#computed-)
- [vuecli](#vuecli)
- [Component](#component)
  - [V-model](#v-model)
  - [Bus](#bus)
- [Tools](#tools)
  - [Vuepress](#vuepress)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


Misc
------

### alias 

```
@ = v-on:
: = v-bind:
```


### computed: {}

Values mise en cache, sensées retourner des valeurs.
equivalent data, mais avec de la logique


vuecli
------
vue ui : lance l'UI de gestion de projets Vue


Component
------
firstName
`@click.native` => renvoi l'event au premier element root intérieur
mieux:
dans comoment : $listeners corrrepspond à tous les listerens du parent
$attrs tous les attr du parent, etc.

par convention : tout ce qui est défini par vue, y a un $ au début
this.$... = toutes les methodes, prop de Vue

`inheritAttrs: false` => permet de dire à Vue de ne pas héhriter à l'lément root tous les attributs du parent (sauf class, et style)


### V-model

`v-model = "foo"`
=> sucre syntaxique qui sert à remplacer :
`@input="payload => foo = payload" :value="foo"`

dans le component:

```javascript
props: {
    value: {]
}
this.$emit('input', payload)
methods: {
    inputEvent(e){
        this.$emit('input', e.target.value);
    }
}
```

```javascript
@input="inputEvent" equivalent ) 
@input="$emit('input', e.target.value)"
```

### Bus 

emiit et on sur une nouvelle insatnce de Vue.
A utiliser avec parcimonie, voir pas
utiliser un store d'appli à la place (Vuex)

Exercice : https://github.com/mathieutu/formation-vuejs-dolphi


Tools
------

### Vuepress

To make documentation:
https://vuepress.vuejs.org/config/#ga

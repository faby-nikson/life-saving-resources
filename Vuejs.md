Vue Js
======

Misc
------

### alias 
```
@ = v-on:
: = v-bind:
```

### arrow function equivalents:
```js
function(lol) {
   return 'ok';
}
(lol) => {'ok'}
lol=> 'ok'
(arrow function) => {
    sert à créer une fonction sans contexte. Ici "this" correspond au scope du dessus.
}
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
@click.native => renvoi l'event au premier element root intérieur
mieux:
dans comoment : $listeners corrrepspond à tous le slisterens du parent
$attrs tous les attr du parent, etc.

par covnention ; tout ce qui est défini par vue, y a un $ au début
this.$... = toutes le smethodes, prop de Vue

 inheritAttrs: false, => permet de dire à Vue de ne pas héhriter à l'lément root tous les attributs du parent (sauf class, et style)


### V-model

`v-model = "foo"`
=> sucre syntaxique qui sert à remplacer :
`@input="payload => foo = payload" :value="foo"`

dans le component:
props: {
    value: {]
}
this.$emit('input', payload)
methods: {
    inputEvent(e){
        this.$emit('input', e.target.value);
    }
}

@input="inputEvent" equivalent ) 
@input="$emit('input', e.target.value)"

### Bus 

emiit et on sur une nouvelle insatnce de Vue.
A utiliser avec parcimonie, voir pas
utiliser un store d'appli à la place (Vuex)

Exercice : https://github.com/mathieutu/formation-vuejs-dolphi


:house: [Back to home](../../README.md)
    
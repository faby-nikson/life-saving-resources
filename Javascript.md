<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Javascript](#javascript)
  - [ES6 tips](#es6-tips)
    - [String existence to boolean](#string-existence-to-boolean)
    - [Class](#class)
    - [Arrow function / Fat arrow](#arrow-function--fat-arrow)
    - [Destructuring](#destructuring)
  - [Dates](#dates)
  - [Flow](#flow)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Javascript
======

ES6 tips
------

### String existence to boolean

```javascript
const isValidName = !!name
```

### Class

```javascript
class Lol extends Rofl {
    constructor(params) {
        super(params)
        this.params = params
    }

    getParams(){
        return this.params;
    }
}
```

### Arrow function / Fat arrow

```javascript
(params) => {
    // Enables to create a contextless function. 
    // Here, `this` does not match with the function but with the parent scope.
}
```

```javascript
function(lol) {
   return 'ok';
}
// Equivalent to:
(lol) => {'ok'}
// Equivalent to:
lol=> 'ok'
```

### Destructuring

```javascript
const func3 = arg => ({ val: arg + 3 })

const {a , b} = object // consta a = object.a; const b = object.b;

const id = 'lol';
const object3 = {id} //{ id: 'lol'}

const objectA = { [a]: b } // [a] retourne la valeur de a comme clé
```

Dates
------

Use the library `moment`



Flow
-----
Facebook library.

Used to type your javascript variables.


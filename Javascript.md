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


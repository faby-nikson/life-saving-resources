<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [React Native](#react-native)
  - [With Expo](#with-expo)
  - [Install](#install)
    - [Create an app](#create-an-app)
    - [Environement: react-navigation, native-base, etc.](#environement-react-navigation-native-base-etc)
  - [Without Expo](#without-expo)
  - [Components](#components)
  - [Ajout d'une librairie mixte](#ajout-dune-librairie-mixte)
  - [Story book](#story-book)
  - [Misc](#misc)
    - [Put view elements in a variable](#put-view-elements-in-a-variable)
    - [setState is ayschnronous](#setstate-is-ayschnronous)
    - [KeyboardAvoidingView](#keyboardavoidingview)
  - [Stores](#stores)
    - [Redux](#redux)
    - [Mobx](#mobx)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

React Native
======

With Expo
------

## Install

- Package npm expo-cli (`npm install -g expo-cli`)
- Device iOS/Android with **Expo** app.

:warning: Ubuntu: Cut your firwall

https://askubuntu.com/questions/1052919/iptables-reload-restart-on-ubuntu-18-04


### Create an app

```
expo init --verbose <my-app>
cd my-app
expo start
```

### Environement: react-navigation, native-base, etc.

```
npm i -s react-navigation
npm i -s native-base
```



Without Expo
-------

Installation de react-native

```
npm i -g react-native-cli
```

Création d'un projet
```
react-native init <project_name>
```

Exécution du projet
```
react-native run-android
react-native run-ios
```


Components
------

https://nativebase.io/


Ajout d'une librairie mixte
------

Installation du npm
```
npm i <package_name>
```

Configuration des projets Natifs
```
react-native link
```


Story book
------

It displays every component in a style guide.
Useful to test each component


Misc
------

### Put view elements in a variable

```javascript
  render() {
    const MyView = this.state.loading ? <Navigator /> : <Spinner />
      return (
          <MyView />
      )
  }
```

### setState is ayschnronous

```javascript
this.setState({ message : null })
```

### KeyboardAvoidingView

It's like a View, but prevent your keyboard to hide your view when it opens.

Stores
-----

### Redux

Quite long to implement, but very efficient.

Based on Flux workflow. 

Store `=notify=>` View `=dispatch=>` Action `=Catched by=>` Reducer `=Modify=>` Store

Debbuger de OUF à l'intérieur (avec debug pas à pas, retour en arrière, etc.)

### Mobx

Based on Flux workflow.

Easier to implement.

Works with annotations.
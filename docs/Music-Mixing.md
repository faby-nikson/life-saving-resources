# Music projects guidelines

## Start a new record

### Create the project

- Create a folder: `MixV{version}` -> `MixV1`
- Create a cubase project: `{name} - MixV{version}-{tempo}bpm-00.cpr` -> `My Song - MixV1-128bpm-00.cpr`

### Record

- Check the input sound
	+ Input signal must be between -18dbs and -12dbs at top
- Record every part several times (at least 2, or 3)
	+ It will be easier to correct the small details
- Optional: you can record a part twice, in 2 different tracks
	+ it can provide a louder and better global sound

### Track quality

Once everything is properly recorded:
- Remove unused media and clean the bin
- Cut the empty tracks and handle silences
- Handle fade in/fade out between two tracks
- Perform the gain staging job:
	+ Mettre toutes les pistes à 0, et harmoniser les volumes avec le pre-gain
	+ Toutes les pistes doivent avoir le même volume
	+ (Optional) Tester en inversant les phases pour voir si le volume est meilleur
	+ /!\ Le volume de sortie ne doit pas dépasser -6db

## Start to mix

### Handle the equalizer

- Check the presets
- Virer les fréquences non voulues, et faire ressortir les fréquences voulues
	+ En général, les fréquences audibles sont entre 300 et 600 hz : le son principal est là
- Si 2 instrument se marchent dessus : tester en inversant les courbes d’EQ :
	+ instrument 1:  /\/\/ 
	+ instrument 2 : \/\/\

### Add compressors

- Mettre en place un compresser sur les pistes à harmoniser
- Remonter le db de sortie pour avoir le même volume avec ou sans l’effet
- Utiliser des preset pour faciliter
- Tester les compresser vintage et cube, ils ont des sons intéressants. tester les presets
- Attack: quand 0 alors tout est compressé, si > 0 alors il laisse passer des choses brutes.
- La courbe / : le premier point indique à partir de quand il se déclenche, et le 2ème point est à quelle violence il agit

### Play with volumes et paner

- Jouer avec le volume et le panner légèrement pour faire ressortir des éléments
- L’instrument principal doit être au volume 0

### Add effects

- Mettre les EQ dans une piste FX
- Mettre les effets dans un bus (genre reverb). - Avantage : tu peux mettre un eq en plus juste sur l’effet et non sur la piste
- Mettre la reverb en dernier
- Le volume de l’enregistrement en sortie avec tous les effets ne doit pas dépasser -2db (pour laisser de la place au mastering)
- Export as WAV for the Mastering

## Start a new master

### Create the project

- Create a folder: `MasterMixV{mix version}`
	+ “MasterMixV2” for “Mix V2”
- Create a cubase project: `{name}_MixV{version}_MASTER-00.cpr`

### Pre-Mastering

- Export the mix as WAV and import it in the master project
- Set the song delimiters as you want
- (Optional) Global Fade-in / fade-out
- (Optional) Add effects
	+ Add EQ to higher certain frequence
	+ Add a compressor?
- Export as WAV

### Mastering

- Upload the WAV to https://app.landr.com/
- Publish it
- Archive it:
	+ Google Drive : Remove all the useless files
	+ Cubase projects: Make a save of the mix folder

## Annexes: Good sound examples

Guitare
- useless id - dying love
- Asian kung fu generation

Bass
- bomb factory - days
- standoff - sunrise
- getting soda the world is a beautiful place
- bass live thrice
- Paramore now & bricks


# Recording tips

## Start a new project

- Create a folder: `Mix V{version}` -> `Mix V1`
- Create a cubase project: `{name} - v{version}-{tempo}bpm-00.cpr` -> `My Song - v1 - 128bpm-00.cpr`

## Record

- Check the input sound in the Sound card
	+ Input signal must be between -12dbs and -6dbs at top
- Record every part several times (at least 2, or 3)
	+ It will be easier to correct the small details

⚠️ Tester l'inversion de phase si le volume semble trop bas

## Tips

- You can record a part twice, in 2 different tracks
	+ it can provide a louder and better global sound

## Track quality

Once everything is recorded:
- Remove unused media and clean the bin
- Cut the empty tracks and handle silences
- Handle fade in/fade out between two tracks (with `x` key in Cubase)
- Perform the gain staging job:
    - Put every track volume to 0 
    - Use the `pre-gain` option to have all your tracks to the same max volume
	+ (Optional) Tester en inversant les phases pour voir si le volume est meilleur
	+ ⚠️The output volume must not be over `-6db`


# Recording tips

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Create the project](#create-the-project)
- [Record](#record)
- [Tips](#tips)
- [Track quality](#track-quality)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Create the project

- Create a folder: `MixV{version}` -> `MixV1`
- Create a cubase project: `{name} - MixV{version}-{tempo}bpm-00.cpr` -> `My Song - MixV1-128bpm-00.cpr`

## Record

- Check the input sound in the Sound card
	+ Input signal must be between -18dbs and -12dbs at top
- Record every part several times (at least 2, or 3)
	+ It will be easier to correct the small details

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
	+ ⚠️THe output volume must not be over `-6db`


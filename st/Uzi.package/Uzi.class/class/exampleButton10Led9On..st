examples
exampleButton10Led9On: programBuilder
	^ programBuilder
		script: #button10Led9
		ticking: true
		delay: 0
		instructions: [:uzi | uzi
			push: 9;
			push: 10;
			prim: #read;
			prim: #write]
examples
examplePot15Led9On: programBuilder
	^ programBuilder
		script: #pot15Led9
		ticking: true
		delay: 0
		instructions: [:uzi | uzi
			push: 9;
			push: 15;
			prim: #read;
			prim: #write]
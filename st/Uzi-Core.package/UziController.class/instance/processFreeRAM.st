receiving
processFreeRAM
	| next valueArduino valueUzi |
	next := [| val1 val2 val3 val4 |
		val1 := serial next.
		val2 := serial next.
		val3 := serial next.
		val4 := serial next.
		val1 << 24 bitOr: (val2 << 16 bitOr: (val3 << 8 bitOr: val4))].
	
	valueArduino := next value.
	freeArduinoRAM ~= valueArduino
		ifTrue: [	Uzi logger 
			log: 'Free Arduino RAM: %1 bytes' 
			format: { valueArduino };
			flush].
	freeArduinoRAM := valueArduino.
	
	valueUzi := next value.
	freeUziRAM ~= valueUzi
		ifTrue: [	Uzi logger 
			log: 'Free Uzi RAM: %1 bytes' 
			format: { valueUzi };
			flush].
	freeUziRAM := valueUzi.
	
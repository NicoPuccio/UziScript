receiving
processGlobalValue
	| count timestamp update |
	timestamp := [| val1 val2 val3 val4 |
		val1 := serial next.
		val2 := serial next.
		val3 := serial next.
		val4 := serial next.
		val1 << 24 bitOr: (val2 << 16 bitOr: (val3 << 8 bitOr: val4))] value.
	count := serial next.
	
	update := false.
	count timesRepeat: [| number val1 val2 val3 val4 |
		number := serial next.
		val1 := serial next.
		val2 := serial next.
		val3 := serial next.
		val4 := serial next.
		(self getGlobalName: number) ifNotNil: [:name |
			(self globalsReporting includes: name) ifTrue: [| value |
				value := (FloatArray new: 1) 
					basicAt: 1 
					put: (val1 << 24 bitOr: (val2 << 16 bitOr: (val3 << 8 bitOr: val4)));
					at: 1.
				(self getGlobal: name) addValue: timestamp -> value.
				update := true]]].
	update ifTrue: [self triggerEvent: UziEvents reportingUpdate]
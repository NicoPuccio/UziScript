as yet unclassified
test010PositionIsCorrectlyInitializedEvenIfTheEEPROMIsFullOfEndMarks
	| eeprom writer |
	eeprom := UziEEPROM size: 8.
	0 to: 7 do: [:i | eeprom write: i value: end].
	
	writer := UziEEPROMWearLevelingWriter on: eeprom.	
	self assert: 0 equals: (eeprom read: 0).
	self assert: begin equals: (eeprom read: 1).
	self assert: 2 equals: writer position
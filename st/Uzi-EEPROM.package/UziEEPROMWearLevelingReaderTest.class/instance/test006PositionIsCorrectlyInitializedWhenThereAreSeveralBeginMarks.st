tests
test006PositionIsCorrectlyInitializedWhenThereAreSeveralBeginMarks
	| eeprom reader |
	eeprom := UziEEPROM size: 256.
	eeprom write: 32 value: begin.
	eeprom write: 64 value: begin.
	eeprom write: 128 value: begin.
	eeprom write: 216 value: end.
	eeprom write: 218 value: begin.
	reader := UziEEPROMWearLevelingReader on: eeprom.
	self assert: 129 equals: reader position.
	self deny: reader atEnd 
	
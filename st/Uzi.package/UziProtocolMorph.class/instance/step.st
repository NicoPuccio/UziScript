stepping
step
	self borderColor: (self isConnected 
		ifTrue: [Color green] 
		ifFalse: [Color red]).
	connectButton label: (self isConnected 
		ifTrue: ['Disconnect']
		ifFalse: ['Connect...']).
	connectedText contents: self isConnected asString.
	portText contents: self portName.
	pinTexts keysAndValuesDo: [:pin :text |
		text value: (self getPinValue: pin)].
	globalTexts keysAndValuesDo: [:var :text |
		text value: (self getGlobal: var)]
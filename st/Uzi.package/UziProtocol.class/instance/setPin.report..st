reporting
setPin: pinNumber report: report
	| msg |
	msg := self send: {
		5. 
		pinNumber. 
		report ifTrue: [1] ifFalse: [0]
	}.
	report 
		ifTrue: [
			pinsReporting add: pinNumber.
			msg := msg, self startReporting]
		ifFalse: [
			pinsReporting remove: pinNumber ifAbsent: ["Do nothing"]].
		
	^ msg
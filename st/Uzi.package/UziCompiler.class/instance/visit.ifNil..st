visiting-utils
visit: anUziNode ifNil: aBlock
	^ anUziNode
		ifNil: aBlock
		ifNotNil: [anUziNode accept: self]
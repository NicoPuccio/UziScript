reading
next
	| tmp |
	buffer atEnd
		ifTrue: [self fillBuffer].
	tmp := buffer next.
	self class debugEnabled 
		ifTrue: [Uzi logger log: 'IN: %1' format: { tmp }; flush].
	^ tmp
parsing
parseOn: aStream
	| element position |
	position := aStream position.
	element := parser parseOn: aStream.
	aStream position: position.
	^ element
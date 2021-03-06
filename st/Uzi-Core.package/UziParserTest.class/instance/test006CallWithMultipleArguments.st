tests
test006CallWithMultipleArguments
	| pp ast |
	pp := parser call end.
	ast := pp parse: 'toggle(D13, 1, 0.5,-3)'.
	self assert: #toggle equals: ast selector.
	self assert: 4 equals: ast arguments size.
	self assert: 13 equals: ast arguments first value value.
	self assert: 1 equals: ast arguments second value value.
	self assert: 0.5 equals: ast arguments third value value.
	self assert: -3 equals: ast arguments fourth value value
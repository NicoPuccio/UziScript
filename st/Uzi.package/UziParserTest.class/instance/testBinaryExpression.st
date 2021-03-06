grammar-messages
testBinaryExpression
	| pp send send2 |
	pp := UziParser new binaryExpression.
	send := pp parse: '+ 2 foo'.
	self assert: send receiver = nil.
	self assert: send selector = #+.
	self assert: send arguments size = 1.
	send2 := send arguments first.
	self assert: send2 receiver value = 2.
	self assert: send2 selector = #foo.
	self assert: send2 arguments = #()
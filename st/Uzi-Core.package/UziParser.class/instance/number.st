grammar-literals
number
	^ ws, (float / integer) token , ws
	map: [:ign1 :token :ign2 | 
		(UziNumberLiteralNode value: token parsedValue)
			token: token]
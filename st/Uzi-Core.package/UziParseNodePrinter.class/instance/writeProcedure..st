visiting
writeProcedure: node
	self indent; 
		write: 'proc {1}(' format: { node name }.
	node arguments 
		do: [:arg | self write: arg name]
		separatedBy: [self write: ', '].
	self write: ') ';
		visit: node body
	
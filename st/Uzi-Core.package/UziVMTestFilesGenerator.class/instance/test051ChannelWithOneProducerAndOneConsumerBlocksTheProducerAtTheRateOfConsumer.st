tests
test051ChannelWithOneProducerAndOneConsumerBlocksTheProducerAtTheRateOfConsumer
	| program |
	program := '
	import c from ''Channel.uzi'';

	task producer() running {
		var a = 1;
		forever {
			c.send(a);
			a = 1 - a;
			write(D11, a);
		}
	}

	task consumer() running 1/s {
		write(D13, c.receive());
	}'.
	self writeFile: 'Test051ChannelWithOneProducerAndOneConsumerBlocksTheProducerAtTheRateOfConsumer'
		program: program
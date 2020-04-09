Btled {
	var <>button ,<>led  ;

*new { arg button, led ;

^super.newCopyArgs(button,led);

	}

	//enable{ if(keytohold == nil ,{},{OSCdef(keytohold).enable})}
	//disable{if(keytohold == nil ,{},{OSCdef(keytohold).disable;})

	// Stream and Pattern support
	next {^this.button.next}
	reset {}
	embedInStream {



fork{var  onoff_at_end = this.button.value;
	this.led.value_(if( onoff_at_end	== 1, {0},{1}));
    0.1.wait;
    this.led.value_(onoff_at_end);
    };

		//^this.blink;
		^this.button.embedInStream

	}

	value {^this.button.value}





}

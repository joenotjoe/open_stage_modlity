b = NetAddr.new("127.0.0.1", 8080);    // create the NetAddr





(
~desc1In = (
    idInfo: ( srcPort: NetAddr.langPort, ipAddress: "127.0.0.1" ),
    netAddrInfo: ( srcPort: 8080, ipAddress: "127.0.0.1", recvPort: 57120 ),

    protocol: \osc,
    elementsDesc: (
        elements: [
            (
                key: 'bt',
                oscPath: '/toggle_1',
                elementType: 'button',
                ioType: \in,
                spec: \but
            )
        ]
    )
);
)


m = MKtl( \example1in, ~desc1In );
// give the single button an action
m.elementAt(\bt).action = { |el| ["yo", el.value].postln };

// test that the action works
m.elementAt(\bt).doAction;
m.elementAt(\bt).valueAction_(1);
m.elementAt(\bt).valueAction_(0);

// create a gui for the osc device:
m.gui.parent.alwaysOnTop = true;
// post incoming OSC data
m.trace;

// and now simulate sending values from an OSC device by network:
n = NetAddr("127.0.0.1", NetAddr.langPort); // fake device address
n.sendMsg('/button', 0);
n.sendMsg('/button', 1);






~desc1In.at(\elementsDesc).at(\elements).at(0).at(\key);
~desc1In.at(\elementsDesc).at(\elements).at(0).at(\oscPath);








~file = JSONFileReader.read("/home/joe/Desktop/testb.json");



	~file.at("tabs").do{arg item; "\n".postln; item.at("widgets").do{arg itemb; itemb.at("type").postln;} ;}



//has to be in quotes ""






~file.at("tabs").at(0).at("widgets").at(0).at("type")
~file.at("tabs").at(0).at("widgets").at(0).at("address");
~file.at("tabs").at(0).at("widgets").at(0).at("id");


~protobt.at(\oscPath);

~qq = ~file.at("tabs").do{arg item;  item.at("widgets");}

~qq.postln;



~desc1In


~protobt =   (
                key: 'bt',
                oscPath: '/toggle_1',
                elementType: 'button',
                ioType: \in,
                spec: \but
            );


(
~desc1In = (
    idInfo: ( srcPort: NetAddr.langPort, ipAddress: "127.0.0.1" ),
    netAddrInfo: ( srcPort: 8080, ipAddress: "127.0.0.1", recvPort: 57120 ),

    protocol: \osc,
    elementsDesc: (
        elements: [

        ]
    )
);
)
~widgets_count = ~file.at("tabs").at(0).at("widgets").size-1;


~type =       ~file.at("tabs").at(0).at("widgets").at(~widgets_count).at("type").asSymbol;
~osc_adress =   ~file.at("tabs").at(0).at("widgets").at(~widgets_count).at("address").asSymbol;
~id =         ~file.at("tabs").at(0).at("widgets").at(~widgets_count).at("id").asSymbol;



~protobt.put(\key,~id);
~protobt.put(\oscPath,~osc_adress);

~protobt
~desc1In.at(\elementsDesc).at(\elements).add(~protobt)

~desc1In


//-----

(

~desc1In = (
    idInfo: ( srcPort: NetAddr.langPort, ipAddress: "127.0.0.1" ),
    netAddrInfo: ( srcPort: 8080, ipAddress: "127.0.0.1", recvPort: 57120 ),

    protocol: \osc,
    elementsDesc: (
        elements: [(
			key: \toggle,
			elements: []
		)]


    )
);

~protobt.copy;
~protobt =   (
                key: 'bt',
                oscPath: '/toggle_1',
                elementType: 'button',
                ioType: \in,
                spec: \but
            );
~file = JSONFileReader.read("/home/joe/Desktop/testb.json");

~file.at("tabs").at(0).at("widgets").do{arg widget; var proto;  widget.postln;

	proto = ~protobt.copy;


	if ( widget.at("type") == "toggle", {"a toggle is born".postln;

		proto.put(\key,widget.at("id"));
        proto.put(\oscPath,widget.at("address"));

	});

~desc1In.at(\elementsDesc).put(\elements ,~desc1In.at(\elementsDesc).at(\elements)++[proto])



};
)








~desc1In.at(\elementsDesc).at(\elements).at(\toggle)

~desc1In.at(\elementsDesc).at(\elements).add(~protobt);
m = MKtl( \example1in, ~desc1In );
// give the single button an action
m.elementAt(\bt).action = { |el| ["yo", el.value].postln };

m.elAt(\toggle_3); // returns the buttons
~file.at("tabs").at(0).at("widgets").do{arg widget; widget.postln;}


~desc1In


m.postElements;     // post element names and keys/indices in hierarchical order





-----------------------------------------------------------------
(
// ...

top key should be root,  then tabs then contaners each can have widgets

start with grouoe name for toggle

all toggle s in a groupe tab-toggle


tab_1-toggle
tab_1-switch
tab_one-fader
      fader_1
      fader_2...


elementsDesc: [ // the elementsDesc of the whole device
    (
        key: \top,  // name of this group,
                    // all elements use cc and midichan 0
        shared: (midiChan: 0, midiMsgType: \control),

                    // the elements descriptions:
        elements: [
                    // a group of 2 sliders
            (
                key: \sl,   // group name
                    // they share elementType and spec
                shared: (elementType: \slider, spec: \midiCC ),
                elements: [

                    ( key: \1, midiNum: 21 ),
                    ( key: \2, midiNum: 22 )
                ]
            ),
                    // a group of 2 buttons
            (
                key: \bt,
                    // they share elementType and spec
                shared: (elementType: \button, spec: \midiBut),
                elements: [
                    ( key: \1, midiNum: 41 ),
                    ( key: \2, midiNum: 42 )
                ]
            )
        ]
    )
]
)


//--------------------------------------





~file = JSONFileReader.read("/home/joe/Desktop/testb.json");


~format_toggle  =

	{
		arg open_stage_file; var outarray = [];


		open_stage_file.at("tabs").at(0).at("widgets").do{arg widget;



	if ( widget.at("type") == "toggle", {
				outarray =	outarray ++ [(\key:{widget.at("id")}.value,\oscPath:{widget.at("address")}.value)];
				outarray.postln;
	});

	};
	outarray;
	};

~format_fader  =

	{
		arg open_stage_file; var outarray = [];


		open_stage_file.at("tabs").at(0).at("widgets").do{arg widget;



	if ( widget.at("type") == "fader", {
				outarray =	outarray ++ [(\key:{widget.at("id")}.value,\oscPath:{widget.at("address")}.value)];
				outarray.postln;
	});

	};
	outarray;
	};





~format_led  =

	{
		arg open_stage_file; var outarray = [];


		open_stage_file.at("tabs").at(0).at("widgets").do{arg widget;



	if ( widget.at("type") == "led", {
				outarray =	outarray ++ [(\key:{widget.at("id")}.value,\oscPath:{widget.at("address")}.value)];
				outarray.postln;
	});

	};
	outarray;
	};











//	"\n".postln;
//~format_toggle.value(~file);

//MKtl.elementTypesUsed


//MKtl.globalSpecs.keys;

//Spec.specs.keys;

(
~desc1In = (
    idInfo: ( srcPort: NetAddr.langPort, ipAddress: "127.0.0.1" ),
    netAddrInfo: ( srcPort: 8080, ipAddress: "127.0.0.1", recvPort: 57120 ),

    protocol: \osc,
    elementsDesc: (
        elements: [
            (
                key: 'toggle',
				shared: (elementType: 'button',
                ioType: \in,
                spec: \but),
				elements:~format_toggle.value(~file);

            ),



			(
                key: 'fader',
				shared: (elementType: 'kb',
                ioType: \in,
                ),
				elements:~format_fader.value(~file);

            ),

			(
                key: 'led',
				shared: (elementType: 'led',
                ioType: \out,
                ),
				elements:~format_led.value(~file);

            ),


(
key: '\bts',
shared: (
    elementType: 'button',
	ioType: \in16
),
elements: 8.collect { |col|

        (argTemplate: [ col])
    })





        ]
    )
);
)





m = MKtl( \example1in, ~desc1In );

~seq = m.elAt(\toggle); // returns the buttons
~seqb = m.elAt(\fader); // returns the buttons
~seql = m.elAt(\led); // returns the buttons


 m.elAt(\bts); // returns the buttons


SynthDef(\help_saw,
	{ arg out=[0,1], freq=440, sustain=0.05,dur =0.5,amp = 0.5;
		var env;
		env = EnvGen.kr(Env.perc(0.01, sustain, 0.2), doneAction:2);
		Out.ar(out,amp* Saw.ar(freq, env))
	}).add;




m.elAt( \toggle ).asArray.at(0)


~seq = [];


8.do{arg io  ;

	~seq= ~seq.add(
Btled.new(m.elAt( \toggle).asArray.at(io),
		m.elAt( \led).asArray.at(io));

)};





Pfuncn

Pbind(\instrument,\help_saw,
	\degree, (Pseq(~seqb,inf)*12).abs,
    \dur, Prand([0.4], inf),
		\amp,Pseq(~seq,inf),

	\octave, 5,

).play;






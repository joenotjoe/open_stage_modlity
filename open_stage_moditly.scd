
b = NetAddr.new("127.0.0.1", 8080);    // create the NetAddr


//opens file from Open stage controle

~file = JSONFileReader.read("/home/joe/Desktop/testb.json");

// gets setings from open stage controle
OSCFunc({|msg, time, addr, recvPort| \oneShot.postln; msg.at(2).postln; ~file = msg.at(2).asString.parseYAML; }, '/EDIT/GET', b).oneShot; //

b.sendMsg("/EDIT/GET", "127.0.0.1:57120","root" );



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



~format_range  = {
	arg open_stage_file; var outarray;


	open_stage_file.at("tabs").at(0).at("widgets").do{arg widget;



if ( widget.at("type") == "range", {

     outarray =	outarray ++
   [
		     (\key:{widget.at("id")}.value,
  elements: [
(
    key: 'fra',
    oscPath: {widget.at("address")}.value,
    elementType: 'slider',
    valueAt: 1,
    ioType: \in
),
			(
    key: 'feb',
    oscPath: {widget.at("address")}.value,
    elementType: 'slider',
    valueAt: 2,
    ioType: \in
			)],

	)];


				outarray.postln;
	});

	};




outarray;

};


~format_range.value(~file);




//

when you start working with encoder look at RelSet it will let you set vars with the encoder by incrimeting.

rgbled
meter
multixy
xy
patchbay
image
keyboard
rgb

fader should implemnt bilt in meter


// Image and text wigets are tricky Image can be set by file and the image class in suppercolider can copy anything in a windo so that would be one way to get soundfile imiges up the other  way  is to set up a comand line web server for a folder and do it that way.


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
			key: 'range',
			ioType: \in,
			elements:~format_range.value(~file);
			),







        ]
    )
);
)





m = MKtl( \example1in, ~desc1In );

~seq = m.elAt(\toggle); // returns the buttons
~seqb = m.elAt(\fader); // returns the buttons
~seql = m.elAt(\led); // returns the buttons
~range = m.elAt(\range);


// ok range keys are busted and the order is reversed it should go from top to botem left to right otherwise good.
~range.at("range_1")
~range.at(1).value;
 m.elAt(0); // returns the buttons

~range.keys;

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
    \dur, Prand([0.09], inf),
		\amp,Pseq(~seq,inf),

	\octave, 5,

).play;

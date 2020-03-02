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
        elements: [

        ]
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

	~desc1In.at(\elementsDesc).at(\elements)

~desc1In.at(\elementsDesc).at(\elements).add(~protobt);
m = MKtl( \example1in, ~desc1In );
// give the single button an action
m.elementAt(\bt).action = { |el| ["yo", el.value].postln };

m.elAt(\toggle_3); // returns the buttons
~file.at("tabs").at(0).at("widgets").do{arg widget; widget.postln;}


~desc1In


m.fullDesc;        // a dict loaded from the description file
m.fullDesc.keys;    // the keys of the items in it
m.protocol;            // e.g. the protocol used
m.elementsDesc;     // the dict of the elements described
m.postElements;     // post element names and keys/indices in hierarchical order

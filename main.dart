import 'dart:async';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
runApp(MyApp());
}


class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MaterialApp(
	title: 'Loading Page',
	theme: ThemeData(
		primarySwatch: Colors.red,
	),
	home: Splash2(),
	debugShowCheckedModeBanner: false,
	);
}
}
class Splash2 extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return SplashScreen(
	seconds: 6,
	navigateAfterSeconds: new SecondScreen(),
	title: new Text('Hello Mr. Arsh',textScaleFactor: 2,),
	image: new Image.network('https://raw.githubusercontent.com/arshmishra007/Myimage/master/46710047_913998058795115_5955385572276043776_n.jpg'),
	loadingText: Text("Loading"),
	photoSize: 100.0,
	loaderColor: Colors.red,
	);
}
}
class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with SingleTickerProviderStateMixin {
  AnimationController myanicontroller;

  var myanimation;
  var myanimation2;
  

  @override
  void initState() {
    super.initState();
    myanicontroller = AnimationController(vsync: this,duration: Duration(seconds: 1));


    myanimation=CurvedAnimation(parent: myanicontroller,curve: Curves.elasticInOut)
    
    ..addListener(() {
      setState(() {
        print(myanimation.value);
      });
    });

    myanimation2=CurvedAnimation(parent: myanicontroller,curve: Curves.easeInCirc)
    ..addListener(() {
      setState(() {
        print(myanimation2.value);
      });
    });

  }

  @override
  void dispose() {
    super.dispose();
    myanicontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       alignment: Alignment.center ,
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue[300],
      margin: EdgeInsets.all(20),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width:3)
            ),
            margin: EdgeInsets.all(50),
            alignment: Alignment.center,
            width: 500,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text('Arsh Mishra',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.email),
                  Text("Arsh@1234.com",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),

                  
                ],),
                SizedBox(
               width: 250.0,
  child: Center(
    child: ScaleAnimatedTextKit(
      onTap: () {
          print("Tap Event");
        },
      text: [
        "Be Different",
        "Be Optimistic",
        "Be Awesome"
        ],
      textStyle: TextStyle(
          fontSize: 30.0,
          fontFamily: "Canterbury",
          color: Colors.black,
      ),
    ),
  ),
),
              ],
            ),
          ),

       
        GestureDetector(
          onTap: ()
          {
            myanicontroller.forward(from: 0.5);
            print("clicked");
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage('https://raw.githubusercontent.com/arshmishra007/Myimage/master/46710047_913998058795115_5955385572276043776_n.jpg'),
              fit: BoxFit.cover,
              ),
            //  color: Colors.red,
            borderRadius: BorderRadius.circular(50),
            border :Border.all(
              color: Colors.red,
              width:3,
            )
            ),
            width: 50*myanimation2.value + 50,
            height: 50*myanimation2.value + 50,
          ),

        ),

        

        ],

     

      ),

     
    );
  }
}
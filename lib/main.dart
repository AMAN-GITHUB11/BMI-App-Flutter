import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BODY MASS INDEX CALCULATOR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  
  var bgcolor = Colors.indigo.shade400;

  var result = '';
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('Bmi', style: TextStyle(fontSize: 34,fontWeight: FontWeight.w700),),
              TextField(
                controller: wtController,
                decoration: const InputDecoration(
                  label: Text('Enter your weight in kgs'),
                  prefixIcon: Icon(Icons.line_weight)  
                ),
                keyboardType: TextInputType.number
              ),
              SizedBox(height: 11,),
              TextField(
                controller: ftController,
                decoration: const InputDecoration(
                  label: Text('Enter your height in feet'),
                  prefixIcon: Icon(Icons.height)  
                ),
                keyboardType: TextInputType.number
              ),
              SizedBox(height: 11,),
              TextField(
                controller: inController,
                decoration: const InputDecoration(
                  label: Text('Enter your height in inches'),
                  prefixIcon: Icon(Icons.height)  
                ),
                keyboardType: TextInputType.number
              ),
              SizedBox(height: 16,),
             ElevatedButton(onPressed: (){
              var wt = wtController.text.toString();
              var ft = ftController.text.toString();
              var inch = inController.text.toString();
        
              if(wt!='' && ft!=''&& inch!= '')
              {
                // bmi calculation
                var iwt = int.parse(wt);
                var ift = int.parse(ft);
                var iInch = int.parse(inch);
        
                var tInch = (ift*12) + iInch;
                var tCm = tInch*2.54;
                var tM = tCm/100;
                var bmi = iwt/(tM*tM);
                var msg = '';
                if(bmi>25){
                   msg = 'you are overweight!!';
                    bgcolor = Colors.orange.shade200;
                } else if(bmi<18){
                    msg = 'you are underweight!!';
                    bgcolor = Colors.red.shade200;
                }else{
                    msg = 'you are healthy!!';
                    bgcolor = Colors.green.shade200;
                }
                setState(() {
                result = '$msg \n your bmi is: ${bmi.toStringAsFixed(2)}';
              });
              }
              else
              {
              setState(() {
                result = 'Please fill all the required blanks';
              });
              }
             }, child: Text('Calculate')),
             SizedBox(height: 11,),
             Text(result, style: TextStyle(fontSize: 19),) 
              
            ],),
          ),
        ),
      )
    );
  }
}

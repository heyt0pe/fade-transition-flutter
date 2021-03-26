import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int step = 1;
  int total = 5;

  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  void _goBack() {
    if (step > 1) {
      setState(() {
        _controller.reset();
        _controller.forward();
        step -= 1;
      });
    } else {
      //Pop Navigator to former screen
    }
  }

  void _goForward() {
    if (step < total) {
      setState(() {
        _controller.reset();
        _controller.forward();
        step += 1;
      });
    } else {
      //Push navigator to new screen
    }
  }

  Widget _formOne() {
    return Column(
      children: [
        Text('This is form $step'),
        SizedBox(
          height: 25,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'First Name ',
            enabledBorder: OutlineInputBorder(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Last Name ',
            enabledBorder: OutlineInputBorder(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _formTwo() {
    return Column(
      children: [
        Text('This is form $step'),
        SizedBox(
          height: 25,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Email ',
            enabledBorder: OutlineInputBorder(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Password ',
            enabledBorder: OutlineInputBorder(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _formThree() {
    return Column(
      children: [
        Text('This is form $step'),
        SizedBox(
          height: 25,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'School ',
            enabledBorder: OutlineInputBorder(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Religion ',
            enabledBorder: OutlineInputBorder(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _formFour() {
    return Column(
      children: [
        Text('This is form $step'),
        SizedBox(
          height: 25,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Phone ',
            enabledBorder: OutlineInputBorder(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Card ',
            enabledBorder: OutlineInputBorder(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _formFive() {
    return Column(
      children: [
        Text('This is form $step'),
        SizedBox(
          height: 25,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'House ',
            enabledBorder: OutlineInputBorder(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Address ',
            enabledBorder: OutlineInputBorder(),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Step  $step/ 5'),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            _goBack();
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _goForward();
            },
            icon: Icon(
              Icons.arrow_forward,
            ),
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              color: Colors.purple,
            ),
            duration: Duration(milliseconds: 300),
            width: MediaQuery.of(context).size.width * (step / total),
            height: 15,
          ),
          SizedBox(
            height: 45,
          ),
          Center(
            child: FadeTransition(
              opacity: _animation,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: step == 1
                    ? _formOne()
                    : step == 2
                        ? _formTwo()
                        : step == 3
                            ? _formThree()
                            : step == 4
                                ? _formFour()
                                : _formFive(),
              ),
            ),
          ),
          SizedBox(
            height: 45,
          ),
        ],
      ),
    );
  }
}

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Sample App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String check ='';
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();


  checkLogin({required TextEditingController username,
    required TextEditingController password}) {

   if (username.text.isEmpty||password.text.isEmpty) {
      setState(() {
        check = 'Đăng nhập thất bại!';
      });
    }else{
      setState(() {
        check = 'Đăng nhập thành công!';
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 10),
          child: Column(children: [
            const Text('TutorialKart',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
            SizedBox(
                height: MediaQuery.of(context).size.height / 2.1,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Sign in',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: username,
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(fontSize: 17),
                            hintText: 'User Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: password,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(fontSize: 17),
                            hintText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const Text('Forgot Password',
                          style: TextStyle(color: Colors.blue)),
                      Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.0) //
                                      ),
                              color: Colors.indigo),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors
                                  .white, //change background color of button
                              backgroundColor: Colors.indigo,
                            ),
                           onPressed: () =>checkLogin(username: username,password: password),
                            child: const Text('Login'),
                          )),
                      const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Does not have accout?'),
                            SizedBox(width: 10),
                            Text('Sign in',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500))
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('$check',
                          style: TextStyle(color: Colors.red,fontSize: 22,fontWeight: FontWeight.bold))
                        ]
                      )
                    ]))
          ]),
        )
        );
  }
}


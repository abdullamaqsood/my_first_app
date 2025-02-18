import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 21, 81, 211),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Banking Wallet'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Account Balance Card
              Card(
                color: const Color.fromARGB(255, 40, 118, 182),
                elevation: 2,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ListTile(
                    title: Text(
                      'Account Balance',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'Rs. 180',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Circular Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: [
                      RawMaterialButton(
                        onPressed: () {},
                        elevation: 2.0,
                        fillColor: const Color.fromARGB(255, 79, 61, 213),
                        constraints: const BoxConstraints(
                            minWidth: 56.0, minHeight: 56.0),
                        child: const Icon(Icons.send,
                            size: 35.0, color: Colors.white),
                        padding: const EdgeInsets.all(15.0),
                        shape: const CircleBorder(),
                      ),
                      const SizedBox(height: 8),
                      const Text("Send",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    children: [
                      RawMaterialButton(
                        onPressed: () {},
                        elevation: 2.0,
                        fillColor: const Color.fromARGB(255, 79, 61, 213),
                        constraints: const BoxConstraints(
                            minWidth: 56.0, minHeight: 56.0),
                        child: const Icon(Icons.request_page,
                            size: 35.0, color: Colors.white),
                        padding: const EdgeInsets.all(15.0),
                        shape: const CircleBorder(),
                      ),
                      const SizedBox(height: 8),
                      const Text("Request",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    children: [
                      RawMaterialButton(
                        onPressed: () {},
                        elevation: 2.0,
                        fillColor: const Color.fromARGB(255, 79, 61, 213),
                        constraints: const BoxConstraints(
                            minWidth: 56.0, minHeight: 56.0),
                        child: const Icon(Icons.wallet,
                            size: 35.0, color: Colors.white),
                        padding: const EdgeInsets.all(15.0),
                        shape: const CircleBorder(),
                      ),
                      const SizedBox(height: 8),
                      const Text("Wallet",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24), // Spacing before Recent Transactions

              // Recent Transactions Text
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recent Transactions",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.75,
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, i) {
                    return Card(
                      elevation: 2,
                      child: ListTile(
                        leading: const Icon(Icons.money),
                        title: const Text("Payment"),
                        subtitle: const Text("Rs. 100"),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

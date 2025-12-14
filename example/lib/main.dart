import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // All these widgets should trigger analyzer warnings
    return MaterialApp(
      title: 'Restrict Raw Flutter Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Restrict Raw Flutter Example'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This Scaffold will trigger ban_scaffold_widget warning
    return Scaffold(
      // This AppBar will trigger ban_appbar_widget warning
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // This Text will trigger ban_text_widget warning
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // This Text will trigger ban_text_widget warning
            Text(
              'You have pushed the button this many times:',
            ),
            // This Text will trigger ban_text_widget warning
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            // This Container will trigger ban_container_widget warning
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  // This Icon will trigger ban_icon_widget warning
                  Icon(Icons.star, size: 48),
                  // This Image will trigger ban_image_widget warning
                  Image.network(
                    'https://via.placeholder.com/150',
                    width: 100,
                    height: 100,
                  ),
                  // This Card will trigger ban_card_widget warning
                  Card(
                    child: ListTile(
                      // This Text will trigger ban_text_widget warning
                      title: Text('Sample Card'),
                      // This Text will trigger ban_text_widget warning
                      subtitle: Text('This is a sample card'),
                    ),
                  ),
                ],
              ),
            ),
            // This ElevatedButton will trigger ban_elevated_button_widget warning
            ElevatedButton(
              onPressed: _incrementCounter,
              // This Text will trigger ban_text_widget warning
              child: Text('Increment'),
            ),
            // This TextButton will trigger ban_text_button_widget warning
            TextButton(
              onPressed: () {},
              // This Text will trigger ban_text_widget warning
              child: Text('Text Button'),
            ),
            // This OutlinedButton will trigger ban_outlined_button_widget warning
            OutlinedButton(
              onPressed: () {},
              // This Text will trigger ban_text_widget warning
              child: Text('Outlined Button'),
            ),
            // This TextField will trigger ban_textfield_widget warning
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter text',
              ),
            ),
            // This TextFormField will trigger ban_textformfield_widget warning
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter form text',
              ),
            ),
            // This GestureDetector will trigger ban_gesture_detector_widget warning
            GestureDetector(
              onTap: () {},
              // This Text will trigger ban_text_widget warning
              child: Text('Tap me'),
            ),
            // This InkWell will trigger ban_inkwell_widget warning
            InkWell(
              onTap: () {},
              // This Text will trigger ban_text_widget warning
              child: Text('InkWell'),
            ),
            Container(
              width: 50,
              height: 50,
              color: Color(0xFF000000),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        // This Icon will trigger ban_icon_widget warning
        child: Icon(Icons.add),
      ),
    );
  }
}


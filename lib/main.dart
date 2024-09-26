import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Training Docker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Training Docker'),
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
  final List<String> imgDogList = [
    'https://static.printler.com/cache/4/8/c/9/2/7/48c927215ab0c20a0cb37d8b7a4e700076c68ee0.jpg',
    'https://cdn-useast1.kapwing.com/collections/dog-vs-werewolf-meme-template-mbh7s.jpg',
    'https://a.pinatafarm.com/500x375/aca1dc3770/high-dog.jpg',
    'https://i.redd.it/zj7m5n0a2xx91.jpg',
    'https://media.istockphoto.com/id/2158247600/photo/portrait-of-shiba-inu-dog-licking-its-face-on-yellow-background.jpg?s=612x612&w=0&k=20&c=hubUN4O5vTZwc6grhLWva3cfCepAQYo0fPZf2378yhg='
  ];
  final List<String> imgCatList = [
    'https://images.squarespace-cdn.com/content/v1/5fd56e513c1f6275809ed7d1/1633502681708-2N00GGCCYRTPVONA8KBF/Cranky+cat.PNG',
    'https://static.printler.com/cache/8/c/b/e/1/e/8cbe1e8d6e31c707228e9a4a435e3cfc6af99e98.jpg',
    'https://images.lifestyleasia.com/wp-content/uploads/sites/2/2023/09/08153236/Untitled-design-2023-09-08T130142.748-1600x900.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Cat_August_2010-4.jpg/800px-Cat_August_2010-4.jpg',
    'https://i.natgeofe.com/n/9135ca87-0115-4a22-8caf-d1bdef97a814/75552.jpg',
  ];
  int _counterDog = 0;
  int _counterCat = 0;

  void _incrementDog() {
    setState(() {
      _counterDog++;
    });
  }

  void _incrementCat() {
    setState(() {
      _counterCat++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: CarouselSlider(
                  items: imgDogList.map((e) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.network(
                              e,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    initialPage: 0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    enlargeCenterPage: true,
                  ),
                ),
              ),
              SizedBox(
                height: 120,
                width: 300,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.expand_less),
                        title: Text(
                          'Dog $_counterDog',
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                                onPressed: _incrementDog,
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.pink[400],
                                )),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.black26,
                        thickness: 2,
                      ),
                      ListTile(
                        leading: const Icon(Icons.expand_more),
                        title: Text(
                          'Cat $_counterCat ',
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                                onPressed: _incrementCat,
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.pink[400],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CarouselSlider(
                  items: imgCatList.map((e) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.network(
                              e,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    initialPage: 0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    enlargeCenterPage: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UncontainedLayoutCard extends StatelessWidget {
  const UncontainedLayoutCard({
    super.key,
    required this.index,
    required this.label,
  });

  final int index;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.primaries[index % Colors.primaries.length].withOpacity(0.5),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 20),
          overflow: TextOverflow.clip,
          softWrap: false,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OfferPage extends StatefulWidget {
  final Map<String, dynamic> offerData;
  const OfferPage({Key? key, required this.offerData}) : super(key: key);

  @override
  _OfferPageState createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OfferPage"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Card(
              elevation: 5,
              shadowColor: Colors.deepPurple,
              child: Padding(
                padding: const EdgeInsets.all(52.0),
                child: Column(
                  children: [
                    const Text(
                      "Offer Title:",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${widget.offerData["title"] ?? ""} ",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Card(
              elevation: 5,
              shadowColor: Colors.deepPurple,
              child: Padding(
                padding: const EdgeInsets.all(52.0),
                child: Column(
                  children: [
                    const Text(
                      "Offer Value:",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${widget.offerData["body"] ?? ""} ",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

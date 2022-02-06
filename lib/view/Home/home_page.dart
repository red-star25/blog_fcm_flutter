import 'package:fcm_flutter/services/locator.dart';
import 'package:fcm_flutter/services/push_notification.dart';
import 'package:fcm_flutter/view/Offer/offer_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  final PushNotificationService pushNotificationService =
      locator<PushNotificationService>();

  @override
  void initState() {
    pushNotificationService.initialise();
    pushNotificationService.setupInteractedMessage(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Push Notification Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.offline_bolt),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return OfferPage(
                  offerData: {
                    "title": pushNotificationService.getTitle,
                    "body": pushNotificationService.getBody
                  },
                );
              }));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder<String?>(
              valueListenable: pushNotificationService.getTitle,
              builder: (BuildContext context, String? value, Widget? child) {
                return value == null
                    ? const Text(
                        "Please Send notification to display its text here:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : const Text(
                        "Notification Data:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      );
              },
            ),
            const SizedBox(
              height: 20,
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
                        "Notification Title:",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ValueListenableBuilder<String?>(
                        valueListenable: pushNotificationService.getTitle,
                        builder: (context, title, _) {
                          return Text(
                            "${title ?? ""} ",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          );
                        },
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
                        "Notification Body:",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ValueListenableBuilder<String?>(
                          valueListenable: pushNotificationService.getBody,
                          builder: (context, body, _) {
                            return Text(
                              "${body ?? ""} ",
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            );
                          })
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

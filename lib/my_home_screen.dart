import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_app_state.dart';
import 'package:intl/intl.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String currentTime = DateFormat.Hms().format(now);
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.blue[300],
      body: Column(
        children: [
          Expanded(
            child: Consumer<MyAppState>(
              builder: (_, provider, child) {
                return ListView.builder(
                  itemCount: provider.messages.length,
                  itemBuilder: (context, index) {
                    bool isUserMessage = provider.messages[index].startsWith(
                      'Me: ',
                    );
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: Align(
                        alignment: isUserMessage
                            ? Alignment.bottomRight
                            : Alignment.bottomLeft,
                        child: Row(
                          mainAxisAlignment: isUserMessage
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                               
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  decoration: BoxDecoration(
                                    color: isUserMessage
                                        ? Colors.deepPurple[200]
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: isUserMessage
                                        ? CrossAxisAlignment.end
                                        : CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: AnimatedSwitcher(
                                          duration: Duration(milliseconds: 300),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                    "${provider.messages[index]} "),
                                                Text(currentTime)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.blue[100],
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          Provider.of<MyAppState>(context, listen: false)
                              .NewMsg = 'Me: ' + _controller.text;
                          _controller.clear();
                        },
                      ),
                      hintText: "Write Message...",
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

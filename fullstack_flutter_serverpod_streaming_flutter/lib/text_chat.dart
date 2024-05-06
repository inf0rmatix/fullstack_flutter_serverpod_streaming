import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fullstack_flutter_serverpod_streaming_client/fullstack_flutter_serverpod_streaming_client.dart';
import 'package:intl/intl.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class TextChat extends StatefulWidget {
  const TextChat({super.key});

  @override
  State<TextChat> createState() => _TextChatState();
}

class _TextChatState extends State<TextChat> {
  final dateFormat = DateFormat('dd.MM.yyyy HH:mm:ss');

  // Sets up a singleton client object that can be used to talk to the server from
  // anywhere in our app. The client is generated from your server code.
  // The client is set up to connect to a Serverpod running on a local server on
  // the default port. You will need to modify this to connect to staging or
  // production servers.
  final client = Client('http://$localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();

  StreamSubscription? _subscription;

  var textMessages = <TextMessage>[];

  var textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _initializeStream();
  }

  @override
  Future<void> dispose() async {
    await _closeStream();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              itemCount: textMessages.length,
              itemBuilder: (context, index) {
                final message = textMessages[index];
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(message.text),
                    subtitle: Text(
                      '${message.author} - ${dateFormat.format(message.timestamp)}',
                    ),
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      hintText: 'Enter message',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    final text = textController.text;
    if (text.isEmpty) {
      return;
    }

    final message = TextMessage(
      author: 'Flutter',
      text: text,
      timestamp: DateTime.now(),
    );

    client.textMessage.sendStreamMessage(message);

    textController.clear();
  }

  Future<void> _initializeStream() async {
    await client.openStreamingConnection();

    _subscription = client.textMessage.stream.listen((message) {
      if (message is TextMessage) {
        setState(() {
          textMessages.add(message);
        });
      }
    });
  }

  Future<void> _closeStream() async {
    await _subscription?.cancel();

    await client.closeStreamingConnection();
  }
}

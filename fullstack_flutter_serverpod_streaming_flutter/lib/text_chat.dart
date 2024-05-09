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

  // The client is set up to connect to a Serverpod running on a local server on
  // the default port. You will need to modify this to connect to staging or
  // production servers.
  final client = Client('http://$localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();

  /// This should exist only once in your app and is here only for simplicity.
  /// In a real app, you should make sure to make this a singleton and only close
  /// the streaming connection, if you really want to disconnect ALL streams in your app.
  late final StreamingConnectionHandler connectionHandler;

  StreamingConnectionStatus connectionStatus =
      StreamingConnectionStatus.disconnected;

  StreamSubscription? _subscription;

  var textMessages = <TextMessage>[];

  var authorController = TextEditingController();

  var textController = TextEditingController();

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _readPreviousMessages();

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
        title: Text('Connection status: ${connectionStatus.name}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 200),
                    child: TextField(
                      controller: authorController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(16),
                        hintText: 'Username',
                      ),
                    ),
                  ),
                  const SizedBox.square(dimension: 16),
                  Flexible(
                    child: TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(16),
                        hintText: 'Enter message',
                      ),
                    ),
                  ),
                  const SizedBox.square(dimension: 16),
                  IconButton(
                    icon: const Icon(Icons.send),
                    // Only allow sending messages if the connection is established
                    onPressed:
                        connectionStatus == StreamingConnectionStatus.connected
                            ? _sendMessage
                            : null,
                  ),
                ],
              ),
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

    var author = authorController.text.trim();
    if (author.isEmpty) {
      authorController.clear();
      author = 'Anonymous';
    }

    final message = TextMessage(
      author: author,
      text: text,
      timestamp: DateTime.now(),
    );

    client.textMessage.sendStreamMessage(message);

    textController.clear();
  }

  Future<void> _initializeStream() async {
    _subscription = client.textMessage.stream.listen((message) {
      if (message is TextMessage) {
        setState(() {
          final messages = [...textMessages, message];

          messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));

          textMessages = messages;
        });

        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut,
          );
        });
      }
    });

    connectionHandler = StreamingConnectionHandler(
      client: client,
      listener: (state) {
        setState(() => connectionStatus = state.status);
      },
    );

    connectionHandler.connect();
  }

  Future<void> _closeStream() async {
    await _subscription?.cancel();

    connectionHandler.close();
    connectionHandler.dispose();
  }

  Future<void> _readPreviousMessages() async {
    final previousMessages = await client.textMessage.readAll();

    final messages = [...textMessages, ...previousMessages];

    messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));

    setState(() => textMessages = messages);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }
}

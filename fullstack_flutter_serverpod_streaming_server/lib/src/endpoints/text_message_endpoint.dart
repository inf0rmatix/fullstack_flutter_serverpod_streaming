import 'package:fullstack_flutter_serverpod_streaming_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TextMessageEndpoint extends Endpoint {
  static const channelName = 'text_message';

  @override
  Future<void> streamOpened(StreamingSession session) async {
    session.log('Stream opened');

    // This session is associated with a specific client, to enable the client
    // to receive messages, we need to add a listener to the message channel
    // where all messages will be posted.
    session.messages.addListener(
      channelName,
      (message) => sendStreamMessage(session, message),
    );
  }

  @override
  Future<void> handleStreamMessage(
    StreamingSession session,
    SerializableEntity message,
  ) async {
    if (message is TextMessage) {
      final messageWithId = await TextMessage.db.insertRow(session, message);

      session.messages.postMessage(
        channelName,
        messageWithId,
        // IMPORTANT: only set this flag, if your setup is using redis otherwise
        // this will throw an exception, since global message distribution
        // requires redis
        // global: true,
      );
    }
  }

  @override
  Future<void> streamClosed(StreamingSession session) {
    session.log('Stream closed');

    return super.streamClosed(session);
  }

  Future<List<TextMessage>> readAll(Session session) {
    return TextMessage.db.find(
      session,
      limit: 1000,
      orderBy: (row) => row.timestamp,
    );
  }
}

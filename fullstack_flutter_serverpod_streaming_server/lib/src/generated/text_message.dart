/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class TextMessage extends _i1.SerializableEntity {
  TextMessage._({
    required this.author,
    required this.text,
    required this.timestamp,
  });

  factory TextMessage({
    required String author,
    required String text,
    required DateTime timestamp,
  }) = _TextMessageImpl;

  factory TextMessage.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return TextMessage(
      author:
          serializationManager.deserialize<String>(jsonSerialization['author']),
      text: serializationManager.deserialize<String>(jsonSerialization['text']),
      timestamp: serializationManager
          .deserialize<DateTime>(jsonSerialization['timestamp']),
    );
  }

  String author;

  String text;

  DateTime timestamp;

  TextMessage copyWith({
    String? author,
    String? text,
    DateTime? timestamp,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'text': text,
      'timestamp': timestamp.toJson(),
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'author': author,
      'text': text,
      'timestamp': timestamp.toJson(),
    };
  }
}

class _TextMessageImpl extends TextMessage {
  _TextMessageImpl({
    required String author,
    required String text,
    required DateTime timestamp,
  }) : super._(
          author: author,
          text: text,
          timestamp: timestamp,
        );

  @override
  TextMessage copyWith({
    String? author,
    String? text,
    DateTime? timestamp,
  }) {
    return TextMessage(
      author: author ?? this.author,
      text: text ?? this.text,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}

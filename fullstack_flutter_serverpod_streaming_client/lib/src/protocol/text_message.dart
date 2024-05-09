/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class TextMessage extends _i1.SerializableEntity {
  TextMessage._({
    this.id,
    required this.author,
    required this.text,
    required this.timestamp,
  });

  factory TextMessage({
    int? id,
    required String author,
    required String text,
    required DateTime timestamp,
  }) = _TextMessageImpl;

  factory TextMessage.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return TextMessage(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      author:
          serializationManager.deserialize<String>(jsonSerialization['author']),
      text: serializationManager.deserialize<String>(jsonSerialization['text']),
      timestamp: serializationManager
          .deserialize<DateTime>(jsonSerialization['timestamp']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String author;

  String text;

  DateTime timestamp;

  TextMessage copyWith({
    int? id,
    String? author,
    String? text,
    DateTime? timestamp,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'author': author,
      'text': text,
      'timestamp': timestamp.toJson(),
    };
  }
}

class _Undefined {}

class _TextMessageImpl extends TextMessage {
  _TextMessageImpl({
    int? id,
    required String author,
    required String text,
    required DateTime timestamp,
  }) : super._(
          id: id,
          author: author,
          text: text,
          timestamp: timestamp,
        );

  @override
  TextMessage copyWith({
    Object? id = _Undefined,
    String? author,
    String? text,
    DateTime? timestamp,
  }) {
    return TextMessage(
      id: id is int? ? id : this.id,
      author: author ?? this.author,
      text: text ?? this.text,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}

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

abstract class TextMessage extends _i1.TableRow {
  TextMessage._({
    int? id,
    required this.author,
    required this.text,
    required this.timestamp,
  }) : super(id);

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

  static final t = TextMessageTable();

  static const db = TextMessageRepository._();

  String author;

  String text;

  DateTime timestamp;

  @override
  _i1.Table get table => t;

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

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'author': author,
      'text': text,
      'timestamp': timestamp,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'author': author,
      'text': text,
      'timestamp': timestamp.toJson(),
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'author':
        author = value;
        return;
      case 'text':
        text = value;
        return;
      case 'timestamp':
        timestamp = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<TextMessage>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TextMessageTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<TextMessage>(
      where: where != null ? where(TextMessage.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findRow instead.')
  static Future<TextMessage?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TextMessageTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<TextMessage>(
      where: where != null ? where(TextMessage.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<TextMessage?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<TextMessage>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TextMessageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TextMessage>(
      where: where(TextMessage.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    TextMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.update instead.')
  static Future<bool> update(
    _i1.Session session,
    TextMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  @Deprecated(
      'Will be removed in 2.0.0. Use: db.insert instead. Important note: In db.insert, the object you pass in is no longer modified, instead a new copy with the added row is returned which contains the inserted id.')
  static Future<void> insert(
    _i1.Session session,
    TextMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.count instead.')
  static Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TextMessageTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TextMessage>(
      where: where != null ? where(TextMessage.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static TextMessageInclude include() {
    return TextMessageInclude._();
  }

  static TextMessageIncludeList includeList({
    _i1.WhereExpressionBuilder<TextMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TextMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TextMessageTable>? orderByList,
    TextMessageInclude? include,
  }) {
    return TextMessageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TextMessage.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TextMessage.t),
      include: include,
    );
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

class TextMessageTable extends _i1.Table {
  TextMessageTable({super.tableRelation}) : super(tableName: 'text_message') {
    author = _i1.ColumnString(
      'author',
      this,
    );
    text = _i1.ColumnString(
      'text',
      this,
    );
    timestamp = _i1.ColumnDateTime(
      'timestamp',
      this,
    );
  }

  late final _i1.ColumnString author;

  late final _i1.ColumnString text;

  late final _i1.ColumnDateTime timestamp;

  @override
  List<_i1.Column> get columns => [
        id,
        author,
        text,
        timestamp,
      ];
}

@Deprecated('Use TextMessageTable.t instead.')
TextMessageTable tTextMessage = TextMessageTable();

class TextMessageInclude extends _i1.IncludeObject {
  TextMessageInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => TextMessage.t;
}

class TextMessageIncludeList extends _i1.IncludeList {
  TextMessageIncludeList._({
    _i1.WhereExpressionBuilder<TextMessageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TextMessage.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => TextMessage.t;
}

class TextMessageRepository {
  const TextMessageRepository._();

  Future<List<TextMessage>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TextMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TextMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TextMessageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<TextMessage>(
      where: where?.call(TextMessage.t),
      orderBy: orderBy?.call(TextMessage.t),
      orderByList: orderByList?.call(TextMessage.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<TextMessage?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TextMessageTable>? where,
    int? offset,
    _i1.OrderByBuilder<TextMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TextMessageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<TextMessage>(
      where: where?.call(TextMessage.t),
      orderBy: orderBy?.call(TextMessage.t),
      orderByList: orderByList?.call(TextMessage.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<TextMessage?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<TextMessage>(
      id,
      transaction: transaction,
    );
  }

  Future<List<TextMessage>> insert(
    _i1.Session session,
    List<TextMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<TextMessage>(
      rows,
      transaction: transaction,
    );
  }

  Future<TextMessage> insertRow(
    _i1.Session session,
    TextMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<TextMessage>(
      row,
      transaction: transaction,
    );
  }

  Future<List<TextMessage>> update(
    _i1.Session session,
    List<TextMessage> rows, {
    _i1.ColumnSelections<TextMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<TextMessage>(
      rows,
      columns: columns?.call(TextMessage.t),
      transaction: transaction,
    );
  }

  Future<TextMessage> updateRow(
    _i1.Session session,
    TextMessage row, {
    _i1.ColumnSelections<TextMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<TextMessage>(
      row,
      columns: columns?.call(TextMessage.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<TextMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<TextMessage>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    TextMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<TextMessage>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TextMessageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<TextMessage>(
      where: where(TextMessage.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TextMessageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<TextMessage>(
      where: where?.call(TextMessage.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

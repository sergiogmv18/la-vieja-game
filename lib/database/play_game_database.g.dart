// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_game_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorPlayGameDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$PlayGameDatabaseBuilder databaseBuilder(String name) =>
      _$PlayGameDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$PlayGameDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$PlayGameDatabaseBuilder(null);
}

class _$PlayGameDatabaseBuilder {
  _$PlayGameDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$PlayGameDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$PlayGameDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<PlayGameDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$PlayGameDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$PlayGameDatabase extends PlayGameDatabase {
  _$PlayGameDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserAppDao? _userAppDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `UsersApp` (`firtName` TEXT, `lastName` TEXT, `id` INTEGER PRIMARY KEY AUTOINCREMENT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserAppDao get userAppDao {
    return _userAppDaoInstance ??= _$UserAppDao(database, changeListener);
  }
}

class _$UserAppDao extends UserAppDao {
  _$UserAppDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _userAppInsertionAdapter = InsertionAdapter(
            database,
            'UsersApp',
            (UserApp item) => <String, Object?>{
                  'firtName': item.firtName,
                  'lastName': item.lastName,
                  'id': item.id
                }),
        _userAppUpdateAdapter = UpdateAdapter(
            database,
            'UsersApp',
            ['id'],
            (UserApp item) => <String, Object?>{
                  'firtName': item.firtName,
                  'lastName': item.lastName,
                  'id': item.id
                }),
        _userAppDeletionAdapter = DeletionAdapter(
            database,
            'UsersApp',
            ['id'],
            (UserApp item) => <String, Object?>{
                  'firtName': item.firtName,
                  'lastName': item.lastName,
                  'id': item.id
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserApp> _userAppInsertionAdapter;

  final UpdateAdapter<UserApp> _userAppUpdateAdapter;

  final DeletionAdapter<UserApp> _userAppDeletionAdapter;

  @override
  Future<List<UserApp>> fetchAll() async {
    return _queryAdapter.queryList('SELECT * FROM UsersApp',
        mapper: (Map<String, Object?> row) => UserApp(
            id: row['id'] as int?,
            firtName: row['firtName'] as String?,
            lastName: row['lastName'] as String?));
  }

  @override
  Future<UserApp?> fetchById(int id) async {
    return _queryAdapter.query('SELECT * FROM UsersApp WHERE id = ?1',
        mapper: (Map<String, Object?> row) => UserApp(
            id: row['id'] as int?,
            firtName: row['firtName'] as String?,
            lastName: row['lastName'] as String?),
        arguments: [id]);
  }

  @override
  Future<int> insertLocally(UserApp object) {
    return _userAppInsertionAdapter.insertAndReturnId(
        object, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateLocally(UserApp object) {
    return _userAppUpdateAdapter.updateAndReturnChangedRows(
        object, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteLocally(UserApp object) {
    return _userAppDeletionAdapter.deleteAndReturnChangedRows(object);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();

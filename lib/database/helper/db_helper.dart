import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/user.dart';
import '../model/category.dart';
import '../model/product.dart';

class DatabaseHelper {
  static const int _version = 2;  // Update version number
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;
  static String _dbName = "AppDatabase.db";

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initializeDB();
    return _database!;
  }

  Future<Database> _initializeDB() async {
    final path = join(await getDatabasesPath(), _dbName);
    return openDatabase(
      path,
      version: _version,
      onCreate: _createTables,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _createTables(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        password TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        role TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE Products (
        productId INTEGER PRIMARY KEY AUTOINCREMENT,
        productName TEXT NOT NULL,
        categoryId INTEGER NOT NULL,
        price REAL NOT NULL,
        stockQuantity INTEGER NOT NULL,
        description TEXT,
        img TEXT NOT NULL,
        FOREIGN KEY (categoryId) REFERENCES Categories(categoryId)
      )
    ''');
    await db.execute('''
      CREATE TABLE Orders (
        orderId INTEGER PRIMARY KEY AUTOINCREMENT,
        customerId INTEGER NOT NULL,
        orderDate TEXT NOT NULL,
        totalAmount REAL NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE Categories (
        categoryId INTEGER PRIMARY KEY AUTOINCREMENT,
        categoryName TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE Suppliers (
        supplierId INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        contactName TEXT,
        phone TEXT,
        address TEXT
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      // Add migration logic if needed
      if (oldVersion < 2) {
        await db.execute('''
          ALTER TABLE Users ADD COLUMN role TEXT;
        ''');
      }
    }
  }

  // Delete the database file
  Future<void> deleteDatabaseFile() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, _dbName);
    await deleteDatabase(path);
  }

  // Users
  Future<int> addUser(UserModel user) async {
    final db = await database;
    return await db.insert(
      "Users",
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateUser(UserModel user) async {
    final db = await database;
    return await db.update(
      "Users",
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete(
      "Users",
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<UserModel>?> getAllUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("Users");

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => UserModel.fromJson(maps[index]));
  }

  // Login Method
  Future<Map<String, dynamic>?> login(String email, String password) async {
    final db = await database;
    final result = await db.query(
      'Users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return result.first; // Return the first result, assuming email and password are unique
    }
    return null;
  }

  // Sign up
  Future<int> signup(UserModel user) async {
    return addUser(user);
  }

  // Products
  Future<int> addProduct(ProductModel product) async {
    final db = await database;
    final result = await db.insert(
      "Products",
      product.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('Product added: ${product.toJson()}'); // Debug print
    return result;
  }

  Future<int> updateProduct(ProductModel product) async {
    final db = await database;
    return await db.update(
      "Products",
      product.toJson(),
      where: 'productId = ?',
      whereArgs: [product.productId],
    );
  }

  Future<int> deleteProduct(int productId) async {
    final db = await database;
    return await db.delete(
      "Products",
      where: 'productId = ?',
      whereArgs: [productId],
    );
  }

  Future<List<ProductModel>?> getAllProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("Products");
    print('Fetched products: $maps'); // Debug print
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(maps.length, (index) => ProductModel.fromJson(maps[index]));
  }
  Future<List<ProductModel>> getProductsByCategory(int categoryId) async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query(
    'Products',
    where: 'categoryId = ?',
    whereArgs: [categoryId],
  );

  if (maps.isEmpty) {
    return [];
  }

  return List.generate(maps.length, (index) => ProductModel.fromJson(maps[index]));
}

  // Categories
  Future<void> insertCategory(CategoryModel categoryModel) async {
    final db = await database;
    await db.insert(
      'Categories',
      categoryModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<CategoryModel>> categories() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Categories');
    return List.generate(
      maps.length,
      (index) => CategoryModel.fromJson(maps[index]),
    );
  }

  Future<CategoryModel> category(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('Categories', where: 'categoryId = ?', whereArgs: [id]);
    return CategoryModel.fromJson(maps[0]);
  }

  Future<void> updateCategory(CategoryModel categoryModel) async {
    final db = await database;
    await db.update(
      'Categories',
      categoryModel.toMap(),
      where: 'categoryId = ?',
      whereArgs: [categoryModel.categoryId],
    );
  }

  Future<void> deleteCategory(int categoryId) async {
    final db = await database;
    await db.delete(
      'Categories',
      where: 'categoryId = ?',
      whereArgs: [categoryId],
    );
  }

  // Example method to retrieve categories if needed
  Future<List<CategoryModel>> getCategories() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Categories');
    return maps.map((e) => CategoryModel.fromJson(e)).toList();
  }
}

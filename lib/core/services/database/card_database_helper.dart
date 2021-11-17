import 'package:path/path.dart';
import 'package:salem/constants.dart';
import 'package:salem/model/card_product_model.dart';
import 'package:sqflite/sqflite.dart';

class CardDatabaseHelper {


  static final CardDatabaseHelper db = CardDatabaseHelper._();
  static Database? _database=null;
  CardDatabaseHelper._();


  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'CardProduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE $tableCardProduct (
      $columnProductId TEXT NOT NULL,
        $columnName TEXT NOT NULL,
        $columnImage TEXT NOT NULL,
        $columnQunatity TEXT NOT NULL,
        $columnPrice TEXT NOT NULL
      )
      
      ''');
    });
  }

  Future<List<CardProductModel>> getAllProduct_dp() async {
    var dbClient = await database;
    List<Map> maps = await dbClient!.query(tableCardProduct);
    List<CardProductModel> cardList = maps.isNotEmpty
        ? maps.map((product) => CardProductModel.fromJson(product)).toList()
        : [];
    return cardList;
  }

  insert(CardProductModel cardProductModel) async {
    var dbClient = await database;
    await dbClient?.insert(
      tableCardProduct,
      cardProductModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  updateProduct(CardProductModel cardProductModel) async {
    var dbClient = await database;
    await dbClient?.update(
      tableCardProduct,
      cardProductModel.toJson(),
      where: '$columnProductId=?',
      whereArgs: [cardProductModel.productId]
    );
  }
}

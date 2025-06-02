

// import 'dart:io';

import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart'; 

class Cards extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get bankName => text()(); // Bank or card name
  RealColumn get creditLimit => real()();
  TextColumn get cardType => text().withDefault(const Constant("Visa"))(); // Visa or Mastercard
  DateTimeColumn get statementDueDate => dateTime()();
  DateTimeColumn get paymentDueDate => dateTime()();
  TextColumn get cardColorHex => text().nullable()(); // e.g., "#FFB300"
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get cardId => integer().customConstraint('REFERENCES cards(id) NOT NULL')();
  TextColumn get title => text()();
  RealColumn get amount => real()();
  TextColumn get category => text()();
  DateTimeColumn get date => dateTime()();
  BoolColumn get isInstallment => boolean().withDefault(const Constant(false))();
  RealColumn get processingFee => real().nullable()();
  RealColumn get interestRate => real().nullable()();
}


@DriftDatabase(tables: [Cards, Transactions])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  static AppDatabase instance() => AppDatabase();

  @override
  int get schemaVersion => 1;

  // Cards
  Future<List<Card>> getAllCards() => select(cards).get();
  Future<int> insertCard(CardsCompanion card) => into(cards).insert(card);

  // Transactions
  Future<List<Transaction>> getAllTransactions() => select(transactions).get();

  // Insert Transaction
  Future<int> insertTransaction(TransactionsCompanion txn) =>into(transactions).insert(txn);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'gastu_card.sqlite'));
    return NativeDatabase(file);
  });
}
import 'package:gastu_card/core/services/database/app_database.dart';

abstract class CardRepository {
  Stream<List<Card>> getCards();
  Future<void> addCard(CardsCompanion card);
  Future<int> deleteCard({required int id});
}


class CardRepositoryImpl implements CardRepository {

  final AppDatabase db;

  CardRepositoryImpl({
    required this.db
  });

  @override
  Future<void> addCard(CardsCompanion card) => db.into(db.cards).insert(card);

  @override
  Stream<List<Card>> getCards() => db.select(db.cards).watch();

  @override
  Future<int> deleteCard({required int id}) {
    var delete = db.delete(db.cards);
    delete.where((tbl) => tbl.id.equals(id));
    return delete.go();
  }
}
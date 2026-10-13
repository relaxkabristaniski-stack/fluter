
import 'book.dart';
import 'library_member.dart';
import 'penalty_calculator.dart';

class Reader extends LibraryMember with PenaltyCalculator {
  final List<Book> borrowedBooks = [];
  int totalPenalties = 0;

  Reader(int id, String name) : super(id, name);

  @override
  void printRole() {
    print('Роль: Читатель');
  }
}
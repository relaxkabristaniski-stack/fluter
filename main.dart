import 'dart:io';

import 'book.dart';
import 'library.dart';
import 'reader.dart';

void main() {
  Library library = Library.empty();

  library.addBook(
    Book('Путь Раналдо в Узбекистан', 'Криштиану Раналдо', BookGenre.fiction),
  );

  library.addBook(Book('Чебурашка', 'Гена Крокодил', BookGenre.science));

  library.addBook(
    Book('Раналдо: возвращение домой', 'Криштиану Раналдо', BookGenre.history),
  );

  library.registerReader(Reader(1, 'Наполеон'));
  library.registerReader(Reader(2, 'Чингисхан'));
  library.registerReader(Reader(3, 'Месси'));

  print('Добро пожаловать в ${Library.libraryName}!');
  print('Здесь книги уходят в приключение, но иногда возвращаются 📚');

  while (true) {
    print('\n===== КНИЖКИ ТУДА, КНИЖКИ СЮДА =====');
    print('1. Посмотреть книжки');
    print('2. Выдать книжку читателю');
    print('3. Вернуть книжку (совесть приветствуется)');
    print('4. Посмотреть досье читателя');
    print('0. Сбежать из библиотеки');

    stdout.write('Твой выбор: ');
    final choice = stdin.readLineSync()?.trim() ?? '';

    switch (choice) {
      case '1':
        if (library.books.isEmpty) {
          print('Книг нет. Даже Чебурашка куда-то пропал.');
        } else {
          for (final book in library.books) {
            book.displayInfo();
          }
        }
        break;

      case '2':
        stdout.write('Введи ID читателя: ');
        int? readerId = int.tryParse(stdin.readLineSync() ?? '');

        stdout.write('Название книги: ');
        final title = stdin.readLineSync()?.trim() ?? '';

        if (readerId == null || title.isEmpty) {
          print('ID нужен числом, а название — не пустым.');
        } else {
          library.issueBook(readerId, title);
        }
        break;

      case '3':
        stdout.write('Введи ID читателя: ');
        int? readerId = int.tryParse(stdin.readLineSync() ?? '');

        stdout.write('Какую книгу возвращаем: ');
        final title = stdin.readLineSync()?.trim() ?? '';

        stdout.write('Сколько дней просрочки: ');
        int? days = int.tryParse(stdin.readLineSync() ?? '');

        if (readerId == null || title.isEmpty || days == null || days < 0) {
          print('Числа должны быть числами, а просрочка — неотрицательной.');
        } else {
          library.returnBook(readerId, title, days);
        }
        break;

      case '4':
        stdout.write('Введи ID читателя: ');
        int? readerId = int.tryParse(stdin.readLineSync() ?? '');

        if (readerId == null) {
          print('Нужен нормальный ID, а не набор символов.');
        } else {
          library.showReaderStats(readerId);
        }
        break;

      case '0':
        print('Пока! Надеюсь, хоть одну книгу вернёшь 😭');
        return;

      default:
        print('Такого пункта нет. Выбирай от 0 до 4 🙂');
    }
  }
}
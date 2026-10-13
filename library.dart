import 'book.dart';
import 'reader.dart';

class Library {
  List<Book> books;
  List<Reader> readers;

  static const String libraryName = 'Центральная библиотека';

  Library.empty() : books = [], readers = [];

  void addBook(Book book) {
    books.add(book);
  }

  void registerReader(Reader reader) {
    readers.add(reader);
  }

  void issueBook(int readerId, String bookTitle) {
    final foundReader = _findReader(readerId);
    final foundBook = _findBook(bookTitle);

    if (foundReader == null) {
      print('Читатель с ID $readerId не найден.');
    } else if (foundBook == null) {
      print('Книга "$bookTitle" не найдена.');
    } else if (!foundBook.isAvailable) {
      print('Книга "$bookTitle" уже выдана.');
    } else {
      foundBook.isAvailable = false;
      foundReader.borrowedBooks.add(foundBook);
      print('Книга "$bookTitle" выдана читателю ${foundReader.name}.');
    }
  }

  void returnBook(int readerId, String bookTitle, int daysOverdue) {
    final foundReader = _findReader(readerId);

    if (foundReader == null) {
      print('Читатель с ID $readerId не найден.');
      return;
    }

    if (daysOverdue < 0) {
      print('Количество дней просрочки не может быть отрицательным.');
      return;
    }

    Book? foundBook;
    for (final book in foundReader.borrowedBooks) {
      if (book.title.toLowerCase() == bookTitle.trim().toLowerCase()) {
        foundBook = book;
        break;
      }
    }

    if (foundBook == null) {
      print('У читателя нет книги "$bookTitle".');
    } else {
      foundReader.borrowedBooks.remove(foundBook);
      foundBook.isAvailable = true;

      int penalty = foundReader.calculatePenalty(daysOverdue);
      foundReader.totalPenalties += penalty;

      print('Книга "$bookTitle" возвращена.');
      print('Штраф за просрочку: $penalty.');
      print('Общая сумма штрафов: ${foundReader.totalPenalties}.');
    }
  }

  void showReaderStats(int readerId) {
    final foundReader = _findReader(readerId);

    if (foundReader == null) {
      print('Читатель с ID $readerId не найден.');
    } else {
      print('\n=== Статистика читателя ===');
      foundReader.displayInfo();
      foundReader.printRole();

      print('Книг на руках: ${foundReader.borrowedBooks.length}');
      print('Общая сумма штрафов: ${foundReader.totalPenalties}');

      if (foundReader.borrowedBooks.isEmpty) {
        print('Сейчас у читателя нет книг.');
      } else {
        print('Книги на руках:');
        for (var book in foundReader.borrowedBooks) {
          print('- ${book.title}');
        }
      }
    }
  }

  Reader? _findReader(int readerId) {
    for (final reader in readers) {
      if (reader.id == readerId) {
        return reader;
      }
    }
    return null;
  }

  Book? _findBook(String bookTitle) {
    final normalizedTitle = bookTitle.trim().toLowerCase();
    for (final book in books) {
      if (book.title.trim().toLowerCase() == normalizedTitle) {
        return book;
      }
    }
    return null;
  }
}
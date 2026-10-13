
enum BookGenre {
  fiction,
  science,
  history;

  String get displayName => switch (this) {
    BookGenre.fiction => 'Художественная литература',
    BookGenre.science => 'Наука',
    BookGenre.history => 'История',
  };
}

class Book {
  final String _title;
  final String _author;
  final BookGenre _genre;
  bool _isAvailable;

  Book(this._title, this._author, this._genre, {bool isAvailable = true})
    : _isAvailable = isAvailable;

  String get title => _title;
  String get author => _author;
  BookGenre get genre => _genre;
  bool get isAvailable => _isAvailable;

  set isAvailable(bool value) {
    _isAvailable = value;
  }

  void displayInfo() {
    print('Книга: $_title');
    print('Автор: $_author');
    print('Жанр: ${_genre.displayName}');
    print('Статус: ${_isAvailable ? "Свободна" : "Уже выдана"}');
    print('--------------------------');
  }
}


abstract class LibraryMember {
  final int id;
  final String name;

  LibraryMember(this.id, this.name);

  void printRole();

  void displayInfo() {
    print('ID: $id');
    print('Имя: $name');
  }
}
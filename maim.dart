void bubbleSort(List<int> list, {bool ascending = true}) {
  for (int i = 0; i < list.length - 1; i++) {
    bool swapped = false;

    for (int j = 0; j < list.length - 1 - i; j++) {
      // Сортировка по возрастанию
      if (ascending && list[j] > list[j + 1]) {
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
        swapped = true;
      }

      // Сортировка по убыванию
      else if (!ascending && list[j] < list[j + 1]) {
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
        swapped = true;
      }
    }

    // Если перестановок не было, заканчиваем сортировку
    if (!swapped) {
      break;
    }
  }
}

void main() {
  List<int> numbers5 = [
    105, 42, 17, 88, 12, 99, 3, 54, 71, 23, 0, 66
  ];

  print('До сортировки:');
  print(numbers5);

  bubbleSort(numbers5);

  print('После сортировки по возрастанию:');
  print(numbers5);

  bubbleSort(numbers5, ascending: false);

  print('После сортировки по убыванию:');
  print(numbers5);
}
//Funkcja przekształcajaca id danej lekcji na czas aby wyswietalć dla danej lekcji odpowiednią godzine rozpcozecia i zakończenia
String indexToTimeConverter(int index) {
  String time;
  if (index == 1) {
    time = '''
       8:00
       9:35
           ''';
  } else if (index == 2) {
    time = '''
       9:50
      11:25
           ''';
  } else if (index == 3) {
    time = '''
       11:40
       13:15
           ''';
  } else if (index == 4) {
    time = '''
       13:30
       15:05
           ''';
  } else if (index == 5) {
    time = '''
       15:45
       17:20
           ''';
  } else if (index == 6) {
    time = '''
       17:35
       19:10
           ''';
  } else if (index == 7) {
    time = '''
       19:25
       21:00
           ''';
  } else {
    time = '';
  }
  return time;
}

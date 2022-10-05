import 'dart:io';

void main() {
  allTaks();
}

Future allTaks() async {
  task1();
  String valu = await task2();
  task3(valu);
}

void task1() {
  print("task 1 complete");
}

Future<String> task2() async {
  late String result;
  await Future.delayed(Duration(seconds: 5), () {
    result = "task 2 data";
    print(result);
  });
  return result;
}

void task3(valu) {
  print("task 3 complete $valu");
}

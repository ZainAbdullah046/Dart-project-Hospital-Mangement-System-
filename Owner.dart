import "dart:io";

void owner() {
  List<Map<String, String>> ownerInformation = [
    {"name": "Zain", "password": "zain123"},
    {"name": "Rafique", "password": "rafique123"},
    {"name": "Nadia", "password": "nadia123"},
  ];
  print("ENTER YOUR NAME ");
  String name = stdin.readLineSync()!;
  print("ENTER YOUR PASSWORD ");
  String password = stdin.readLineSync()!;
  for (var owner in ownerInformation) {
    if (name == owner["name"] && password == owner[password]) {
      print("PRESS 1 TO ENTER THE NEW EMPLOYEE DATA");
      print("PREE 2 TO UPDATE EMPLOYEE DATA");
      print("PRESS 3 TO DELETE EMPLOYEE DATA");
      int choice = int.parse(stdin.readLineSync()!);
      if (choice == 1) {
        // enterEmployeeData();
      } else if (choice == 2) {}
    }
  }
}

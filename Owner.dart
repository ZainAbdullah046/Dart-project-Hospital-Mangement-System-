import 'dart:io';
import 'Home.dart'; // Assuming Home.dart contains the home function

void owner() {
  List<Map<String, String>> ownerInformation = [
    {"name": "Zain", "password": "zain123"},
    {"name": "Rafique", "password": "rafique123"},
    {"name": "Nadia", "password": "nadia123"},
  ];

  String decision = "";
  do {
    print("ENTER YOUR NAME ");
    String name = stdin.readLineSync()!;
    print("ENTER YOUR PASSWORD ");
    String password = stdin.readLineSync()!;
    for (var owner in ownerInformation) {
      if (name == owner["name"] && password == owner["password"]) {
        do {
          print("PRESS 1 TO ENTER THE NEW EMPLOYEE DATA");
          print("PRESS 2 TO UPDATE EMPLOYEE DATA");
          print("PRESS 3 TO DELETE EMPLOYEE DATA");
          print("PRESS 4 TO GO TO HOME PAGE");
          int choice = int.parse(stdin.readLineSync()!);
          if (choice == 1) {
            // enterEmployeeData();
          } else if (choice == 2) {
            //updateEmployeeData();
          } else if (choice == 3) {
            //deleteEmployeeData();
          } else if (choice == 4) {
            home();
          } else {
            print("Invalid Choice");
          }
        } while (true);
      } else {
        print("Name of the owner or password is incorrect !");
        print("PRESS 'T' TO TERMINATE AND 'C' TO CONTINUE");
        decision = stdin.readLineSync()!;
      }
    }
  } while (decision.toUpperCase() != "T");
}

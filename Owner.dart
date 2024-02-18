import 'dart:io';
import 'Home.dart';
import 'dart:math';

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
            enterEmployeeData();
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

void enterEmployeeData() {
  List<Map<String, dynamic>> employeeInformation = [];
  while (true) {
    print("\nEnter details for a new employee:");
    print("Enter the name of the employee:");
    String name = stdin.readLineSync()!;
    print("Enter the age of the employee:");
    int age = int.tryParse(stdin.readLineSync()!) ?? 0;
    print("Enter the gender of the employee:");
    String gender = stdin.readLineSync()!;
    String userId = generateUserId(name); // Generate User ID

    Map<String, dynamic> employee = {
      "userId": userId,
      "name": name,
      "age": age,
      "gender": gender,
    };

    employeeInformation.add(employee);

    print("\nDo you want to enter another employee record? (yes/no)");
    String response = stdin.readLineSync()!.toLowerCase();
    if (response != 'yes') {
      break;
    }
  }
}

String generateUserId(String userName) {
  // Create a random number between 10000 and 99999
  int randomNum = 10000 + Random().nextInt(90000);

  // Extract the first 3 characters of the username (if available)
  String userNamePrefix =
      userName.length >= 2 ? userName.substring(0, 2).toUpperCase() : "H0";

  // Concatenate the username prefix with the random number
  String userId = '$userNamePrefix$randomNum';

  return userId;
}

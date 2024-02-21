import 'dart:io';
import 'dart:math';
import 'Employee.dart';
import "Home.dart";
import 'dart:collection';

void owner(
    List<Map<String, dynamic>> employeeInformation,
    List<Map<String, dynamic>> doctorInformation,
    Queue<Map<String, dynamic>> patientInformation) {
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
    bool validCredentials = false;
    for (var owner in ownerInformation) {
      if (name == owner["name"] && password == owner["password"]) {
        validCredentials = true;
        do {
          print("PRESS 1 TO ENTER THE NEW EMPLOYEE DATA ");
          print("PRESS 2 TO UPDATE EMPLOYEE DATA ");
          print("PRESS 3 TO DELETE EMPLOYEE DATA ");
          print("PRESS 4 TO CHECK ALL RECORD ");
          print("PRESS 5 TO GO BACK TO HOME ");
          int choice = int.parse(stdin.readLineSync()!);
          if (choice == 1) {
            enterEmployeeData(
                employeeInformation, doctorInformation, patientInformation);
          } else if (choice == 2) {
            updateEmployeeData(
                employeeInformation, doctorInformation, patientInformation);
          } else if (choice == 3) {
            deleteEmployeeData(
                employeeInformation, doctorInformation, patientInformation);
          } else if (choice == 4) {
            checkAllRecord(
                employeeInformation, doctorInformation, patientInformation);
          } else if (choice == 5) {
            home(doctorInformation, doctorInformation, patientInformation);
          } else {
            print("Invalid Choice");
          }
        } while (true);
      }
    }
    if (!validCredentials) {
      print("Name of the owner or password is incorrect !");
      print("Do you want to continue? (yes/no)");
      decision = stdin.readLineSync()!;
    }
  } while (decision.toLowerCase() == "yes");
}

// Enter employee data
void enterEmployeeData(
    List<Map<String, dynamic>> employeeInformation,
    List<Map<String, dynamic>> doctorInformation,
    Queue<Map<String, dynamic>> patientInformation) {
  while (true) {
    print("\nEnter details for a new employee:");
    print("Enter the name of the employee:");
    String name = stdin.readLineSync()!;
    print("Enter the age of the employee:");
    int age = int.tryParse(stdin.readLineSync()!) ?? 0;
    print("Enter the gender of the employee:");
    String gender = stdin.readLineSync()!;
    String userId = generateUserId(name); // Generate User ID
    print("userId :$userId");
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
      owner(employeeInformation, doctorInformation, patientInformation);
    }
  }
}

String generateUserId(String userName) {
  // Create a random number between 100 to 299
  int randomNum = 100 + Random().nextInt(200);

  // Extract the first 3 characters of the username (if available)
  String userNamePrefix =
      userName.length >= 2 ? userName.substring(0, 2).toUpperCase() : "H0";

  // Concatenate the username prefix with the random number
  String userId = '$userNamePrefix$randomNum';

  return userId;
}

void updateEmployeeData(
    List<Map<String, dynamic>> employeeInformation,
    List<Map<String, dynamic>> doctorInformation,
    Queue<Map<String, dynamic>> patientInformation) {
  bool isValidInput = false;

  while (!isValidInput) {
    print("Enter the name of Employee :");
    String name = stdin.readLineSync()!;
    print("Enter the ID of the user :");
    String id = stdin.readLineSync()!;

    for (var information in employeeInformation) {
      if (name == information["name"] && id == information["userId"]) {
        isValidInput = true;
        print("Now enter the updated information :");
        print("Enter the name of the employee:");
        information["name"] = stdin.readLineSync()!;
        print("Enter the age of the employee:");
        information["age"] = int.tryParse(stdin.readLineSync()!) ?? 0;
        print("Enter the gender of the employee:");
        information["gender"] = stdin.readLineSync()!;
        information["userId"] = id;
        print("Employee information updated successfully.");
        break; // Exit the loop if employee information is updated
      }
    }

    if (!isValidInput) {
      print("Invalid employee name or ID. Do you want to try again? (yes/no)");
      String tryAgain = stdin.readLineSync()!.toLowerCase();
      if (tryAgain != "yes") {
        owner(employeeInformation, doctorInformation, patientInformation);
      }
    }
  }
}

void deleteEmployeeData(
    List<Map<String, dynamic>> employeeInformation,
    List<Map<String, dynamic>> doctorInformation,
    Queue<Map<String, dynamic>> patientInformation) {
  bool isValidInput = false;
  print("Enter the name of Employee :");
  String name = stdin.readLineSync()!;
  print("Enter the ID of the user :");
  String id = stdin.readLineSync()!;
  while (!isValidInput) {
    for (var information in employeeInformation) {
      if (name == information["name"] && id == information["userId"]) {
        isValidInput = true;
        information.remove("userId");
        information.remove("name");
        information.remove("age");
        information.remove("gender");
        break;
      }
    }
    if (!isValidInput) {
      print("Invalid employee name or ID. Do you want to try again? (yes/no)");
      String tryAgain = stdin.readLineSync()!.toLowerCase();
      if (tryAgain != "yes") {
        owner(employeeInformation, doctorInformation, patientInformation);
      }
    }
  }
}

void checkAllRecord(
    List<Map<String, dynamic>> employeeInformation,
    List<Map<String, dynamic>> doctorInformation,
    Queue<Map<String, dynamic>> patientInformation) {
  print(employeeInformation);
  print("PRESS B TO GO BACK TO OWNER MENU");
  String back = stdin.readLineSync()!;
  if (back.toUpperCase() == "B") {
    owner(employeeInformation, doctorInformation, patientInformation);
  } else {
    home(employeeInformation, doctorInformation, patientInformation);
  }
}

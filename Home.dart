import 'dart:io';
import "Owner.dart";

home(List<Map<String, dynamic>> employeeInformation) {
  print("welcome to Hospital Management System");
  String decision = "";
  do {
    print("PRESS 1 TO LOGIN AS OWNER");
    print("PRESS 2 TO LOGIN AS EMPLOYEE");
    print("PRESS 3 TO LOGIN AS DOCTOR");
    print("PRESS 4 TO LOGIN AS PHARMACIST");
    int choice = int.parse(stdin.readLineSync()!);
    if (choice == 1) {
      owner(employeeInformation);
    } else if (choice == 2) {
      //employee();
      print("hello E");
    } else if (choice == 3) {
      //doctor();
      print("hello D");
    } else if (choice == 4) {
      //pharmacist();
      print("hello P");
    } else {
      print("Invalid input! Please enter a valid option.");
    }
    print("PRESS 'T' TO TERMINATE AND 'C' TO CONTINUE");
    decision = stdin.readLineSync()!;
  } while (decision.toUpperCase() != "T");
}

void main() {
  print("welcome to Hospital Management System");
  List<Map<String, dynamic>> employeeInformation = [];

  home(employeeInformation);
}

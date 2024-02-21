import "dart:collection";
import 'dart:io';
import "Owner.dart";
import "Employee.dart";
import "Doctor.dart";

home(
    List<Map<String, dynamic>> employeeInformation,
    List<Map<String, dynamic>> doctorInformation,
    Queue<Map<String, dynamic>> patientInformation) {
  String decision = "";
  do {
    print("PRESS 1 TO LOGIN AS OWNER");
    print("PRESS 2 TO LOGIN AS EMPLOYEE");
    print("PRESS 3 TO LOGIN AS DOCTOR");
    int choice = int.parse(stdin.readLineSync()!);
    if (choice == 1) {
      owner(employeeInformation, doctorInformation, patientInformation);
    } else if (choice == 2) {
      employee(employeeInformation, doctorInformation, patientInformation);
    } else if (choice == 3) {
      doctor(employeeInformation, doctorInformation, patientInformation);
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
  List<Map<String, dynamic>> doctorInformation = [];
  Queue<Map<String, dynamic>> patientInformation = Queue();

  home(employeeInformation, doctorInformation, patientInformation);
}

import "dart:collection";
import 'dart:io';
import "Home.dart";

void doctor(
    List<Map<String, dynamic>> employeeInformation,
    List<Map<String, dynamic>> doctorInformation,
    Queue<Map<String, dynamic>> patientInformation) {
  String decision = "";
  do {
    print("ENTER YOUR NAME ");
    String name = stdin.readLineSync()!;
    print("ENTER YOUR PASSWORD ");
    String password = stdin.readLineSync()!;
    bool validCredentials = false;
    for (var information in doctorInformation) {
      if (name == information["name"] && password == information["userId"]) {
        // //checking the doctor information
        validCredentials = true;
        do {
          print("PRESS 1 TO TREATE PATEIENT ");
          print("PRESS 2 TO GO BACK TO HOME PAGE ");
          int choice = int.parse(stdin.readLineSync()!);
          if (choice == 1) {
            treatpatient(
                employeeInformation, doctorInformation, patientInformation);
          } else if (choice == 2) {
            home(employeeInformation, doctorInformation, patientInformation);
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

void treatpatient(employeeInformation, doctorInformation, patientInformation) {
  while (true) {
    // Dequeue patient if there are patients in the queue
    if (patientInformation.isNotEmpty) {
      var patient = patientInformation.removeFirst();
      print("Patient treated: $patient");
    } else {
      print("No patients in the queue.");
    }
    print("\nDo you want to enter another employee record? (yes/no)");
    String response = stdin.readLineSync()!.toLowerCase();
    if (response != 'yes') {
      doctor(employeeInformation, doctorInformation, patientInformation);
    }
  }
}

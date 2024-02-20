import 'dart:io';
import "Home.dart";
import "Owner.dart";
import "dart:collection";

void employee(
    List<Map<String, dynamic>> employeeInformation,
    List<Map<String, dynamic>> doctorInformation,
    Queue<Map<String, dynamic>> patientInformation) {
  String decision = "";
  do {
    print("ENTER YOUR NAME ");
    String name = stdin.readLineSync()!;
    print("ENTER YOUR PASSWORD ");
    String userId = stdin.readLineSync()!;
    bool validCredentials = false;
    for (var employee in employeeInformation) {
      if (name == employee["name"] && userId == employee["userId"]) {
        validCredentials = true;
        do {
          print("PRESS 1 TO ENTER THE NEW DOCTOR DATA");
          print("PRESS 2 TO UPDATE DOCTOR DATA");
          print("PRESS 3 TO DELETE DOCTOR DATA");
          print("PRESS 4 TO ENTER THE NEW PATIENT DATA");
          print("PRESS 5 TO UPDATE PATIENT DATA");
          print("PRESS 6 TO DELETE PATIENT DATA");
          print("PRESS 7 TO CHECK ALL REOCRD OF DOCTOR");
          print("PRESS 8 TO CHECK ALL RECORDS OF PATIENT");
          print("PRESS 9 TO GO TO HOME PAGE");
          int choice = int.parse(stdin.readLineSync()!);
          if (choice == 1) {
            enterDoctorData(
                employeeInformation, doctorInformation, patientInformation);
          } else if (choice == 2) {
            updateDoctorData(
                employeeInformation, doctorInformation, patientInformation);
          } else if (choice == 3) {
            deleteDoctorData(
                employeeInformation, doctorInformation, patientInformation);
          } else if (choice == 4) {
            //enterPatientData(patientInformation);
          } else if (choice == 5) {
            //updatePatientData(patientInformation);
          } else if (choice == 6) {
            //deletePatientData(patientInformation);
          } else if (choice == 7) {
            checkDoctorAllRecord(doctorInformation);
          } else if (choice == 8) {
            //checkPatientAllRecord(patientInformation);
          } else if (choice == 9) {
            home(employeeInformation, doctorInformation, patientInformation);
          }
        } while (true);
      }
    }
    if (!validCredentials) {
      print("Name of the employee or id is incorrect !");
      print("Do you want to continue? (yes/no)");
      decision = stdin.readLineSync()!;
    }
  } while (decision.toLowerCase() == "yes");
}

void enterDoctorData(
    List<Map<String, dynamic>> employeeInformation,
    List<Map<String, dynamic>> doctorInformation,
    Queue<Map<String, dynamic>> patientInformation) {
  while (true) {
    print("\nEnter details for a new doctor:");
    print("Enter the name of the doctor:");
    String name = stdin.readLineSync()!;
    print("Enter the age of the doctor:");
    int age = int.tryParse(stdin.readLineSync()!) ?? 0;
    print("Enter the gender of the doctor:");
    String gender = stdin.readLineSync()!;
    print("Enter the year of experience of the doctor");
    int experience = int.tryParse(stdin.readLineSync()!) ?? 0;
    String userId = generateUserId(name); // Generate User ID
    print("userId :$userId");
    Map<String, dynamic> doctor = {
      "userId": userId,
      "name": name,
      "age": age,
      "gender": gender,
      "experience": experience,
    };

    doctorInformation.add(doctor);

    print("\nDo you want to enter another employee record? (yes/no)");
    String response = stdin.readLineSync()!.toLowerCase();
    if (response != 'yes') {
      employee(employeeInformation, doctorInformation, patientInformation);
    }
  }
}

void checkDoctorAllRecord(doctorInformation) {
  print(doctorInformation);
}

void updateDoctorData(
    List<Map<String, dynamic>> employeeInformation,
    List<Map<String, dynamic>> doctorInformation,
    Queue<Map<String, dynamic>> patientInformation) {
  bool isValidInput = false;

  while (!isValidInput) {
    print("Enter the name of Doctor :");
    String name = stdin.readLineSync()!;
    print("Enter the ID of the Doctor :");
    String id = stdin.readLineSync()!;

    for (var information in doctorInformation) {
      if (name == information["name"] && id == information["userId"]) {
        isValidInput = true;
        print("Now enter the updated information :");
        print("Enter the name of the doctor:");
        information["name"] = stdin.readLineSync()!;
        print("Enter the age of the doctor:");
        information["age"] = int.tryParse(stdin.readLineSync()!) ?? 0;
        print("Enter the gender of the doctor:");
        information["gender"] = stdin.readLineSync()!;
        print("Enter the updated id");
        information["userId"] = stdin.readLineSync()!;
        print("doctor information updated successfully.");
        break;
      }
    }

    if (!isValidInput) {
      print("Invalid doctor name or ID. Do you want to try again? (yes/no)");
      String tryAgain = stdin.readLineSync()!.toLowerCase();
      if (tryAgain != "yes") {
        employee(employeeInformation, doctorInformation, patientInformation);
      }
    }
  }
}

void deleteDoctorData(
    List<Map<String, dynamic>> employeeInformation,
    List<Map<String, dynamic>> doctorInformation,
    Queue<Map<String, dynamic>> patientInformation) {
  bool isValidInput = false;
  print("Enter the name of doctor :");
  String name = stdin.readLineSync()!;
  print("Enter the ID of the doctor :");
  String id = stdin.readLineSync()!;
  while (!isValidInput) {
    for (var information in doctorInformation) {
      if (name == information["name"] && id == information["userId"]) {
        isValidInput = true;
        information.remove("userId");
        information.remove("name");
        information.remove("age");
        information.remove("gender");
        information.remove("experience");
        break;
      }
    }
    if (!isValidInput) {
      print("Invalid employee name or ID. Do you want to try again? (yes/no)");
      String tryAgain = stdin.readLineSync()!.toLowerCase();
      if (tryAgain != "yes") {
        employee(employeeInformation, doctorInformation, patientInformation);
      }
    }
  }
}

void enterPatientData(
    List<Map<String, dynamic>> employeeInformation,
    List<Map<String, dynamic>> doctorInformation,
    Queue<Map<String, dynamic>> patientInformation) {}

import 'dart:io';
import 'account.dart';

class Authenticator {
  //for decoration purpose
  final String reset = '\x1B[0m'; // Reset all styles
  final String red = '\x1B[31m'; // Red text
  final String green = '\x1B[32m'; // Green text
  final String blue = '\x1B[34m'; // Blue text
  final String yellow = '\x1B[33m'; // Yellow text

  //immutable constant
  final int maxAttempt = 3;

  /// Handles the login process with user input and authentication.
  bool login(Account account) {
    while (account.loginAttempt! < maxAttempt) {
      print("${yellow}Enter username:${reset}");
      String inputedUserName = stdin.readLineSync()!;

      print("${yellow}Enter PIN:${reset}");
      int inputedPin = int.parse(stdin.readLineSync()!);

      if (verifyInfo(account, inputedUserName, inputedPin)) {
        print("${green}Login successful!${reset} ");
        return true;
      } else {
        account.loginAttempt = account.loginAttempt! + 1;
        int remainingAttempts = maxAttempt - account.loginAttempt!;
        print(
            "${red}Invalid username or PIN. Attempts left: $remainingAttempts${reset}");
      }
    }

    return false;
  }

  /// Verifies the username and PIN against the account's credentials.
  bool verifyInfo(Account account, String inputedUserName, int inputedPin) {
    return account.userName == inputedUserName && account.pin == inputedPin;
  }
}

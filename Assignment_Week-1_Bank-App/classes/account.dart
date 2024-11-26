import 'dart:io';
// import 'authenticator.dart';

/// "Account" class is an object that has attribute for one person's account
class Account {
  //for decoration
  final String reset = '\x1B[0m'; // Reset all styles
  final String red = '\x1B[31m'; // Red text
  final String green = '\x1B[32m'; // Green text
  final String blue = '\x1B[34m'; // Blue text
  final String yellow = '\x1B[33m'; // Yellow text
  final String cyan = '\x1B[36m'; // Cyan text
  final String brightGreen = '\x1B[1;32m'; // Bright Green text

  //attributes
  int? loginAttempt;
  String? userName;
  int? pin;
  int? balance;

  /// withdraw a spesific amount from user's account
  void withdrawBalance(int x) {
    String? yesNo;

    print(
        "${blue}Are You Sure Want to Withdraw${reset} ${brightGreen}Rp.${x}${reset} ${blue}? ${reset}${yellow}(Y/N)${reset}");
    yesNo = stdin.readLineSync()!;
    if (yesNo == "Y") {
      if (balance! >= x) {
        // balance cannot be less then withdrawal amount
        balance = balance! - x;
        print("${green}Withdrawal Success!${reset}");
        print(
            "${blue}Your Remaining Account Balance: ${reset}${brightGreen}Rp.${balance}${reset}");
      } else {
        print("${red}insufficient balance${reset}");
      }
    } else {
      print("${red}Withdrawal Cancelled${reset}");
    }
  }

  /// check user's account balance
  void checkBalance() {
    print("${blue}Your Balance:${reset} ${brightGreen}Rp.${balance}${reset}");
  }

  /// deposit spesific amount of money to user's account
  void depositBalance(int x) {
    String? yesNo;
    print(
        "${blue}Are You Sure Want to Make a Deposit of${reset} ${brightGreen}Rp.${x}${reset}${blue} ? ${reset}${yellow}(Y/N)${reset}"); //clarify user's action
    yesNo = stdin.readLineSync()!; //takes user's answer
    if (yesNo == "Y") {
      //action will be executed
      balance = balance! + x;
      print("${green}Deposit Succes!${reset}");
      checkBalance();
    } else {
      print("${red}Deposit Cancelled${reset}");
    }
  }

  //Account Constructor
  Account({this.userName, this.pin, this.balance, this.loginAttempt});
}

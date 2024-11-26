import 'dart:io';
import 'classes/account.dart';
import 'classes/authenticator.dart';
import 'general_function/menu.dart';

void main() {
  //for decoration purpose
  const String reset = '\x1B[0m'; // Reset all styles
  const String red = '\x1B[31m'; // Red text
  const String green = '\x1B[32m'; // Green text
  const String blue = '\x1B[34m'; // Blue text
  const String yellow = '\x1B[33m'; // Yellow text

  int? choice = -1; //initiate choice variable to -1 for the nonexisting case
  int? withDrawNominal, depositNominal; //amount og withdrawal and deposit
  String? yesNo =
      "Y"; //initiate yesNo variable with "Y" so we can continue to menu's choices

  //set person1's values
  Account person1 = Account(
      userName: "Veiron", pin: 123456, balance: 777777777, loginAttempt: 0);

  //make an authenticator
  Authenticator authenticator = Authenticator();
  print('''

            ${blue}██╗   ██╗${reset}             
            ${blue}██║   ██║${reset}             
            ${blue}██║   ██║${reset}             
            ${blue}╚██╗ ██╔╝${reset}             
             ${blue}╚████╔╝${reset}              
              ${blue}╚═══╝${reset}               
                                  
${blue}██████╗  █████╗ ███╗   ██╗██╗  ██╗${reset}
${blue}██╔══██╗██╔══██╗████╗  ██║██║ ██╔╝${reset}
${blue}██████╔╝███████║██╔██╗ ██║█████╔╝${reset} 
${blue}██╔══██╗██╔══██║██║╚██╗██║██╔═██╗${reset} 
${blue}██████╔╝██║  ██║██║ ╚████║██║  ██╗${reset}
${blue}╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝${reset}               
  ''');

  if (authenticator.login(person1)) {
    while (choice != 0 && yesNo == "Y") {
      choice = menu();
      switch (choice) {
        //handling user's choices
        case 1:
          person1.checkBalance();
          break;

        case 2:
          print("${yellow}Insert Withdrawal Amount:${reset} ");
          withDrawNominal = int.parse(stdin.readLineSync()!);
          person1.withdrawBalance(withDrawNominal);
          break;

        case 3:
          print("${yellow}Insert Deposit Amount:${reset} ");
          depositNominal = int.parse(stdin.readLineSync()!);
          person1.depositBalance(depositNominal);
      }
      if (choice != 0) {
        //conditional to ask user if they want to go back to menu

        print("${blue}Back to Menu?${reset} ${yellow}(Y/N)${reset}");
        yesNo = stdin.readLineSync()!;
      }
    }
  } else {
    print("${red}Maximum login attempts exceeded. Login failed.${reset}");
    print("${red}Authentication failed: your account has been blocked${reset}");
  }
  print(" ");
  print("${green}CODE BY VEIRON VAYA YARIEF${reset}");
  print("${green}Thanks to MotionLab ${reset}");
}

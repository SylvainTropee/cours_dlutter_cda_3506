//Variables
// void main(){
//
//   String hello = "Hello World";
//   print(hello);
//
//   //inférence de type
//   var name = "Michel";
//   name = "Bernard";
//   // name = 12; // pas possible
//
//   //type tout
//   dynamic test = 12;
//   test = "Michel";
//
//   //constante
//   const age = 22;
//   // age = 40; pas possible
//
//   //gestion du null
//   String? city = null;
//
//   print(city?.toUpperCase() ?? "Quimper");
//   print(city!.toUpperCase());
// }


// fonctions et paramètres
void main(){
  displayMessage("Michel", 22);
  displayMessage2(message: "Coucou");
}

void displayMessage(String message, int number){

  for(int i = 0; i < number; i++){
    print(message);
  }
}

void displayMessage2({required String message, int number = 1}){

  for(int i = 0; i < number; i++){
    print(message);
  }
}






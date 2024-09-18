void main() {
  //Declarar una viriable para almacenar nombre
  var myName = 'Brandon';
  String myLastName = "Gutierrez";
  final int myDNI = 230893;
  late final int myAge;

  //corregir mi nombre
  myName = "Brayan";
  //myDNI = 21016181; //esto acciono un error porque no puede actualizar su valor

  print(
      'Hola $myName $myLastName, tu matricula es : $myDNI y tu edad aun no la conozco, por que no se cuando naciste');

  //interpolacion el valor de las variables con metodos de manipulacion

  print(
      '\nHola, ${myName.toUpperCase()}, ${myLastName.toUpperCase()}, tu matricula es: $myDNI y tu edad aun no la conozco, porque no se cuando naciste');
}


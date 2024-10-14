void main() {

/*   Un Future es una tarea asincronica que se resuelva a destiempo. No es más que un tipo de dato en el que
     sabemos que se resolverá en un determinado tiempo, no de manera inmediata. Podemos usar un Future para pedir información a un servidor por ejemplo.  */
 
  // Se imprime un mensaje que indica el inicio del programa.
  print('Inicio del programa');
  
  // Se llama a la función httpGet con una URL como parámetro.
  // En esta caso use la url de google
  httpGet('https://www.google.com.mx/?hl=es-419')
    .then((value) {
      // si no ocurre error se imprime
      print(value);
    })
    .catchError((err) {
      // Si ocurre un error, se imprime el error
      print('Error: $err');
    });
  
  // Se imprime un mensaje que indica el final del programa.
  print('Fin del programa');
}

// Un método que demorará unos segundos en retornar su resultado.
Future<String> httpGet(String url) {
 // El delayed hará que esperemos 4 segundos para devolvernos un mensaje.
  return Future.delayed(const Duration(seconds: 2), () {
    // Se imprime un error en la petición.
    throw 'Error en la petición http';
    // respuesta de la peticion
  });
}

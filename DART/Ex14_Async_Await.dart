//Primero que nada el método debe ser marcado por un async para decir al compilador que se trata de una función asincrona. 
//Importante Para hacer uso del await necesitas que la función donde se use necesariamente debe estar marcado con un async.
void main() async {
  // Inicio del programa
  print('Inicio del programa');
  
  try {
    // Realizar una solicitud HTTP y esperar la respuesta
    final value = await httpGet('https://www.google.com.mx/?hl=es-419');
    // Imprimir el valor recibido
    print(value);
  } catch (err) {
    // Si hay errrores de la solicitud se imprime
    print('Tenemos un error: $err');
  }
  
  // Fin del programa
  print('Fin del programa');
}

Future<String> httpGet(String url) async {
  // El delayed hará que esperemos 4 segundos para devolvernos un mensaje.
/*   Entonces usamos el await para recibir el Future<string> y pedirle que el flujo se espere hasta recibir estos datos.
  Solo cuando reciba los datos el flujo normal continuará pero solo en esta función marcada con el async. */
  await Future.delayed(const Duration(seconds: 2));
  // Lanzar una excepción para simular un error en la solicitud
  throw 'Error en la petición';
}

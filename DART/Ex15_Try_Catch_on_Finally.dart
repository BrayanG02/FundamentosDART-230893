/* La combinación de "try", "catch" y "finally" ayuda a gestionar de forma ordenada diferentes 
aspectos del manejo de errores. El bloque 'try' contiene el código que podría generar una excepción.
El bloque 'catch' captura y maneja la excepción si ocurre alguna,y el bloque 'finally' consta de código
que se ejecutará independientemente de si ocurrió o no una excepción. */
void main() async {
  // Inicio del programa
  print('Inicio del programa');
  
  try {
    // Realizar una solicitud HTTP y esperar la respuesta
    final value = await httpGet('https://www.google.com.mx/?hl=es-419');
    // Imprimir el valor en caso de éxito
    print('éxito: $value');
    
  } on Exception catch (err) {
     // Si hay errrores de la solicitud se imprime
    print('Tenemos una Exception: $err');
    
  } catch (err) {
    // Segundo manejo de error
    print('OOP!! algo terrible pasó: $err');
    
  } finally {
    // Código que se ejecuta siempre aunque no haya errores
    print('Fin del try y catch');
  }
  
  // Fin del programa
  print('Fin del programa');
}

Future<String> httpGet(String url) async {
  // El delayed hará que esperemos 4 segundos para devolvernos un mensaje.
  await Future.delayed(const Duration(seconds: 1));
  
  // Lanzar una excepción con el mensaje
  throw Exception('No hay parámetros en el URL');
  
  // throw 'Error en la petición';
  // return 'Tenemos un valor de la petición'; 
}

void main() {

/*En Dart hay dos tipos de streams: streams de suscripción única y streams de difusión. La diferencia 
  clave entre ellos es el número de suscripciones que pueden realizar.
  La primera toma una sola suscripción mientras que la segunda puede tomar tantas como sea necesario
   (el propio nombre justifica que emita datos).*/


  //cada valor se imprime con el mensaje "Stream value" y valor.
  emitNumbers().listen((value) {
    print('Stream value: $value');
  });
}

// Función que devuelve un Stream de enteros.
Stream<int> emitNumbers() {
  // stream.periodic genere un evento cada cierto periodo
  //en este caso la duracion del peiodo sera cada 2 segundos
  //y take imprimira los 5 primeros valores segun el tiempo de periodo que se asigno
  return Stream.periodic(const Duration(seconds: 2), (value) {
    return value;
  }).take(5);
}

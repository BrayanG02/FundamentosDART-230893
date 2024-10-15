void main() {
  // Con listen se escucha el Stream utilizando el método listen, que imprime cada valor emitido.
  emitNumber().listen((int value) {
    //cada valor se imprime con el mensaje "Stream value" y valor.
    print('Stream value: $value');
  });
}

// Función asíncrona que devuelve un Stream de enteros.
Stream<int> emitNumber() async* {
  //Array valuesToEmit que contiene valores definidos.
  final valuesToEmit = [1, 2, 3, 4, 10];
   //La emisión está controlada de forma explícita dentro del bucle for. 
  // Se recorre la lista de valores.
  for (int i in valuesToEmit) {
    // Se espera 2 segundos por cada intervalo de valor a imprimir
    await Future.delayed(const Duration(seconds: 2));
    // Se emite el valor actual con yield.
    yield i;
  }
}

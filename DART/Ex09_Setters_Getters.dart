void main() {
  final mySquare = Square(side: 18);
  
  // Intentamos cambiar el valor del lado del cuadrado usando el setter
  try {
    mySquare.side = -32; // Esto debería generar un error debido a la validación del setter
  } catch (e) {
    print(e); // Se captura y muestra el mensaje de error
  }

  print("""Lado del Cuadrado: ${mySquare.side}
Área que ocupa: ${mySquare.calculateArea()}""");
}

class Square {
  double _side;

  // Constructor que inicializa el lado del cuadrado
  Square({required double side}) : _side = side;

  // Getter que calcula y devuelve el área del cuadrado
  double get area {
    return _side * _side;
  }

  // Setter que valida si el nuevo valor es positivo antes de asignarlo
  set side(double value) {
    print("Asignando un valor al lado: $value");
    if (value < 0) throw 'El valor del lado debe ser mayor a 0.'; // Lanza un error si el valor es negativo
    _side = value;
  }

  // Getter que permite obtener el valor actual del lado
  double get side => _side;

  // Método que calcula y retorna el área del cuadrado
  double calculateArea() {
    return _side * _side;
  }
}

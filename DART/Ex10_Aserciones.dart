void main() {
   // Crear instancias de plantas de energía
  final windPlant = WindPlant( initialEnergy: 100 ); 
  final nuclearPlant = NuclearPlant( energyLeft: 1000 ); 
  
  // Cargar el teléfono usando las plantas de energía y mostrar los resultados
  print( 'wind: ${ chargePhone( windPlant ) }' );
  print( 'nuclear: ${ chargePhone( nuclearPlant ) }' );
}

// Función para cargar el teléfono
double chargePhone( EnergyPlant plant ) {
   // Comprobar si hay suficiente energía
  if ( plant.energyLeft < 10 ) {
    // Lanzar excepción si no hay suficiente energía
    throw Exception('Not enough energy');
  }
    
  return plant.energyLeft - 10;
}

// Enumeración para definir tipos de plantas
enum PlantType { nuclear, wind, water }

// Clase abstracta que representa una planta de energía
abstract class EnergyPlant {
  
  double energyLeft;
  final PlantType type; // nuclear, wind, water
  
   // Constructor que inicializa la energía y el tipo
  EnergyPlant({ 
    required this.energyLeft, 
    required this.type 
  });
  
    // Método abstracto para consumir energía
  void consumeEnergy( double amount );
  
}

// Clase que representa una planta eólica
class WindPlant extends EnergyPlant {
  
  WindPlant({ required double initialEnergy })
      : super( energyLeft: initialEnergy, type: PlantType.wind );
  
    // Implementación del método para consumir energía
  @override
  void consumeEnergy( double amount ) {
    energyLeft -= amount;
  }
}

// Clase que representa una planta 
class NuclearPlant implements EnergyPlant {
  
  @override
  double energyLeft; // Energía disponible
  
  // Establecer el tipo como nuclear
  @override
  final PlantType type = PlantType.nuclear;
  
   // Constructor que inicializa la energía
  NuclearPlant({ required this.energyLeft });
  
  // Implementación del método para consumir energía
  @override
  void consumeEnergy( double amount ) {
    energyLeft -= (amount * 0.5);  // Consumir la mitad de la energía
  }
}
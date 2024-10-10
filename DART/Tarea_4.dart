void main() {
  // Caso 1: NUEVO PACIENTE QUE SE REGISTRA EL DIA DE HOY
   print("Caso 1: NUEVO PACIENTE QUE SE REGISTRA EL DIA DE HOY");
  final pacienteReciente = Paciente(
    identificacion: 1,
    nombre: "Brayan",
    apellidoPaterno: "Gutierrez",
    apellidoMaterno: "Ramirez",
    genero: "Masculino",
    tipoSangre: "O+",
    fechaNacimiento: DateTime(1995, 5, 10),
    nss: "1234567890",
    tipoDeSeguro: "Seguro Social",
    estadoVida: "Vivo",
    estadoMedico: "Estable",
    ultimaConsulta: DateTime.now(),  // Fecha actual
    fechaRegistro: DateTime.now(),   // Fecha actual
  );
  print(pacienteReciente);
 

  // Caso 2: DE UN PACIENTE NUEVO, QUE ALGUNA VEZ FUE TRABAJADOR DEL HOSPITAL
  print("Caso 2: DE UN PACIENTE NUEVO, QUE ALGUNA VEZ FUE TRABAJADOR DEL HOSPITAL");
  final pacienteTrabajador = Paciente(
    identificacion: 2,
    nombre: "Ana Laura",
    apellidoPaterno: "Ramirez",
    genero: "Femenino",
    tipoSangre: "O+",
    fechaNacimiento: DateTime(1987, 11, 21),
    nss: "9876543210",
    tipoDeSeguro: "Seguro Privado",
    estadoVida: "Vivo",
    estadoMedico: "En observación",
    ultimaConsulta: DateTime(2023, 12, 12),  // Fecha previa
    fechaRegistro: DateTime(2023, 6, 15),    // Fecha previa
    fueTrabajador: true,
  );
  print(pacienteTrabajador);

  // Caso 3: PACIENTE QUE ACABA DE FALLECER
  print("Caso 3: PACIENTE QUE ACABA DE FALLECER");
  final pacienteFallecido = Paciente(
    identificacion: 3,
    nombre: "Yung",
    apellidoPaterno: "Ramirez",
    genero: "Masculino",
    tipoSangre: "O-",
    fechaNacimiento: DateTime(1970, 3, 15),
    nss: "5432167890",
    tipoDeSeguro: "Seguro Público",
    estadoVida: "Fallecido",
    estadoMedico: "N/A",
    ultimaConsulta: DateTime(2022, 9, 30),   // Fecha previa
    fechaRegistro: DateTime(2022, 1, 1),     // Fecha previa
  );
  pacienteFallecido.registrarDefuncion();
  print(pacienteFallecido);
}

abstract class Persona {
  int identificacion;
  String nombre;
  String apellidoPaterno;
  String? apellidoMaterno;
  String genero;
  String tipoSangre;
  DateTime fechaNacimiento;
  bool activo;
  DateTime fechaRegistro;
  DateTime? fechaActualizacion;

  Persona({
    required this.identificacion,
    required this.nombre,
    required this.apellidoPaterno,
    this.apellidoMaterno,
    required this.genero,
    required this.tipoSangre,
    required this.fechaNacimiento,
    this.activo = true,
    DateTime? fechaRegistro,
    this.fechaActualizacion,
  }) : fechaRegistro = fechaRegistro ?? DateTime.now();

  @override
  String toString() {
    String fechaFormateada = "${fechaNacimiento.day.toString().padLeft(2, '0')}/" +
        "${fechaNacimiento.month.toString().padLeft(2, '0')}/${fechaNacimiento.year}";
    String registroFormateado = "${fechaRegistro.day.toString().padLeft(2, '0')}/" +
        "${fechaRegistro.month.toString().padLeft(2, '0')}/${fechaRegistro.year}";

    return 
    """--------------------------------------------------------------
    ID: $identificacion
    Nombre Completo: $nombre $apellidoPaterno $apellidoMaterno
    Género: $genero
    Grupo Sanguíneo: $tipoSangre
    Fecha de Nacimiento: $fechaFormateada
    Fecha de Registro: $registroFormateado
    --------------------------------------------------------------
    """;
  }
}

class Paciente extends Persona {
  String nss;
  String tipoDeSeguro;
  String estadoVida;
  String estadoMedico;
  DateTime ultimaConsulta;
  bool fueTrabajador;

  Paciente({
    required int identificacion,
    required String nombre,
    required String apellidoPaterno,
    String? apellidoMaterno,
    required String genero,
    required String tipoSangre,
    required DateTime fechaNacimiento,
    required this.nss,
    required this.tipoDeSeguro,
    required this.estadoVida,
    required this.estadoMedico,
    required this.ultimaConsulta,
    DateTime? fechaRegistro,
    this.fueTrabajador = false,
  }) : super(
          identificacion: identificacion,
          nombre: nombre,
          apellidoPaterno: apellidoPaterno,
          apellidoMaterno: apellidoMaterno,
          genero: genero,
          tipoSangre: tipoSangre,
          fechaNacimiento: fechaNacimiento,
          fechaRegistro: fechaRegistro,
        );

  void registrarDefuncion() {
    estadoVida = "Fallecido";
    estadoMedico = "N/A";
    activo = false;
    fechaActualizacion = DateTime.now();
  }

  @override
  String toString() {
    String baseInfo = super.toString();
    String consultaFormateada = "${ultimaConsulta.day.toString().padLeft(2, '0')}/" +
        "${ultimaConsulta.month.toString().padLeft(2, '0')}/${ultimaConsulta.year}";
    return 
    """
    $baseInfo
    NSS: $nss
    Tipo de Seguro: $tipoDeSeguro
    Estado de Vida: $estadoVida
    Estado Médico: $estadoMedico
    Última Consulta: $consultaFormateada
    Ex Trabajador: ${fueTrabajador ? 'Sí' : 'No'}
    --------------------------------------------------------------
    """;
  }
}

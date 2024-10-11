void main() {
  // Caso 1: NUEVO PACIENTE QUE SE REGISTRA EL DIA DE HOY
print("---------------------Caso 1-----------------------");
print("Caso 1: NUEVO PACIENTE QUE SE REGISTRA EL DIA DE HOY");
  final nuevoPaciente = Paciente(
    id: 1,
    nombre: "Brayan",
    apellidoPaterno: "Gutierrez",
    apellidoMaterno: "Ramirez",
    genero: Genero.hombre,
    grupoSanguineo: GrupoSanguineo.APositivo,
    curp:"GURB020718HPLTMRA1",
    fechaNacimiento: DateTime(1995, 5, 10),
    estatusVida: EstatusVida.Vivo,
    estadoMedico: "Estable",
    nss: "1234567890",
    tipoDeSeguro: "Seguro Social",
    ultimaConsulta: DateTime.now(),  // Fecha actual
    fechaRegistro: DateTime.now(),   // Fecha actual
  );
  print(nuevoPaciente);
 

 print("\n-------------Caso 2---------------------------\n");
  // Caso 2: DE UN PACIENTE NUEVO, QUE ALGUNA VEZ FUE TRABAJADOR DEL HOSPITAL
  print("Caso 2: DE UN PACIENTE NUEVO, QUE ALGUNA VEZ FUE TRABAJADOR DEL HOSPITAL");
  final pacienteTrabajador = Paciente(
    id: 2,
    nombre: "Ana Laura",
    apellidoPaterno: "Ramirez",
    apellidoMaterno:"Rivera"
    genero: Genero.mujer,
    grupoSanguineo: GrupoSanguineo.BNegativo,
    curp: "GAMM020202MDFRRA09",
    fechaNacimiento: DateTime(2002, 02, 02),
    estatusVida: EstatusVida.Vivo,
    estatusMedico: "ex-trabajadora",
    nss: "98765432101",
    tipoSeguro: TipoSeguro.ISSSTE,
    fechaUltimaCita: DateTime.now(),
    fechaRegistro: DateTime.now().subtract(Duration(days: 100)),
  );
  print(pacienteTrabajador);


 print("\n-------------------Caso 3----------------------\n");
  // Caso 3: PACIENTE QUE ACABA DE FALLECER
  print("Caso 3: PACIENTE QUE ACABA DE FALLECER");
  final pacienteFallecido = Paciente(
    id: 3,
    nombre: "Yung",
    apellidoPaterno: "Ramirez",
    apellidoMaterno:"Kawasaki"
    genero: Genero.hombre,
    grupoSanguineo: GrupoSanguineo.ONegativo,
    curp: "SAFP990303HDFRNR02",
    fechaNacimiento: DateTime(1999, 03, 03),
    estatusVida: EstatusVida.Vivo,
    estatusMedico: "crítico",
    nss: "13579246801",
    tipoSeguro: TipoSeguro.SeguroPopular,
    fechaUltimaCita: DateTime.now(),
    fechaRegistro: DateTime.now().subtract(Duration(days: 90)),
  );
  pacienteFallecido.registrarDefuncion();
  print(pacienteFallecido);
}

// Definiciones de enumeraciones para estados de vida, tipos de seguro, grupos sanguíneos y géneros.
enum EstatusVida { Vivo, Fallecido }
enum TipoSeguro { IMSS, ISSSTE, SeguroPopular }
enum GrupoSanguineo { OPositivo, ONegativo, APositivo, ANegativo, BPositivo, BNegativo }
enum Genero { hombre, mujer, otro }

abstract class Persona {
  int id;
  String nombre;
  String apellidoPaterno;
  String? apellidoMaterno;
  String genero;
  GrupoSanguineo grupoSanguineo;
  String? curp;
  DateTime fechaNacimiento;
  bool estatus;
  DateTime fechaRegistro;
  DateTime? fechaActualizacion;

  // Constructor para inicializar los atributos de una persona.
  Persona({
    required this.id,
    required this.nombre,
    required this.apellidoPaterno,
    this.apellidoMaterno,
    required this.genero,
    required this.grupoSanguineo,
    this.curp,
    required this.fechaNacimiento,
    this.estatus = true,
    DateTime? fechaRegistro,
    this.fechaActualizacion,
  }) : fechaRegistro = fechaRegistro ?? DateTime.now();

  @override
  String toString() {
    // Formatea la fecha de nacimiento y la fecha de registro para mostrarlas correctamente.
    String formatFechaNacimiento = "${fechaNacimiento.day.toString().padLeft(2, '0')}/" +
        "${fechaNacimiento.month.toString().padLeft(2, '0')}/${fechaNacimiento.year}";
    String formatFechaRegistro = "${fechaRegistro.day.toString().padLeft(2, '0')}/" +
        "${fechaRegistro.month.toString().padLeft(2, '0')}/${fechaRegistro.year} " +
        "${fechaRegistro.hour.toString().padLeft(2, '0')}:" +
        "${fechaRegistro.minute.toString().padLeft(2, '0')}:" +
        "${fechaRegistro.second.toString().padLeft(2, '0')}";

    curp ??= "No registrado"; // Si la CURP no está registrada, se muestra "No registrado".
    String status = estatus ? "Activo" : "Inactivo"; // Estatus de la persona.

    // Retorna los datos en un formato legible.
    return """
      --------------------------------------------------------------
      DATOS DE LA PERSONA
      --------------------------------------------------------------
      ID: $id,
      Nombre: $nombre $apellidoPaterno ${apellidoMaterno ?? ""}
      Género: ${genero.name}
      Grupo Sanguíneo: ${grupoSanguineo.name}
      Fecha de nacimiento: $formatFechaNacimiento
      CURP: $curp
      Estatus: $status
      Fecha de registro: $formatFechaRegistro
      --------------------------------------------------------------
    """;
  }
}

// Clase Paciente que extiende de Persona, añadiendo atributos específicos para un paciente.
class Paciente extends Persona {
  EstatusVida estatusVida; // Estado de vida del paciente (Vivo o Fallecido).
  String estatusMedico; // Estatus médico actual del paciente.
  String nss; // Número de seguro social del paciente.
  TipoSeguro tipoSeguro; // Tipo de seguro médico.
  DateTime fechaUltimaCita; // Fecha de la última cita médica.

  // Constructor que inicializa un objeto Paciente.
  Paciente({
    required int id,
    required String nombre,
    required String apellidoPaterno,
    String? apellidoMaterno,
    required Genero genero,
    required GrupoSanguineo grupoSanguineo,
    String? curp,
    required DateTime fechaNacimiento,
    required this.estatusVida,
    required this.estatusMedico,
    required this.nss,
    required this.tipoSeguro,
    required this.fechaUltimaCita,
    required DateTime fechaRegistro,
  }) : super(
            id: id,
            nombre: nombre,
            apellidoPaterno: apellidoPaterno,
            apellidoMaterno: apellidoMaterno,
            genero: genero,
            grupoSanguineo: grupoSanguineo,
            curp: curp,
            fechaNacimiento: fechaNacimiento,
            fechaRegistro: fechaRegistro);

  // Método que cambia el estatus de vida a "Fallecido" y registra la defunción.
  void registrarDefuncion({required String motivo}) {
    // Genera el mensaje personalizado con motivo y fecha.
    final fechaDefuncion = DateTime.now();
    estatusVida = EstatusVida.Fallecido; // Cambia el estado a Fallecido.
    estatusMedico = "Fallecido $motivo. Fecha: $fechaDefuncion"; // Incluye motivo y fecha en el estatus.
  }

  // Sobrescribe el método toString para incluir los datos específicos del paciente.
  @override
  String toString() {
    // Llama al método toString de la clase Persona y añade los datos específicos del paciente.
    String output = super.toString();
    output += "Estatus vida: $estatusMedico\n" +  // Estatus vida con motivo y fecha
              "NSS: $nss\n" +
              "Tipo de seguro: ${tipoSeguro.name}\n" +
              "Fecha de última cita: ${fechaUltimaCita.day.toString().padLeft(2, '0')}/" +
              "${fechaUltimaCita.month.toString().padLeft(2, '0')}/${fechaUltimaCita.year}\n";
    return output;
  }
}

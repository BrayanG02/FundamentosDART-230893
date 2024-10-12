void main() {
    // Caso 1: NUEVO PACIENTE QUE SE REGISTRA EL DÍA DE HOY
    print("---------------------Caso 1-----------------------");
    print("Caso 1: NUEVO PACIENTE QUE SE REGISTRA EL DÍA DE HOY");

    final nuevoPaciente = Paciente(
        id: 1,
        nombre: "Brayan",
        apellidoPaterno: "Gutierrez",
        apellidoMaterno: "Ramirez",
        genero: Genero.Hombre,
        grupoSanguineo: GrupoSanguineo.APositivo,
        curp: "GURB020718HPLTMRA1",
        estatus: Estatus.Activo,
        fechaNacimiento: DateTime(1995, 5, 10),
        estatusVida: EstatusVida.Vivo,
        estatusMedico: "Estable",
        nss: "1234567890",
        tipoSeguro: TipoSeguro.ISSSTE,
        fechaUltimaCita: DateTime.now(),
        fechaRegistro: DateTime.now(),
    );

    // Operaciones CRUD Caso 1
    print("\n---Creando nuevo paciente---");
    nuevoPaciente.crearPaciente(); // Crear

    print("\n---Mostrando datos del paciente---");
    print(nuevoPaciente); // Mostrando datos con toString()

    print("\n---Actualizando estatus médico del paciente---");
    nuevoPaciente.actualizarPaciente("Estable con observación"); // Actualizar

    print("\n---Eliminando CURP del paciente---");
    nuevoPaciente.eliminarCurp(); // Eliminar CURP

    print("\n---Mostrando datos del paciente tras la eliminación de CURP---");
    print(nuevoPaciente); // Verificar la eliminación

    // Caso 2: PACIENTE QUE HA TRABAJADO EN EL HOSPITAL ANTERIORMENTE
    print("\n---------------------Caso 2-----------------------");
    print("Caso 2: PACIENTE QUE HA TRABAJADO EN EL HOSPITAL ANTERIORMENTE");

    final pacienteExTrabajador = Paciente(
        id: 2,
        nombre: "Maria",
        apellidoPaterno: "Lopez",
        apellidoMaterno: "Gomez",
        genero: Genero.Mujer,
        grupoSanguineo: GrupoSanguineo.OPositivo,
        curp: "LOGM950303MPLGZR09",
        estatus: Estatus.Suspendido,
        fechaNacimiento: DateTime(1980, 8, 5),
        estatusVida: EstatusVida.Vivo,
        estatusMedico: "Ex-Empleada del Hospital",
        nss: "0987654321",
        tipoSeguro: TipoSeguro.IMSS,
        fechaUltimaCita: DateTime(2024, 10, 1),
        fechaRegistro: DateTime(2022, 3, 20),
    );

    // Operaciones CRUD Caso 2
    print("\n---Mostrando datos del paciente ex-trabajador---");
    print(pacienteExTrabajador);

    // Caso 3: PACIENTE FALLECIDO QUE TRABAJABA EN EL HOSPITAL
    print("\n---------------------Caso 3-----------------------");
    print("Caso 3: PACIENTE FALLECIDO QUE TRABAJABA EN EL HOSPITAL");

    final pacienteFallecido = Paciente(
        id: 3,
        nombre: "Juan",
        apellidoPaterno: "Perez",
        apellidoMaterno: "Martinez",
        genero: Genero.Hombre,
        grupoSanguineo: GrupoSanguineo.BNegativo,
        curp: "PERJ840101HPLMRN04",
        estatus: Estatus.Inactivo,
        fechaNacimiento: DateTime(1984, 1, 1),
        estatusVida: EstatusVida.Fallecido,
        estatusMedico: "Fallecido por causas naturales",
        nss: "1122334455",
        tipoSeguro: TipoSeguro.SeguroPopular,
        fechaUltimaCita: DateTime(2023, 12, 15),
        fechaRegistro: DateTime(2020, 7, 10),
    );

    // Operaciones CRUD Caso 3
    print("\n---Mostrando datos del paciente fallecido---");
    print(pacienteFallecido);

    print("\n---Eliminando NSS del paciente fallecido---");
    pacienteFallecido.eliminarNSS();

    print("\n---Mostrando datos del paciente tras eliminar NSS---");
    print(pacienteFallecido);
}

abstract class Persona {
    int id;
    String nombre;
    String apellidoPaterno;
    String? apellidoMaterno;
    Genero genero;
    GrupoSanguineo grupoSanguineo;
    String? curp;
    DateTime fechaNacimiento;
    Estatus estatus;
    DateTime fechaRegistro;
    DateTime? fechaActualizacion;

    Persona({
        required this.id,
        required this.nombre,
        required this.apellidoPaterno,
        this.apellidoMaterno,
        required this.genero,
        required this.grupoSanguineo,
        this.curp,
        required this.estatus,
        required this.fechaNacimiento,
        DateTime? fechaRegistro,
        this.fechaActualizacion,
    }) : fechaRegistro = fechaRegistro ?? DateTime.now();

    void crearPaciente();

    void mostrarMensaje(String mensaje) {
        print("Mensaje desde Persona: $mensaje");
    }

    // Método para formatear fechas 
    String formatDate(DateTime date) {
        return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";
    }

    // Método que devuelve los datos de la persona en formato de texto.
    @override
    String toString() {
        String formatFechaNacimiento =
            "${fechaNacimiento.day.toString().padLeft(2, '0')}/" +
            "${fechaNacimiento.month.toString().padLeft(2, '0')}/${fechaNacimiento.year}";

        //uso del metodo de formatear fechas
        String formattedFechaRegistro = formatDate(fechaRegistro);
        String formattedFechaActualizacion = fechaActualizacion != null ? formatDate(fechaActualizacion!) : "Aún no a sido actualizado";
       

        return """
               --------------------------------------------------------------
               DATOS DE LA PERSONA
               --------------------------------------------------------------
               ID: $id,
               Nombre: $nombre $apellidoPaterno ${apellidoMaterno ?? ""}
               Género: ${genero.toString().split('.').last}
               Grupo Sanguíneo: ${grupoSanguineo.toString().split('.').last}
               Fecha de nacimiento: $formatFechaNacimiento
               CURP: ${curp ?? 'No registrado'}
               Estatus: ${estatus.toString().split('.').last}
               Fecha de registro: $formattedFechaRegistro
               Fecha de actualización: $formattedFechaActualizacion
               --------------------------------------------------------------
               """;
    }
}

class Paciente extends Persona {
    EstatusVida estatusVida;
    String estatusMedico;
    String nss;
    TipoSeguro tipoSeguro;
    DateTime fechaUltimaCita;

    Paciente({
        required int id,
        required String nombre,
        required String apellidoPaterno,
        String? apellidoMaterno,
        required Genero genero,
        required GrupoSanguineo grupoSanguineo,
        String? curp,
        required Estatus estatus,
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
        estatus: estatus,
        fechaNacimiento: fechaNacimiento,
        fechaRegistro: fechaRegistro,
    );

    // Método para crear un paciente
    @override
    void crearPaciente() {
        print("Paciente $nombre $apellidoPaterno ha sido registrado exitosamente.");
    }

    // Método para actualizar el estatus médico del paciente
    void actualizarPaciente(String nuevoEstatusMedico) {
        this.estatusMedico = nuevoEstatusMedico;
        this.fechaActualizacion = DateTime.now();
        print(
            "El estatus médico del paciente $nombre $apellidoPaterno ha sido actualizado a: $estatusMedico");
    }

    // Método para eliminar CURP del paciente
    void eliminarCurp() {
        this.curp = "Está persona no tiene CURP";
        this.fechaActualizacion = DateTime.now();
        print("El CURP del paciente $nombre $apellidoPaterno ha sido eliminado.");
    }

    // Método para registrar defunción del paciente
    void registrarDefuncion({required String motivo}) {
        this.estatusVida = EstatusVida.Fallecido;
        this.estatusMedico = motivo;
        this.fechaActualizacion = DateTime.now();
        print("Se ha registrado la defunción del paciente $nombre $apellidoPaterno. Motivo: $motivo");
    }

    // Método para eliminar NSS del paciente
    void eliminarNSS() {
        this.nss = "Sin Número de Seguridad Social";
        this.fechaActualizacion = DateTime.now();
        print("El NSS del paciente $nombre $apellidoPaterno ha sido eliminado.");
    }



     // Sobreescribe el método toString para incluir información específica del paciente.
    @override
    String toString() {
       String formattedFechaUltimaCita = formatDate(fechaUltimaCita); // Formatear fecha de última cita
        String output = super.toString(); // Llama al método de la clase base.
      output +="""Estatus vida: ${estatusVida.name}
               Estatus médico: $estatusMedico
               NSS: $nss
               Tipo de seguro: ${tipoSeguro.name}
               Fecha de última cita: $formattedFechaUltimaCita""";
        return output; // Retorna la información completa del paciente.
    }
}

enum Genero { Hombre, Mujer }
enum GrupoSanguineo { APositivo, ANegativo, BPositivo, BNegativo, ABPositivo, ABNegativo, OPositivo, ONegativo }
enum Estatus { Activo, Inactivo, Suspendido }
enum EstatusVida { Vivo, Fallecido }
enum TipoSeguro { IMSS, ISSSTE, SeguroPopular }

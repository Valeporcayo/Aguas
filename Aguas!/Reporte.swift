import Foundation

enum EstadoReporte: String {
    case pendiente = "Pendiente"
    case verificado = "Verificado"
    case rechazado = "Rechazado"
}

struct Reporte {
    let titulo: String
    let tipoFraude: String
    let numero: String
    let fecha: String
    let estado: EstadoReporte
}
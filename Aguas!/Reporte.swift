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

extension Reporte {
    static let ejemplos: [Reporte] = [
        Reporte(titulo: "Paquete retenido en aduana",
                tipoFraude: "Phishing",
                numero: "+52 55 1234 5678",
                fecha: "18 ago 2026",
                estado: .verificado),
        Reporte(titulo: "Premio falso por WhatsApp",
                tipoFraude: "Extorsión",
                numero: "+52 81 2345 6789",
                fecha: "22 ago 2026",
                estado: .pendiente)
    ]
}
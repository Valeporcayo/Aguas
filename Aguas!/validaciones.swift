import Foundation

struct Validaciones {
  static func correoEsValido(_ correo:String) -> Bool {
    let patron = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    return NSPredicate(format: "SELF MATCHES %@", patron)
      .evaluate(with: correo)
  }
}

// contraseña pero con validacion de longitud
static func contrasennaEsValida(_ contrasenna: String) -> Bool {
  return contrasenna.count >= 8
}

// checar si han dejado un campo vacio
static func campoVacio(_ texto: String) -> Bool {
  return texto.trimmingCharacters(in: .whitespaces).isEmpty
}

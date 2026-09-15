//
//  LoginViewController.swift
//  Aguas!
//
//  Created by Valeria Porcayo on 14/09/26.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    let azulMarino = UIColor(red: 0.07, green: 0.15, blue: 0.29, alpha: 1)
    let grisFondo  = UIColor(red: 0.96, green: 0.97, blue: 0.98, alpha: 1)
    let grisTexto  = UIColor(red: 0.42, green: 0.45, blue: 0.50, alpha: 1)
    let rojoError  = UIColor(red: 0.75, green: 0.22, blue: 0.17, alpha: 1)
    
    let titulo = UILabel()
    let subtitulo = UILabel()
    let campoCorreo = UITextField()
    let campoContrasena = UITextField()
    let labelError = UILabel()
    let botonEntrar = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = grisFondo
        
        titulo.text = "Iniciar Sesión"
        titulo.font = .systemFont(ofSize: 26, weight: .bold)
        titulo.textColor = azulMarino
        
        subtitulo.text = "Entra para reportar y seguir tus reportes."
        subtitulo.font = .systemFont(ofSize: 13)
        subtitulo.textColor = grisTexto
        subtitulo.numberOfLines = 0
        
        configurarCampo(campoCorreo, placeholder: "tu@correo.com")
        configurarCampo(campoContrasena, placeholder: "Contraseña")
        campoContrasena.isSecureTextEntry = true
        
        labelError.font = .systemFont(ofSize: 12)
        labelError.textColor = rojoError
        labelError.numberOfLines = 0
        labelError.text = " "
        
        botonEntrar.setTitle("Entrar", for: .normal)
        botonEntrar.setTitleColor(.white, for: .normal)
        botonEntrar.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        botonEntrar.backgroundColor = azulMarino
        botonEntrar.layer.cornerRadius = 8
        botonEntrar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        botonEntrar.addTarget(self, action: #selector(entrarTocado), for: .touchUpInside)
        
        let stack = UIStackView(arrangedSubviews: [
            titulo, subtitulo, campoCorreo, campoContrasena, labelError, botonEntrar
        ])
        stack.axis = .vertical
        stack.spacing = 14
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
    
    private func configurarCampo(_ campo: UITextField, placeholder: String) {
        campo.placeholder = placeholder
        campo.backgroundColor = .white
        campo.borderStyle = .none
        campo.layer.borderWidth = 1
        campo.layer.borderColor = UIColor(white: 0.89, alpha: 1).cgColor
        campo.layer.cornerRadius = 8
        campo.heightAnchor.constraint(equalToConstant: 48).isActive = true
        campo.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 48))
        campo.leftViewMode = .always
    }
    
    @objc private func entrarTocado() {
        let correo = campoCorreo.text ?? ""
        let contrasena = campoContrasena.text ?? ""
        
        if correo.isEmpty || contrasena.isEmpty {
            mostrarError("Llena todos los campos para continuar.")
            return
        }
        
        if !Validaciones.correoEsValido(correo) {
            mostrarError("El correo no tiene un formato válido.")
            return
        }
        
        if !Validaciones.contrasennaEsValida(contrasena) {
            mostrarError("Correo o contraseña incorrectos.")
            return
        }
        
        labelError.text = " "
    }
    
    private func mostrarError(_ mensaje: String) {
        labelError.text = mensaje
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



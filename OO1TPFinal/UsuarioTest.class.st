Class {
	#name : #UsuarioTest,
	#superclass : #TestCase,
	#category : #'OO1TPFinal-tests'
}

{ #category : #tests }
UsuarioTest >> testValidadUsuario [
	|user|
	user := Usuario unNombre: 'unNombre' dni: 22222222 telefono: 21232 email: 'nombre@gmail.com' legajo: 123234 contraseña: 'unaContraseña'.
	self deny: (user validarUsuario: 'otroNombre' y: 'otraContraseña'). 
	self deny: (user validarUsuario: 'unNombre' y: 'otraContraseña').
	self deny: (user validarUsuario: 'otroNombre' y: 'unaContraseña').
	self assert: (user validarUsuario: 'unNombre' y: 'unaContraseña')
]

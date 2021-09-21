Class {
	#name : #UsuarioTest,
	#superclass : #TestCase,
	#category : #'OO1TPFinal-tests'
}

{ #category : #tests }
UsuarioTest >> testValidadUsuario [
	|user|
	user := Usuario unNombre: 'unNombre' dni: 22222222 telefono: 21232 email: 'unEmail@gmail.com' legajo: 123234 contraseña: 'unaContraseña'.
	self deny: (user validarUsuario: 'otroEmail@gmail.com' y: 'otraContraseña'). 
	self deny: (user validarUsuario: 'unEmail@gmail.com' y: 'otraContraseña').
	self deny: (user validarUsuario: 'otroEmail@gmail.com' y: 'unaContraseña').
	self assert: (user validarUsuario: 'unEmail@gmail.com' y: 'unaContraseña')
]

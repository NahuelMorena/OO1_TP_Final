Class {
	#name : #UsuarioTest,
	#superclass : #TestCase,
	#instVars : [
		'user'
	],
	#category : #'OO1TPFinal-tests'
}

{ #category : #running }
UsuarioTest >> setUp [
	user := Usuario unNombre: 'unNombre' dni: 22222222 telefono: 21232 email: 'unEmail@gmail.com' legajo: 123234 contraseña: 'unaContraseña'.
	

]

{ #category : #tests }
UsuarioTest >> testIdentificar [
	|id|
	id := user obtenerIdentificacion.
	self deny: (user identificar: -1).
	self assert: (user identificar: id).
	
]

{ #category : #tests }
UsuarioTest >> testValidadUsuario [
	self deny: (user validarUsuario: 'otroEmail@gmail.com' y: 'otraContraseña'). 
	self deny: (user validarUsuario: 'unEmail@gmail.com' y: 'otraContraseña').
	self deny: (user validarUsuario: 'otroEmail@gmail.com' y: 'unaContraseña').
	self assert: (user validarUsuario: 'unEmail@gmail.com' y: 'unaContraseña')
]

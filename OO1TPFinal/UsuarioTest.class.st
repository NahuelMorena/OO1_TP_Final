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
	user := Usuario unNombre: 'unNombre' 
						dni: 22222222 
						telefono: 221345465 
						email: 'unEmail@gmail.com' 
						legajo: 123234 
						contraseña: 'unaContraseña'.
	

]

{ #category : #tests }
UsuarioTest >> testContraseña [
	self assert: user contraseña equals: 'unaContraseña'.
	
]

{ #category : #tests }
UsuarioTest >> testDni [
	self assert: user dni equals: 22222222.
]

{ #category : #tests }
UsuarioTest >> testEmail [
	self assert: user email equals: 'unEmail@gmail.com'.
]

{ #category : #tests }
UsuarioTest >> testIdentificar [
	|id|
	id := user obtenerIdentificacion.
	self deny: (user identificar: -1).
	self assert: (user identificar: id).
	
]

{ #category : #tests }
UsuarioTest >> testLegajo [
	self assert: user legajo equals: 123234.
]

{ #category : #tests }
UsuarioTest >> testName [
	self assert: user name equals: 'unNombre'.
]

{ #category : #tests }
UsuarioTest >> testTelefono [
	self assert: user telefono equals: 221345465.
]

{ #category : #tests }
UsuarioTest >> testValidadUsuario [
	self deny: (user validarUsuario: 'otroEmail@gmail.com' y: 'otraContraseña'). 
	self deny: (user validarUsuario: 'unEmail@gmail.com' y: 'otraContraseña').
	self deny: (user validarUsuario: 'otroEmail@gmail.com' y: 'unaContraseña').
	self assert: (user validarUsuario: 'unEmail@gmail.com' y: 'unaContraseña')
]

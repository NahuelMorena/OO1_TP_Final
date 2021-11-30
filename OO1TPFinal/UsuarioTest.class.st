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
UsuarioTest >> testDni [
	self assert: user dni equals: 22222222.
	user dni: 55555555.
	self assert: user dni equals: 55555555.
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
	user legajo: 123333.
	self assert: user legajo equals: 123333.
]

{ #category : #tests }
UsuarioTest >> testNombre [
	self assert: user name equals: 'unNombre'.
	user nombre: 'otroNombre'.
	self assert: user name equals: 'otroNombre'.
]

{ #category : #tests }
UsuarioTest >> testTelefono [
	self assert: user telefono equals: 221345465.
	user telefono: 221444444.
	self assert: user telefono equals: 221444444.
]

{ #category : #tests }
UsuarioTest >> testValidadUsuario [
	self deny: (user validarUsuario: 'otroEmail@gmail.com' y: 'otraContraseña'). 
	self deny: (user validarUsuario: 'unEmail@gmail.com' y: 'otraContraseña').
	self deny: (user validarUsuario: 'otroEmail@gmail.com' y: 'unaContraseña').
	self assert: (user validarUsuario: 'unEmail@gmail.com' y: 'unaContraseña')
]

Class {
	#name : #GrupoTest,
	#superclass : #TestCase,
	#instVars : [
		'grupo',
		'organizacion1',
		'organizacion2',
		'user1',
		'user2'
	],
	#category : #'OO1TPFinal-tests'
}

{ #category : #'as yet unclassified' }
GrupoTest >> altaDonanteTest [
	user1 := grupo
		altaDonante: 'unNombre' 
		dni: 11111111 
		telefono: 2227111111 
		email: 'unEmail@gmail.com' 
		legajo: 222222.
	user2 := grupo
		altaDonante: 'otroNombre' 
		dni: 22222222 
		telefono: 2227222222 
		email: 'otroEmail@gmail.com' 
		legajo: 333333  
		
]

{ #category : #'as yet unclassified' }
GrupoTest >> altaOrganizacionTest [
	organizacion1 := grupo
		altaOrganizacion: 'organizacion1' 
		representante: user1 
		direccion: 'unaDireccion'.
	organizacion2 := grupo
		altaOrganizacion: 'organizacion2' 
		representante: user2 
		direccion: 'otraDireccion'  
		
]

{ #category : #running }
GrupoTest >> setUp [ 
	grupo := Grupo new. 
	self altaDonanteTest. 
	self altaOrganizacionTest.
]

{ #category : #tests }
GrupoTest >> testAceptarPropuestaDeOrganizacion [	
	self assert: (grupo propuestas includes: organizacion1).
	grupo aceptarPropuestaDeOrganizacion: organizacion1.
	self deny: (grupo propuestas includes: organizacion1 ).
	self assert: (grupo propuestas includes: organizacion2).
	self assert: (grupo organizaciones includes: organizacion1).
	self deny: (grupo organizaciones includes: organizacion2).
]

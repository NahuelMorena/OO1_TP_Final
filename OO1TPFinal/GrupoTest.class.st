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
	user1 := Usuario
		unNombre: 'unNombre' 
		dni: 11111111 
		telefono: 2227111111 
		email: 'unEmail@gmail.com' 
		legajo: 222222
		contraseña: 'unaContraseña'.
	user2 := Usuario 
		unNombre: 'otroNombre' 
		dni: 22222222 
		telefono: 2227222222 
		email: 'otroEmail@gmail.com' 
		legajo: 333333
		contraseña: 'otraContraseña'
		
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

{ #category : #tests }
GrupoTest >> testBuscarDonantePorNumerodeDonante [
	|numDonante|
	numDonante := grupo 
		altaDonante: 'nombre3' 
		dni: 33333333 
		telefono: 2345234565 
		email: 'user3@gmail.com' 
		legajo: 234564
		contraseña: 'unaContraseña'.
	self assert: (grupo buscarDonantePorNumerodeDonante: numDonante) isNotNil.
	self assert: (grupo buscarDonantePorNumerodeDonante: -1) isNil.
	
]

{ #category : #'as yet unclassified' }
GrupoTest >> testRecibirColaboracion [
	|montoObjetivo|
	montoObjetivo := 4000.
	grupo solicitarColaboracionPozoComun: montoObjetivo.
	self assert: (grupo pozoComun).
	self assert: (grupo objetivoPozo ) equals: 4000.
	self assert: (grupo recaudacion) equals:0.
	grupo recibirColaboracion: 2000.
	self assert: (grupo pozoComun).
	self assert: (grupo recaudacion) equals:2000.
	grupo recibirColaboracion: 3000.
	self deny: (grupo pozoComun).
	self assert: (grupo recaudacion) equals:5000.
	
	
	
]

{ #category : #tests }
GrupoTest >> testValidarAcceso [
	|numUsuario userPrueba|
	numUsuario := grupo 
		altaDonante: 'unNombre' 
		dni: 111 
		telefono: 112342 
		email: 'nahuel1@gmail.com' 
		legajo: 12312  
		contraseña: 'contrPrueba'.
	userPrueba := grupo buscarDonantePorNumerodeDonante: numUsuario.
	self assert: (grupo usuarios includes: userPrueba).
	self assert: (grupo usuario: 'nahuel1@gmail.com' protegidoPor: 'contrPrueba') equals: userPrueba.
]

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
GrupoTest >> testAltaDonante [
	self assert: (grupo usuarios) isEmpty.
	grupo altaDonante: 'unUsuario' dni: 22223312 telefono: 2345123454 email: 'unUsuario@gmail.com' legajo: 653451 contraseña: 'unaContraseña'.
	self assert: (grupo usuarios) isNotEmpty.
	
	
]

{ #category : #tests }
GrupoTest >> testAltaOrganizacion [
	self assert: (grupo propuestas size) equals: 2.
	grupo altaOrganizacion: 'Una organización' representante: user1 direccion: 'Una direccion de ejemplo'.
	self assert: (grupo propuestas size) equals: 3.
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

{ #category : #tests }
GrupoTest >> testPozoComunActivado [
	self deny: grupo pozoComunActivado.
	grupo solicitarColaboracionPozoComun: 3000.
	self assert: grupo pozoComunActivado.
	grupo cerrarPozoComun.
	self deny: grupo pozoComunActivado.
]

{ #category : #tests }
GrupoTest >> testRealizarDonacion [
 	|numDonante pagoEfectivo|
	numDonante := grupo 
		altaDonante: 'nombre3' 
		dni: 33333333 
		telefono: 2345234565 
		email: 'user3@gmail.com' 
		legajo: 234564
		contraseña: 'unaContraseña'.
	organizacion1 agregarIntegrante: (grupo buscarDonantePorNumerodeDonante: numDonante).
	pagoEfectivo := Efectivo montoAPagar: 400.0.
	grupo realizarDonacion: numDonante para: organizacion1 pago: pagoEfectivo paraEl: 12.
	self assert: (organizacion1 donaciones size) equals: 1. 
	self assert: (organizacion1 buscarDonacionesPorUsuario: (grupo buscarDonantePorNumerodeDonante: numDonante)) isNotEmpty. 
	pagoEfectivo := PagoFacil montoAPagar: 500.0.
	grupo realizarDonacion: numDonante para: organizacion1 pago: pagoEfectivo paraEl: 12.
	self assert: (organizacion1 donaciones size) equals: 2. 
	pagoEfectivo := TransfBancaria montoAPagar: 450.0.
	grupo realizarDonacion: numDonante para: organizacion1 pago: pagoEfectivo paraEl: 12.
	self assert: (organizacion1 donaciones size) equals: 3. 
	
]

{ #category : #tests }
GrupoTest >> testValidarAccesoCoordinador [
	|coordinadorPrueba|
	coordinadorPrueba := Usuario
		unNombre: 'unCoordinador' 
		dni: 36544323 
		telefono: 211435434 
		email: 'Coordinador@gmail.com' 
		legajo: 123124  
		contraseña: 'contrPrueba'.
	grupo cargaDeCoordinador: coordinadorPrueba.
	self assert: (grupo coordinadores includes: coordinadorPrueba).
	self assert: (grupo coordinador: 'Coordinador@gmail.com' protegidoPor: 'contrPrueba') equals: coordinadorPrueba.
]

{ #category : #tests }
GrupoTest >> testValidarAccesoUsuario [
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

{ #category : #tests }
GrupoTest >> testsolicitarColaboracionPozoComun [
	self assert: grupo pozoComun isNil.
	grupo solicitarColaboracionPozoComun: 3000.
	self deny: grupo pozoComun isNil.

]

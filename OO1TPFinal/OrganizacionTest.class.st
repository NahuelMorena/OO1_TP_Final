Class {
	#name : #OrganizacionTest,
	#superclass : #TestCase,
	#instVars : [
		'organizacion',
		'user1',
		'user2'
	],
	#category : #'OO1TPFinal-tests'
}

{ #category : #'as yet unclassified' }
OrganizacionTest >> altaDonacionesTest [
	|donacionEfectivo donacionPagoFacil donacionPagoFacil2 donacionTransfBancaria|
	donacionEfectivo := Efectivo 
		mesAPagar: 3
		organizacion: organizacion
		monto: 300.0 
		numDonante: 2004.
	donacionPagoFacil := PagoFacil 
		mesAPagar: 4 
		organizacion: organizacion
		monto: 450.0 
		numDonante: 2006.
	donacionTransfBancaria := TransfBancaria 
		mesAPagar: 5
		organizacion: organizacion
		monto: 500.0 
		numDonante: 2004.
	donacionPagoFacil2 := PagoFacil 
		mesAPagar: 3
		organizacion: organizacion
		monto: 450.0 
		numDonante: 2006.
	organizacion recibirDonacion: donacionEfectivo.
	organizacion recibirDonacion: donacionTransfBancaria.
	organizacion recibirDonacion: donacionPagoFacil.
	organizacion recibirDonacion: donacionPagoFacil2.
]

{ #category : #'as yet unclassified' }
OrganizacionTest >> altaDonanteTest [
	user1 := Usuario
		unNombre: 'unNombre' 
		dni: 11111111 
		telefono: 2227111111 
		email: 'unEmail@gmail.com' 
		legajo: 222222.
	user2 := Usuario 
		unNombre: 'otroNombre' 
		dni: 22222222 
		telefono: 2227222222 
		email: 'otroEmail@gmail.com' 
		legajo: 333333.
	organizacion agregarIntegrante: user1.
	organizacion agregarIntegrante: user2
]

{ #category : #running }
OrganizacionTest >> setUp [
	|representante|
	representante := Usuario unNombre: 'representante' dni: 99999999 
		telefono: 2227999999 email: 'representante@gmail.com' legajo: 999999. 
	organizacion := Organizacion denominacion: 'unaDenominacion' 
		representante: representante direccion: 'unaDireccion'.
	self altaDonanteTest.
	self altaDonacionesTest.

]

{ #category : #tests }
OrganizacionTest >> testBuscarDonacionesPorUsuario [
	|usuarioABuscar donacionDePrueba| 
	usuarioABuscar := Usuario
		unNombre: 'nombreEjemplo' 
		dni: 44444444 
		telefono: 4444444444 
		email: 'ejemplo@gmail.com' 
		legajo: 444444.
	organizacion agregarIntegrante: usuarioABuscar.
	self assert: (organizacion integrantes) size equals: 3.
	self assert: (organizacion buscarDonacionesPorUsuario: usuarioABuscar) isEmpty.
	self assert: (organizacion donaciones) size equals: 4.
	donacionDePrueba := Efectivo 
		mesAPagar: 3
		organizacion: organizacion
		monto: 300.0 
		numDonante: (usuarioABuscar obtenerIdentificacion).
	organizacion recibirDonacion: donacionDePrueba.
	self assert: (organizacion donaciones) size equals: 5.
	self assert: (organizacion buscarDonacionesPorUsuario: usuarioABuscar) isNotEmpty.
]

{ #category : #'as yet unclassified' }
OrganizacionTest >> testObtenerDonacionesDeEsteMes [
	|donacionPrueba|
	self assert: (organizacion obtenerDonacionesDeEsteMes) isEmpty.
	donacionPrueba := Efectivo 
		mesAPagar: Date today monthIndex
		organizacion: organizacion
		monto: 300.0 
		numDonante: 1004.
	organizacion recibirDonacion: donacionPrueba.
	self assert: (organizacion obtenerDonacionesDeEsteMes) isNotEmpty.
]

{ #category : #tests }
OrganizacionTest >> testObtenerDonacionesEntreFechas [
	
]

Class {
	#name : #OrganizacionTest,
	#superclass : #TestCase,
	#instVars : [
		'organizacion',
		'user1',
		'user2',
		'pagoEfectivo',
		'pagoTransfBancaria',
		'pagoDePagoFacil',
		'pagoDePagoFacil2'
	],
	#category : #'OO1TPFinal-tests'
}

{ #category : #'as yet unclassified' }
OrganizacionTest >> altaDonacionesTest [
	|donacionEfectivo donacionPagoFacil donacionPagoFacil2 donacionTransfBancaria|
	donacionEfectivo := Donacion
		mesAPagar: 3
		pago: pagoEfectivo 
		numDonante: 2004.
	donacionPagoFacil := Donacion 
		mesAPagar: 4 
		pago: pagoDePagoFacil 
		numDonante: 2006.
	donacionTransfBancaria := Donacion 
		mesAPagar: 5
		pago: pagoTransfBancaria 
		numDonante: 2004.
	donacionPagoFacil2 := Donacion 
		mesAPagar: 3
		pago: pagoDePagoFacil2  
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
		legajo: 222222
		contraseña: 'unaContraseña'.
	user2 := Usuario 
		unNombre: 'otroNombre' 
		dni: 22222222 
		telefono: 2227222222 
		email: 'otroEmail@gmail.com' 
		legajo: 333333
		contraseña: 'otraContraseña'.
	organizacion agregarIntegrante: user1.
	organizacion agregarIntegrante: user2
]

{ #category : #'as yet unclassified' }
OrganizacionTest >> altaPagosTest [
	pagoEfectivo := Efectivo montoAPagar: 300.0.
	pagoTransfBancaria := TransfBancaria montoAPagar: 450.0.
	pagoDePagoFacil := PagoFacil montoAPagar: 500.0.
	pagoDePagoFacil2 := PagoFacil montoAPagar: 450.0.
]

{ #category : #running }
OrganizacionTest >> setUp [
	|representante|
	representante := Usuario unNombre: 'representante' dni: 99999999 
		telefono: 2227999999 email: 'representante@gmail.com' legajo: 999999 contraseña: 'contraseñaRepre'. 
	organizacion := Organizacion denominacion: 'unaDenominacion' 
		representante: representante direccion: 'unaDireccion'.
	self altaPagosTest.
	self altaDonanteTest. 
	self altaDonacionesTest.

]

{ #category : #tests }
OrganizacionTest >> testBuscarDonacionesPorUsuario [
	|usuarioABuscar donacionDePrueba pagoEfectivoPrueba| 
	usuarioABuscar := Usuario
		unNombre: 'nombreEjemplo' 
		dni: 44444444 
		telefono: 4444444444 
		email: 'ejemplo@gmail.com' 
		legajo: 444444
		contraseña: 'contraseñaDeEjemplo'.
	organizacion agregarIntegrante: usuarioABuscar.
	self assert: (organizacion integrantes) size equals: 3.
	self assert: (organizacion buscarDonacionesPorUsuario: usuarioABuscar) isEmpty.
	self assert: (organizacion donaciones) size equals: 4.
	pagoEfectivoPrueba := Efectivo montoAPagar: 300.0.
	donacionDePrueba := Donacion
		mesAPagar: 3
		pago: pagoEfectivoPrueba 
		numDonante: (usuarioABuscar obtenerIdentificacion).
	organizacion recibirDonacion: donacionDePrueba.
	self assert: (organizacion donaciones) size equals: 5.
	self assert: (organizacion buscarDonacionesPorUsuario: usuarioABuscar) isNotEmpty.
]

{ #category : #tests }
OrganizacionTest >> testDireccion [
	self assert: (organizacion direccion ) equals: 'unaDireccion'.
	
	
	
]

{ #category : #'as yet unclassified' }
OrganizacionTest >> testObtenerDonacionesDeEsteMes [
	|donacionPrueba pagoEfectivoPrueba |
	self assert: (organizacion obtenerDonacionesDeEsteMes) isEmpty.
	pagoEfectivoPrueba := Efectivo montoAPagar: 300.0.
	donacionPrueba := Donacion 
		mesAPagar: Date today monthIndex
		pago: pagoEfectivoPrueba
		numDonante: 1004.
	organizacion recibirDonacion: donacionPrueba.
	self assert: (organizacion obtenerDonacionesDeEsteMes) isNotEmpty.
]

{ #category : #tests }
OrganizacionTest >> testObtenerDonacionesEntreFechas [
	|fecha1 fecha2|
	self assert: (organizacion donaciones) size equals: 4.
	fecha1 := Date newDay: 26 month: 8 year: 2020.
	fecha2 := Date newDay: 31 month: 1 year: 2021.
	self assert: (organizacion obtenerDonacionesEntre: fecha1 y: fecha2) equals: 0.0.
	fecha1 := Date newDay: 20 month: 8 year: 2021.
	fecha2 := Date newDay: 10 month: 10 year: 2022.
	self assert: (organizacion obtenerDonacionesEntre: fecha1 y: fecha2) equals: 1700.0.
]

{ #category : #tests }
OrganizacionTest >> testRecibirDonacion [
	|donacionPrueba pagoEfectivoPrueba |
	self assert: (organizacion donaciones) size equals: 4.
	pagoEfectivoPrueba := Efectivo montoAPagar: 300.0.
	donacionPrueba := Donacion  
		mesAPagar: Date today monthIndex
		pago: pagoEfectivoPrueba 
		numDonante: 1004.
	organizacion recibirDonacion: donacionPrueba.
	self assert: (organizacion donaciones) size equals: 5.
	
	
]

{ #category : #tests }
OrganizacionTest >> testRepresentante [
	self assert: (organizacion representante name ) equals: 'representante'.
	
	
	
]

{ #category : #tests }
OrganizacionTest >> testdenominacion [
	self assert: (organizacion denominacion ) equals: 'unaDenominacion'.
	
	
	
]

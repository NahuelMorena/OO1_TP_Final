Class {
	#name : #OrganizacionTest,
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
OrganizacionTest >> altaDonacionesTest: organizacion [ 
	|donacionEfectivo donacionPagoFacil donacionPagoFacil2 donacionTransfBancaria|
	donacionEfectivo := Efectivo 
		mesAPagar: Date today monthIndex
		organizacion: organizacion
		monto: 300.0 
		donante: 1004.
	donacionPagoFacil := PagoFacil 
		mesAPagar: 4 
		organizacion: organizacion
		monto: 450.0 
		donante: 1006.
	donacionTransfBancaria := TransfBancaria 
		mesAPagar: 5
		organizacion: organizacion
		monto: 500.0 
		donante: 1004.
	donacionPagoFacil2 := PagoFacil 
		mesAPagar: Date today monthIndex
		organizacion: organizacion
		monto: 450.0 
		donante: 1006.
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
		legajo: 333333
]

{ #category : #running }
OrganizacionTest >> setUp [
	|organizacion representante|
	representante := Usuario unNombre: 'representante' dni: 99999999 
		telefono: 2227999999 email: 'representante@gmail.com' legajo: 999999. 
	organizacion := Organizacion denominacion: 'unaDenominacion' 
		representante: representante direccion: 'unaDireccion'.
	self altaDonanteTest.
	self altaDonacionesTest: organizacion.

]

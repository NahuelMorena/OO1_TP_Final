Class {
	#name : #Sistema,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'grupos'
	],
	#category : #'OO1TPFinal-model'
}

{ #category : #'as yet unclassified' }
Sistema >> altaDonante: unNombre dni: unDni telefono: unTelefono email: unEmail legajo: unLegajo [
	|usuario|
	usuario:= Usuario unNombre: unNombre dni: unDni telefono: unTelefono email: unEmail legajo: unLegajo.
	self cargaDeDonante: usuario.
	^usuario obtenerIdentificacion.
]

{ #category : #'as yet unclassified' }
Sistema >> altaOrganizacion: unaDenominacion representante: unRepresentante direccion: unaDireccion enGrupo: unGrupo [
	^((self grupos select: [ :each | each == unGrupo ]) altaOrganizacion: unaDenominacion representante: unRepresentante direccion: unaDireccion).  
]

{ #category : #'as yet unclassified' }
Sistema >> buscarDonacionesPorUsuario: unUsuario [
	^self grupos select: [ :each | each organizaciones buscarDonacionesPorUsuario: unUsuario]
]

{ #category : #'as yet unclassified' }
Sistema >> buscarDonantePorNumerodeDonante: nroDonante [
	^self usuarios select: [ :each | each identificar: nroDonante ]
]

{ #category : #'as yet unclassified' }
Sistema >> cargaDeDonante: unDonante [
	self usuarios add: unDonante
]

{ #category : #accessing }
Sistema >> grupos [
	^grupos
]

{ #category : #initialization }
Sistema >> initialize [
	usuarios := OrderedCollection new.
	grupos := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Sistema >> realizarDonacionEfectivo: nroDonante para: unaOrganizacion cantidad: unMonto paraEl: unMes [
	unaOrganizacion recibirDonacion: (Efectivo mesAPagar: unMes organizacion: unaOrganizacion donante: ( self buscarDonantePorNumerodeDonante: nroDonante)).
]

{ #category : #'as yet unclassified' }
Sistema >> realizarDonacionPagoFacil: nroDonante para: unaOrganizacion cantidad: unMonto paraEl: unMes [
	unaOrganizacion recibirDonacion: (PagoFacil  mesAPagar: unMes organizacion: unaOrganizacion donante: ( self buscarDonantePorNumerodeDonante: nroDonante)).
]

{ #category : #'as yet unclassified' }
Sistema >> realizarDonacionTransferenciaBancaria: nroDonante para: unaOrganizacion cantidad: unMonto paraEl: unMes [
	unaOrganizacion recibirDonacion: (TransfBancaria mesAPagar: unMes organizacion: unaOrganizacion donante: ( self buscarDonantePorNumerodeDonante: nroDonante)).
]

{ #category : #accessing }
Sistema >> usuarios [
	^usuarios
]

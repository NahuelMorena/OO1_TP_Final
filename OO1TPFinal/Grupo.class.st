Class {
	#name : #Grupo,
	#superclass : #Object,
	#instVars : [
		'organizaciones',
		'propuestas',
		'coordinadores',
		'pozoComun',
		'usuarios'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'OO1TPFinal-model'
}

{ #category : #'as yet unclassified' }
Grupo class >> clearSoleInstance [
	soleInstance := nil
]

{ #category : #'as yet unclassified' }
Grupo class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new ]
]

{ #category : #'as yet unclassified' }
Grupo >> aceptarPropuestaDeOrganizacion: unaOrganizacion [
	self propuestas remove: unaOrganizacion.
	self organizaciones add: unaOrganizacion.
	
]

{ #category : #accessing }
Grupo >> altaDonante: unNombre dni: unDni telefono: unTelefono email: unEmail legajo: unLegajo contraseña: unaContraseña [
	|usuario|
	usuario := (Usuario unNombre: unNombre dni: unDni telefono: unTelefono email: unEmail legajo: unLegajo contraseña: unaContraseña).
	self cargaDeDonante: usuario.
	^usuario obtenerIdentificacion.
]

{ #category : #'as yet unclassified' }
Grupo >> altaOrganizacion: unaDenominacion representante: unRepresentante direccion: unaDireccion [ 
	^self propuestas add: (Organizacion denominacion: unaDenominacion representante: unRepresentante direccion: unaDireccion)
	
]

{ #category : #initialization }
Grupo >> buscarDonantePorNumerodeDonante: nroDonante [
	^self usuarios detect: [ :each | each identificar: nroDonante ]
		ifNone: [ nil ]
]

{ #category : #initialization }
Grupo >> cargaDeCoordinador: unCoordinador [
	self coordinadores add: unCoordinador 
]

{ #category : #initialization }
Grupo >> cargaDeDonante: unDonante [
	self usuarios add: unDonante
]

{ #category : #accessing }
Grupo >> cerrarPozoComun [
	pozoComun := nil.
]

{ #category : #'as yet unclassified' }
Grupo >> coordinador: unEmail protegidoPor: unaContraseña [
  ^ (self coordinadores) 
		detect: [ :each | each validarUsuario: unEmail y: unaContraseña]
    		 ifNone: [ nil ]
]

{ #category : #initialization }
Grupo >> coordinadores [
	^coordinadores 
]

{ #category : #initialization }
Grupo >> initialize [
	propuestas := Set new.
	organizaciones := Set new.
	coordinadores := Set new. 
	usuarios := Set new.
]

{ #category : #initialization }
Grupo >> organizaciones [
	^organizaciones 
]

{ #category : #accessing }
Grupo >> pozoComun [ 
	^pozoComun
]

{ #category : #accessing }
Grupo >> pozoComunActivado [
	(pozoComun) 
		ifNotNil: [ ^true ].
		^false.
]

{ #category : #initialization }
Grupo >> propuestas [
	^propuestas
]

{ #category : #initialization }
Grupo >> realizarDonacion: nroDonante para: unaOrganizacion pago: unPago paraEl: unMes [
	unaOrganizacion recibirDonacion: (Donacion mesAPagar: unMes pago: unPago numDonante: nroDonante).
]

{ #category : #initialization }
Grupo >> solicitarColaboracionPozoComun: unMontoObjetivo [
	pozoComun:= (PozoComun objetivoPozo: unMontoObjetivo).
]

{ #category : #'as yet unclassified' }
Grupo >> usuario: unEmail protegidoPor: unaContraseña [
  ^ usuarios 
		detect: [ :each | each validarUsuario: unEmail y: unaContraseña]
    		 ifNone: [ nil ]
]

{ #category : #accessing }
Grupo >> usuarios [
	^usuarios
]

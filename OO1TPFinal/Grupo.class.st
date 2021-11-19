Class {
	#name : #Grupo,
	#superclass : #Object,
	#instVars : [
		'organizaciones',
		'propuestas',
		'coordinadores',
		'pozoComun',
		'recaudacion',
		'objetivoPozo',
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

{ #category : #'as yet unclassified' }
Grupo >> cargarMonto: unMonto [
	^(recaudacion := recaudacion + unMonto).
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
	propuestas := OrderedCollection new.
	organizaciones := OrderedCollection new.
	coordinadores := OrderedCollection new. 
	usuarios := OrderedCollection new.
	pozoComun := false.
	recaudacion := 0
]

{ #category : #accessing }
Grupo >> objetivoPozo [
	^objetivoPozo.
]

{ #category : #initialization }
Grupo >> organizaciones [
	^organizaciones 
]

{ #category : #accessing }
Grupo >> pozoComun [
	^pozoComun.
]

{ #category : #initialization }
Grupo >> propuestas [
	^propuestas
]

{ #category : #initialization }
Grupo >> realizarDonacionEfectivo: nroDonante para: unaOrganizacion cantidad: unMonto paraEl: unMes [
	unaOrganizacion recibirDonacion: (Efectivo mesAPagar: unMes monto: unMonto numDonante: nroDonante).
]

{ #category : #initialization }
Grupo >> realizarDonacionPagoFacil: nroDonante para: unaOrganizacion cantidad: unMonto paraEl: unMes [
	unaOrganizacion recibirDonacion: (PagoFacil  mesAPagar: unMes monto: unMonto numDonante: nroDonante).
]

{ #category : #initialization }
Grupo >> realizarDonacionTransferenciaBancaria: nroDonante para: unaOrganizacion cantidad: unMonto paraEl: unMes [
	unaOrganizacion recibirDonacion: (TransfBancaria mesAPagar: unMes monto:unMonto numDonante: nroDonante).
]

{ #category : #accessing }
Grupo >> recaudacion [
	^recaudacion.
]

{ #category : #'as yet unclassified' }
Grupo >> recibirColaboracion: unMonto [
	((self cargarMonto: unMonto) >= self objetivoPozo asNumber) ifTrue: [ pozoComun := false ]
]

{ #category : #accessing }
Grupo >> resetearPozoComun [
	objetivoPozo := 0.
	recaudacion := 0
	
]

{ #category : #initialization }
Grupo >> solicitarColaboracionPozoComun: montoObjetivo [
	pozoComun:= true.
	objetivoPozo := montoObjetivo.
	recaudacion := 0
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

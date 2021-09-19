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
Grupo class >> soleIntance [
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
Grupo >> buscarDonacionesPorUsuario: unUsuario [ 
	^self organizaciones select: [ :each | each buscarDonacionesPorUsuario: unUsuario ]
]

{ #category : #initialization }
Grupo >> buscarDonantePorNumerodeDonante: nroDonante [
	^self usuarios select: [ :each | each identificar: nroDonante ]
]

{ #category : #initialization }
Grupo >> cargaDeDonante: unDonante [
	self usuarios add: unDonante
]

{ #category : #'as yet unclassified' }
Grupo >> cargarMonto: unMonto [
	^(recaudacion:= recaudacion + unMonto).
]

{ #category : #initialization }
Grupo >> initialize [
	propuestas := OrderedCollection new.
	organizaciones := OrderedCollection new.
	coordinadores := OrderedCollection new. 
	usuarios := OrderedCollection new.
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
	unaOrganizacion recibirDonacion: (Efectivo mesAPagar: unMes monto: unMonto numDonante: ( self buscarDonantePorNumerodeDonante: nroDonante)).
]

{ #category : #initialization }
Grupo >> realizarDonacionPagoFacil: nroDonante para: unaOrganizacion cantidad: unMonto paraEl: unMes [
	unaOrganizacion recibirDonacion: (PagoFacil  mesAPagar: unMes monto: unMonto numDonante: ( self buscarDonantePorNumerodeDonante: nroDonante)).
]

{ #category : #initialization }
Grupo >> realizarDonacionTransferenciaBancaria: nroDonante para: unaOrganizacion cantidad: unMonto paraEl: unMes [
	unaOrganizacion recibirDonacion: (TransfBancaria mesAPagar: unMes monto:unMonto numDonante: ( self buscarDonantePorNumerodeDonante: nroDonante)).
]

{ #category : #accessing }
Grupo >> recaudacion [
	^recaudacion.
]

{ #category : #'as yet unclassified' }
Grupo >> recibirColaboracion: unMonto [
	((self cargarMonto: unMonto) >= self objetivoPozo) ifTrue: [ pozoComun := false ]
]

{ #category : #initialization }
Grupo >> solicitarColaboracionPozoComun: montoObjetivo [
	pozoComun:= true.
	objetivoPozo := montoObjetivo.
	recaudacion := 0
]

{ #category : #'as yet unclassified' }
Grupo >> usuario: unNombre protegidoPor: unaContraseña [
  ^ (self usuarios) detect: [ :each | each validadUsuario: unNombre y: unaContraseña]
      ifNone: [ nil ]
]

{ #category : #accessing }
Grupo >> usuarios [
	^usuarios
]

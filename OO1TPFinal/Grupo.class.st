Class {
	#name : #Grupo,
	#superclass : #Object,
	#instVars : [
		'organizaciones',
		'propuestas',
		'coordinadores',
		'integrantes',
		'pozoComun',
		'recaudacion',
		'objetivoPozo'
	],
	#category : #'OO1TPFinal-model'
}

{ #category : #'as yet unclassified' }
Grupo >> aceptarPropuestaDeOrganizacion: unaOrganizacion [
	self propuestas remove: unaOrganizacion.
	self organizaciones add: unaOrganizacion.
	
]

{ #category : #'as yet unclassified' }
Grupo >> altaOrganizacion: unaDenominacion representante: unRepresentante direccion: unaDireccion [ 
	self propuestas add: (Organizacion denominacion: unaDenominacion representante: unRepresentante direccion: unaDireccion)
	
]

{ #category : #initialization }
Grupo >> buscarDonacionesPorUsuario: unUsuario [ 
	^self organizaciones select: [ :each | each buscarDonacionesPorUsuario: unUsuario ]
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
	integrantes := OrderedCollection new.
]

{ #category : #accessing }
Grupo >> objetivoPozo [
	^objetivoPozo.
]

{ #category : #initialization }
Grupo >> organizaciones [
	^organizaciones 
]

{ #category : #initialization }
Grupo >> propuestas [
	^propuestas
]

{ #category : #'as yet unclassified' }
Grupo >> recibirColaboracion: unMonto [
	((self cargarMonto: unMonto) >= self objetivoPozo) ifTrue: [ pozoComun := false ]
]

{ #category : #initialization }
Grupo >> solicitarColaboracionPozoComun: montoObjetivo [
	pozoComun:= true.
	objetivoPozo := montoObjetivo
]

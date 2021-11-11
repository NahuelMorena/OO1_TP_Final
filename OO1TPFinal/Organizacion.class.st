Class {
	#name : #Organizacion,
	#superclass : #Object,
	#instVars : [
		'denominacion',
		'representante',
		'direccion',
		'integrantes',
		'donaciones'
	],
	#category : #'OO1TPFinal-model'
}

{ #category : #'as yet unclassified' }
Organizacion class >> denominacion: unaDenominacion representante: unRepresentante direccion: unaDireccion [
	^ self new 	
		denominacion: unaDenominacion
		representante: unRepresentante
		direccion: unaDireccion.
]

{ #category : #'as yet unclassified' }
Organizacion >> agregarIntegrante: unIntegrante [ 
	self integrantes add: unIntegrante
]

{ #category : #accessing }
Organizacion >> buscarDonacionesPorUsuario: unUsuario [
	^self donaciones select: 
				[ :each | (each donador == unUsuario obtenerIdentificacion) & (each actualYear)]
	
	 
				
]

{ #category : #accessing }
Organizacion >> denominacion [ 
	^denominacion
]

{ #category : #'as yet unclassified' }
Organizacion >> denominacion: unaDenominacion representante: unRepresentante direccion: unaDireccion [.
	denominacion := unaDenominacion.
 	representante := unRepresentante.
	direccion := unaDireccion.
]

{ #category : #accessing }
Organizacion >> direccion [ 
	^direccion
]

{ #category : #accessing }
Organizacion >> donaciones [
	^donaciones
]

{ #category : #initialization }
Organizacion >> initialize [ 
	integrantes := OrderedCollection new.
	donaciones := OrderedCollection new.
]

{ #category : #accessing }
Organizacion >> integrantes [
	^integrantes 
]

{ #category : #'as yet unclassified' }
Organizacion >> obtenerDonacionesDeEsteMes [
	^self donaciones select: [ :each | (each fecha <= Date today) & (Date today monthIndex == each mesDelPago asNumber)]	
]

{ #category : #'as yet unclassified' }
Organizacion >> obtenerDonacionesEntre: unafecha y: otraFecha [
	^donaciones sum: [ :each | each montoDeDonacionesEntre: unafecha y: otraFecha]
]

{ #category : #accessing }
Organizacion >> recibirDonacion: unaDonacion [ 
	self donaciones add: unaDonacion.
]

{ #category : #accessing }
Organizacion >> representante [
	^representante
]

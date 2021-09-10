Class {
	#name : #Organizacion,
	#superclass : #Object,
	#instVars : [
		'denominacion',
		'representante',
		'direccion',
		'integrantes',
		'coordinadores',
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

{ #category : #'as yet unclassified' }
Organizacion >> denominacion: unaDenominacion representante: unRepresentante direccion: unaDireccion [.
	denominacion := unaDenominacion.
 	representante := unRepresentante.
	direccion := unaDireccion.
]

{ #category : #accessing }
Organizacion >> donaciones [
	^donaciones
]

{ #category : #initialization }
Organizacion >> initialize [ 
	integrantes := OrderedCollection new.
	donaciones := OrderedCollection new.
	coordinadores := OrderedCollection new.
]

{ #category : #accessing }
Organizacion >> integrantes [
	^integrantes 
]

{ #category : #accessing }
Organizacion >> recibirDonacion: unaDonacion [ 
	self donaciones add: unaDonacion.
]

Class {
	#name : #Grupo,
	#superclass : #Object,
	#instVars : [
		'organizaciones',
		'propuestas',
		'coordinadores',
		'integrantes'
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
	^self propuestas add: (Organizacion denominacion: unaDenominacion representante: unRepresentante direccion: unaDireccion)
	
]

{ #category : #initialization }
Grupo >> initialize [
	propuestas := OrderedCollection new.
	organizaciones := OrderedCollection new.
	coordinadores := OrderedCollection new. 
	integrantes := OrderedCollection new.
]

{ #category : #initialization }
Grupo >> organizaciones [
	^organizaciones 
]

{ #category : #initialization }
Grupo >> propuestas [
	^propuestas
]

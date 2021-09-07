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

{ #category : #initialization }
Organizacion >> initialize [ 
	integrantes := OrderedCollection new.
	donaciones := OrderedCollection new.
	coordinadores := OrderedCollection new.
]

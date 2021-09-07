Class {
	#name : #Sistema,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'organizaciones',
		'donaciones'
	],
	#category : #'OO1TPFinal-model'
}

{ #category : #'as yet unclassified' }
Sistema >> altaDonante: unNombre dni: unDni telefono: unTelefono email: unEmail legajo: unLegajo [
	^self usuarios add: (Usuario unNombre: unNombre dni: unDni telefono: unTelefono email: unEmail legajo: unLegajo)
]

{ #category : #initialization }
Sistema >> initialize [
	usuarios := OrderedCollection new.
	organizaciones := OrderedCollection new.
]

{ #category : #accessing }
Sistema >> usuarios [
	^usuarios
]

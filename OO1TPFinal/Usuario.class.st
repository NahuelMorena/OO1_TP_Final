Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'dni',
		'telefono',
		'legajo',
		'email',
		'id'
	],
	#category : #'OO1TPFinal-model'
}

{ #category : #'as yet unclassified' }
Usuario class >> unNombre: unNombre dni: unDni telefono: unTelefono email: unEmail legajo: unLegajo [
	^ self new 
		nombre: unNombre
		dni: unDni
		telefono: unTelefono
		email: unEmail
		legajo: unLegajo
]

{ #category : #'as yet unclassified' }
Usuario >> identificar: numIdent [
	(self numIdentidad == numIdent ) ifTrue: [^true.].
	^false.
]

{ #category : #accessing }
Usuario >> nombre [
	^nombre
]

{ #category : #accessing }
Usuario >> nombre: unNombre [
	nombre := unNombre

]

{ #category : #'as yet unclassified' }
Usuario >> nombre: unNombre dni: unDni telefono: unTelefono email: unEmail legajo: unLegajo [
	nombre := unNombre.
	dni := unDni.
	telefono := unTelefono.
	email := unEmail.
	legajo := unLegajo
]

{ #category : #'as yet unclassified' }
Usuario >> numIdentidad [
	^id
]

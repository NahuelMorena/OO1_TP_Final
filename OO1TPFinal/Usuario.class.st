Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'dni',
		'telefono',
		'legajo',
		'email',
		'id',
		'grupo'
	],
	#classInstVars : [
		'ids'
	],
	#category : #'OO1TPFinal-model'
}

{ #category : #'as yet unclassified' }
Usuario class >> darIdentificador [
	^ids := ids + 1 
]

{ #category : #'class initialization' }
Usuario class >> initialize [ 
	ids := 1000
]

{ #category : #'as yet unclassified' }
Usuario class >> unNombre: unNombre dni: unDni telefono: unTelefono email: unEmail legajo: unLegajo [ 
	^ self new 
		nombre: unNombre
		dni: unDni
		telefono: unTelefono
		email: unEmail
		legajo: unLegajo
		identificador: self darIdentificador.
]

{ #category : #'as yet unclassified' }
Usuario >> identificar: numIdent [
	(self obtenerIdentificacion == numIdent ) ifTrue: [^true.].
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
Usuario >> nombre: unNombre dni: unDni telefono: unTelefono email: unEmail legajo: unLegajo identificador: unIdentificador [
	nombre := unNombre.
	dni := unDni.
	telefono := unTelefono.
	email := unEmail.
	legajo := unLegajo.
	id := unIdentificador.
]

{ #category : #'as yet unclassified' }
Usuario >> obtenerIdentificacion [
	^id
]

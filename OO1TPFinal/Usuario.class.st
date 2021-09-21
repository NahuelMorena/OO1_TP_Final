Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'dni',
		'telefono',
		'legajo',
		'email',
		'contraseña',
		'id'
	],
	#classInstVars : [
		'ids'
	],
	#category : #'OO1TPFinal-model'
}

{ #category : #'as yet unclassified' }
Usuario class >> darIdentificador [
	^(ids := ids + 1) 
]

{ #category : #'class initialization' }
Usuario class >> initialize [ 
	ids := 1000
]

{ #category : #'as yet unclassified' }
Usuario class >> unNombre: unNombre dni: unDni telefono: unTelefono email: unEmail legajo: unLegajo contraseña: unaContraseña [
	^ self new 
		nombre: unNombre
		dni: unDni
		telefono: unTelefono
		email: unEmail
		legajo: unLegajo
		contraseña: unaContraseña		
		identificador: self darIdentificador.
]

{ #category : #accessing }
Usuario >> contraseña [
	^contraseña
]

{ #category : #accessing }
Usuario >> email [
	^email

]

{ #category : #'as yet unclassified' }
Usuario >> identificar: numIdent [
	^(self obtenerIdentificacion == numIdent )
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
Usuario >> nombre: unNombre dni: unDni telefono: unTelefono email: unEmail legajo: unLegajo contraseña: unaContraseña identificador: unIdentificador [
	nombre := unNombre.
	dni := unDni.
	telefono := unTelefono.
	email := unEmail.
	legajo := unLegajo.
	contraseña := unaContraseña.
	id := unIdentificador.
]

{ #category : #'as yet unclassified' }
Usuario >> obtenerIdentificacion [
	^ id
]

{ #category : #'as yet unclassified' }
Usuario >> validarUsuario: unEmail y: unaContraseña [
	^((self email = unEmail) & (self contraseña = unaContraseña))
]

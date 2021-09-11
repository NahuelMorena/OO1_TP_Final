Class {
	#name : #Donacion,
	#superclass : #Object,
	#instVars : [
		'mes',
		'monto',
		'comision',
		'organizacion',
		'donador',
		'fechaYHora'
	],
	#category : #'OO1TPFinal-model'
}

{ #category : #accessing }
Donacion >> donador [
	^donador
]

{ #category : #initialization }
Donacion >> initialize [
	fechaYHora := DateAndTime now.
]

{ #category : #'as yet unclassified' }
Donacion >> mes: unMes organizacion: unaOrganizacion donante: unDonante [
	mes:= unMes.
	organizacion:= unaOrganizacion.
	donador:= unDonante.
]

{ #category : #accessing }
Donacion >> monto: unMonto [
	monto:= unMonto.
]

{ #category : #'as yet unclassified' }
Donacion >> pagoConComision: unMonto [
	^self subclassResponsibility
]

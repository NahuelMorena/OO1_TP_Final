Class {
	#name : #Donacion,
	#superclass : #Object,
	#instVars : [
		'mesDelPago',
		'monto',
		'comision',
		'donador',
		'fecha'
	],
	#category : #'OO1TPFinal-model'
}

{ #category : #accessing }
Donacion >> actualYear [
	^(Date today year == self fecha year)
	
]

{ #category : #accessing }
Donacion >> comision: unaComision [
	comision := unaComision.
]

{ #category : #accessing }
Donacion >> fecha [
	^fecha
]

{ #category : #accessing }
Donacion >> idDonador [
	^donador
]

{ #category : #initialization }
Donacion >> initialize [
	fecha := Date today.
]

{ #category : #'as yet unclassified' }
Donacion >> mesAPagar: unMes monto: unMonto numDonante: unNumDonante [ 
	mesDelPago:= unMes.
	donador:= unNumDonante.
	monto:= unMonto.
	self pagoConComision: unMonto.
]

{ #category : #accessing }
Donacion >> mesDelPago [
	^mesDelPago.
]

{ #category : #accessing }
Donacion >> monto [
	^monto
]

{ #category : #accessing }
Donacion >> montoDeDonacionesEntre: unafecha y: otraFecha [
	(self fecha between: unafecha and: otraFecha) ifTrue: [ ^self monto ].
	^0
]

{ #category : #'as yet unclassified' }
Donacion >> pagoConComision: unMonto [
	^self subclassResponsibility
]

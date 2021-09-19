Class {
	#name : #Donacion,
	#superclass : #Object,
	#instVars : [
		'mesDelPago',
		'monto',
		'donador',
		'fecha'
	],
	#category : #'OO1TPFinal-model'
}

{ #category : #'as yet unclassified' }
Donacion class >> mesAPagar: unMes monto: unMonto numDonante: unNumDonante [
	^self new
		mesAPagar: unMes 
		monto: unMonto 
		numDonante: unNumDonante.
]

{ #category : #accessing }
Donacion >> actualYear [
	^(Date today year == self fecha year)
	
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
Donacion >> monto: unMonto [
	monto:= unMonto
]

{ #category : #accessing }
Donacion >> montoDeDonacionesEntre: unafecha y: otraFecha [
	(self fecha between: unafecha and: otraFecha) ifTrue: [ ^self obtenerPagoSinComision ].
	^0
]

{ #category : #'as yet unclassified' }
Donacion >> obtenerPagoSinComision [
	^self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Donacion >> pagoConComision: unMonto [
	^self subclassResponsibility
]

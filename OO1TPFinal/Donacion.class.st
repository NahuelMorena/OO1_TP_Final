Class {
	#name : #Donacion,
	#superclass : #Object,
	#instVars : [
		'mesDelPago',
		'pago',
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

{ #category : #'as yet unclassified' }
Donacion class >> mesAPagar: unMes pago: unPago numDonante: unNumDonante [
	^self new
		mesAPagar: unMes 
		pago: unPago
		numDonante: unNumDonante.
]

{ #category : #accessing }
Donacion >> actualYear [
	^(Date today year == self fecha year)
	
]

{ #category : #accessing }
Donacion >> donador [
	^donador
]

{ #category : #accessing }
Donacion >> fecha [
	^fecha
]

{ #category : #initialization }
Donacion >> initialize [
	fecha := Date today.
]

{ #category : #'as yet unclassified' }
Donacion >> mesAPagar: unMes pago: unPago numDonante: unNumDonante [ 
	mesDelPago:= unMes.
	donador:= unNumDonante.
	pago:= unPago. 
]

{ #category : #accessing }
Donacion >> mesDelPago [
	^mesDelPago.
]

{ #category : #accessing }
Donacion >> montoDeDonacionesEntre: unafecha y: otraFecha [
	(self fecha between: unafecha and: otraFecha) ifTrue: [ ^(self pago obtenerPagoSinComision) ].
	^0
]

{ #category : #accessing }
Donacion >> pago [
	^pago
]

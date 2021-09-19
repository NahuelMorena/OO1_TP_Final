Class {
	#name : #TransfBancaria,
	#superclass : #Donacion,
	#category : #'OO1TPFinal-model'
}

{ #category : #'as yet unclassified' }
TransfBancaria >> obtenerPagoSinComision [
	^(self monto / 1.1) round: 0
]

{ #category : #'as yet unclassified' }
TransfBancaria >> pagoConComision: unMonto [
	self monto: (unMonto * 1.1).
]

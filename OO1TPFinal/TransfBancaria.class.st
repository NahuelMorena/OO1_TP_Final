Class {
	#name : #TransfBancaria,
	#superclass : #Donacion,
	#category : #'OO1TPFinal-model'
}

{ #category : #'as yet unclassified' }
TransfBancaria >> pagoConComision: unMonto [
	self comision: (unMonto * 1.1) - unMonto.
]

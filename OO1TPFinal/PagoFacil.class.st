Class {
	#name : #PagoFacil,
	#superclass : #Donacion,
	#category : #'OO1TPFinal-model'
}

{ #category : #'as yet unclassified' }
PagoFacil >> pagoConComision: unMonto [
	self comision: (unMonto * 1.15) - unMonto.
]

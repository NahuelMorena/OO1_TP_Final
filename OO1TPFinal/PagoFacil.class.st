Class {
	#name : #PagoFacil,
	#superclass : #Donacion,
	#category : #'OO1TPFinal-model'
}

{ #category : #'as yet unclassified' }
PagoFacil >> obtenerPagoSinComision [
	^(self monto / 1.15) round: 0
]

{ #category : #'as yet unclassified' }
PagoFacil >> pagoConComision: unMonto [
	self monto: (unMonto * 1.15).
]

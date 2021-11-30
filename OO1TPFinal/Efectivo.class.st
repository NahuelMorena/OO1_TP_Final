Class {
	#name : #Efectivo,
	#superclass : #TipoDePago,
	#category : #'OO1TPFinal-model'
}

{ #category : #'as yet unclassified' }
Efectivo >> obtenerPagoSinComision [
	^ self monto
]

{ #category : #'as yet unclassified' }
Efectivo >> pagoConComision: unMonto [
	self monto: unMonto
]

Class {
	#name : #TipoDePago,
	#superclass : #Object,
	#instVars : [
		'monto'
	],
	#category : #'OO1TPFinal-model'
}

{ #category : #'as yet unclassified' }
TipoDePago class >> montoAPagar: unMonto [
	^ self new cargarMonto: unMonto
]

{ #category : #accessing }
TipoDePago >> cargarMonto: unMonto [
	self pagoConComision: unMonto
]

{ #category : #accessing }
TipoDePago >> monto [ 
	^ monto
]

{ #category : #accessing }
TipoDePago >> monto: unMonto [
	monto := unMonto
]

{ #category : #'as yet unclassified' }
TipoDePago >> obtenerPagoSinComision [
	^self subclassResponsibility
]

{ #category : #'as yet unclassified' }
TipoDePago >> pagoConComision: unMonto [
	^self subclassResponsibility
]

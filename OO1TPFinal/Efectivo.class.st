Class {
	#name : #Efectivo,
	#superclass : #Donacion,
	#category : #'OO1TPFinal-model'
}

{ #category : #'as yet unclassified' }
Efectivo class >> mesAPagar: unMes monto: unMonto numDonante: unNumDonante [
	^self new
		mesAPagar: unMes 
		monto: unMonto 
		numDonante: unNumDonante.
]

{ #category : #'as yet unclassified' }
Efectivo >> pagoConComision: unMonto [
	self comision: 0.
]

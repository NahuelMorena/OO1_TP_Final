Class {
	#name : #PagoFacil,
	#superclass : #Donacion,
	#category : #'OO1TPFinal-model'
}

{ #category : #'as yet unclassified' }
PagoFacil class >> mesAPagar: unMes monto: unMonto numDonante: unNumDonante [
	^self new
		mesAPagar: unMes  
		monto: unMonto 
		numDonante: unNumDonante.
]

{ #category : #'as yet unclassified' }
PagoFacil >> pagoConComision: unMonto [
	self comision: (unMonto * 1.15) - unMonto.
]

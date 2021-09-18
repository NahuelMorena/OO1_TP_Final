Class {
	#name : #Efectivo,
	#superclass : #Donacion,
	#category : #'OO1TPFinal-model'
}

{ #category : #'as yet unclassified' }
Efectivo class >> mesAPagar: unMes organizacion: unaOrganizacion monto: unMonto numDonante: unNumDonante [
	^self new
		mesAPagar: unMes 
		organizacion: unaOrganizacion 
		monto: unMonto 
		numDonante: unNumDonante
		comision: 'Efectivo'.
]

{ #category : #'as yet unclassified' }
Efectivo >> pagoConComision: unMonto [
	self monto: unMonto.
	self comision: 0.
]

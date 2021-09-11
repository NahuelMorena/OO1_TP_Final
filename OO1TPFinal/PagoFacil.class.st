Class {
	#name : #PagoFacil,
	#superclass : #Donacion,
	#category : #'OO1TPFinal-model'
}

{ #category : #'as yet unclassified' }
PagoFacil class >> mesAPagar: unMes organizacion: unaOrganizacion donante: unDonante [
	super mesAPagar: unMes organizacion: unaOrganizacion donante: unDonante. 
]

{ #category : #'as yet unclassified' }
PagoFacil >> pagoConComision: unMonto [
	self monto: unMonto.
	self comision: (unMonto * 1.15) - unMonto.
]

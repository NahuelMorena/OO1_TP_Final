Class {
	#name : #TransfBancaria,
	#superclass : #Donacion,
	#category : #'OO1TPFinal-model'
}

{ #category : #'as yet unclassified' }
TransfBancaria class >> mesAPagar: unMes organizacion: unaOrganizacion monto:unMonto donante: unDonante [
	super mesAPagar: unMes organizacion: unaOrganizacion monto: unMonto donante: unDonante. 
]

{ #category : #'as yet unclassified' }
TransfBancaria >> pagoConComision: unMonto [
	self monto: unMonto.
	self comision: (unMonto * 1.1) - unMonto.
]

Class {
	#name : #DonacionTest,
	#superclass : #TestCase,
	#instVars : [
		'efectivo',
		'pagoFacil',
		'transfBancaria'
	],
	#category : #'OO1TPFinal-tests'
}

{ #category : #tests }
DonacionTest >> testAltaDonacionEfectivo [
	efectivo := Efectivo mesAPagar: 6 monto: 1000 numDonante: 1001.
	self assert: (efectivo monto) equals: 1000.
	self assert: (efectivo obtenerPagoSinComision) equals: 1000. 
]

{ #category : #tests }
DonacionTest >> testAltaDonacionPagoFacil [
	efectivo := PagoFacil mesAPagar: 6 monto: 1000 numDonante: 1001.
	self assert: (efectivo monto) equals: 1150. 
	self assert: (efectivo obtenerPagoSinComision) equals: 1000.
]

{ #category : #tests }
DonacionTest >> testAltaDonacionTransfBancaria [
	transfBancaria := TransfBancaria mesAPagar: 6 monto: 1000 numDonante: 1001.
	self assert: (transfBancaria monto) equals: 1100.
	self assert: (transfBancaria obtenerPagoSinComision) equals: 1000 
]

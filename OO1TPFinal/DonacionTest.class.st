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
	self assert: (efectivo comision) equals: 0. 
]

{ #category : #tests }
DonacionTest >> testAltaDonacionPagoFacil [
	efectivo := PagoFacil mesAPagar: 6 monto: 1000 numDonante: 1001.
	self assert: (efectivo comision) equals: 150. 
]

{ #category : #tests }
DonacionTest >> testAltaDonacionTransfBancaria [
	efectivo := TransfBancaria mesAPagar: 6 monto: 1000 numDonante: 1001.
	self assert: (efectivo comision) equals: 100. 
]

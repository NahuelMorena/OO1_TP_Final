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
DonacionTest >> setUp [ 
	efectivo := Efectivo mesAPagar: 6 monto: 1000 numDonante: 1001.
	pagoFacil := PagoFacil mesAPagar: 6 monto: 1000 numDonante: 1001.
	transfBancaria := TransfBancaria mesAPagar: 6 monto: 1000 numDonante: 1001.
	

]

{ #category : #tests }
DonacionTest >> testActualYear [
	self assert: efectivo actualYear.
]

{ #category : #tests }
DonacionTest >> testAltaDonacionEfectivo [
	self assert: (efectivo monto) equals: 1000.
	self assert: (efectivo obtenerPagoSinComision) equals: 1000. 
]

{ #category : #tests }
DonacionTest >> testAltaDonacionPagoFacil [
	self assert: (pagoFacil monto) equals: 1150. 
	self assert: (pagoFacil obtenerPagoSinComision) equals: 1000.
]

{ #category : #tests }
DonacionTest >> testAltaDonacionTransfBancaria [
	self assert: (transfBancaria monto) equals: 1100.
	self assert: (transfBancaria obtenerPagoSinComision) equals: 1000 
]

{ #category : #tests }
DonacionTest >> testObtenerPagoSinComision [
	self assert: (efectivo obtenerPagoSinComision) equals: 1000.0.
	self assert: (pagoFacil obtenerPagoSinComision) equals: 1000.0.
	self assert: (transfBancaria obtenerPagoSinComision) equals: 1000.0.
	
	
]

{ #category : #tests }
DonacionTest >> testPagoConComision [
	efectivo pagoConComision: 1000.
	self assert: (efectivo monto) equals: 1000.
	pagoFacil pagoConComision: 1000.
	self assert: (pagoFacil monto) equals: 1150.0.
	transfBancaria pagoConComision: 1000.
	self assert: (transfBancaria monto) equals: 1100.0.
	
	
	
]

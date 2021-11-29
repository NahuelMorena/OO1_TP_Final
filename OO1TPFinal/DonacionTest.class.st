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
DonacionTest >> testDonador [
	self assert: (efectivo donador) equals: 1001.
	self assert: (pagoFacil donador) equals: 1001.
	self assert: (transfBancaria donador) equals: 1001.
	
	
]

{ #category : #tests }
DonacionTest >> testFecha [
	self assert: (efectivo fecha) equals: Date today.
	self assert: (pagoFacil fecha) equals: Date today.
	self assert: (transfBancaria fecha) equals: Date today
	
	
	
]

{ #category : #tests }
DonacionTest >> testMesDelPago [
	self assert: (efectivo mesDelPago) equals: 6.
	self assert: (pagoFacil mesDelPago) equals: 6.
	self assert: (transfBancaria mesDelPago) equals: 6
	
	
	
]

{ #category : #tests }
DonacionTest >> testMonto [
	self assert: (efectivo monto) equals: 1000.
	efectivo monto: 500.
	self assert: (efectivo monto) equals: 500.
	
	
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

Class {
	#name : #TipoDePagoTest,
	#superclass : #TestCase,
	#instVars : [
		'pagoEfectivo',
		'pagoTransfBancaria',
		'pagoDePagoFacil'
	],
	#category : #'OO1TPFinal-tests'
}

{ #category : #running }
TipoDePagoTest >> setUp [ 
	pagoEfectivo := Efectivo montoAPagar: 1000.
	pagoTransfBancaria := TransfBancaria montoAPagar: 1000.
	pagoDePagoFacil := PagoFacil montoAPagar: 1000.

]

{ #category : #'as yet unclassified' }
TipoDePagoTest >> testAltaDonacionEfectivo [
	self assert: (pagoEfectivo monto) equals: 1000.
	self assert: (pagoEfectivo obtenerPagoSinComision) equals: 1000. 
]

{ #category : #'as yet unclassified' }
TipoDePagoTest >> testAltaDonacionPagoFacil [
	self assert: (pagoDePagoFacil monto) equals: 1150. 
	self assert: (pagoDePagoFacil obtenerPagoSinComision) equals: 1000.
]

{ #category : #'as yet unclassified' }
TipoDePagoTest >> testAltaDonacionTransfBancaria [
	self assert: (pagoTransfBancaria monto) equals: 1100.
	self assert: (pagoTransfBancaria obtenerPagoSinComision) equals: 1000 
]

{ #category : #'as yet unclassified' }
TipoDePagoTest >> testMonto [
	self assert: (pagoEfectivo monto) equals: 1000.
	pagoEfectivo monto: 500.
	self assert: (pagoEfectivo monto) equals: 500.
	
]

{ #category : #'as yet unclassified' }
TipoDePagoTest >> testObtenerPagoSinComision [
	self assert: (pagoEfectivo obtenerPagoSinComision) equals: 1000.0.
	self assert: (pagoDePagoFacil obtenerPagoSinComision) equals: 1000.0.
	self assert: (pagoTransfBancaria obtenerPagoSinComision) equals: 1000.0.
]

{ #category : #'as yet unclassified' }
TipoDePagoTest >> testPagoConComision [
	pagoEfectivo pagoConComision: 1000.
	self assert: (pagoEfectivo monto) equals: 1000.
	pagoDePagoFacil pagoConComision: 1000.
	self assert: (pagoDePagoFacil monto) equals: 1150.0.
	pagoTransfBancaria pagoConComision: 1000.
	self assert: (pagoTransfBancaria monto) equals: 1100.0.
	
]

Class {
	#name : #DonacionTest,
	#superclass : #TestCase,
	#instVars : [
		'donacionEfectivo',
		'donacionPagoFacil',
		'donacionTransfBancaria',
		'pagoEfectivo',
		'pagoTransfBancaria',
		'pagoDePagoFacil'
	],
	#category : #'OO1TPFinal-tests'
}

{ #category : #'as yet unclassified' }
DonacionTest >> altaDonacionesTest [
	donacionEfectivo := Donacion mesAPagar: 6 pago: pagoEfectivo numDonante: 1001.
	donacionPagoFacil := Donacion mesAPagar: 6 pago: pagoDePagoFacil numDonante: 1001. 
   donacionTransfBancaria := Donacion mesAPagar: 6 pago: pagoTransfBancaria numDonante: 1001.
]

{ #category : #'as yet unclassified' }
DonacionTest >> altaPagosTest [
	pagoEfectivo := Efectivo montoAPagar: 1000.
	pagoTransfBancaria := TransfBancaria montoAPagar: 1000.
	pagoDePagoFacil := PagoFacil montoAPagar: 1000.
]

{ #category : #tests }
DonacionTest >> setUp [ 
	self altaPagosTest.
	self altaDonacionesTest
	

]

{ #category : #tests }
DonacionTest >> testActualYear [
	self assert: donacionEfectivo actualYear.
]

{ #category : #tests }
DonacionTest >> testDonador [
	self assert: (donacionEfectivo donador) equals: 1001.
	self assert: (donacionPagoFacil donador) equals: 1001.
	self assert: (donacionTransfBancaria donador) equals: 1001.
	
	
]

{ #category : #tests }
DonacionTest >> testFecha [
	self assert: (donacionEfectivo fecha) equals: Date today.
	self assert: (donacionPagoFacil fecha) equals: Date today.
	self assert: (donacionTransfBancaria fecha) equals: Date today
	
	
	
]

{ #category : #tests }
DonacionTest >> testMesDelPago [
	self assert: (donacionEfectivo mesDelPago) equals: 6.
	self assert: (donacionPagoFacil mesDelPago) equals: 6.
	self assert: (donacionTransfBancaria mesDelPago) equals: 6
	
	
	
]

{ #category : #tests }
DonacionTest >> testMontoDeDonacionesEntreFechas [ 
	|fecha1 fecha2|
	fecha1 := Date newDay: 26 month: 8 year: 2020.
	fecha2 := Date newDay: 31 month: 1 year: 2021.
	self assert: (donacionEfectivo montoDeDonacionesEntre: fecha1 y: fecha2) equals: 0. 
	fecha1 := Date newDay: 26 month: 8 year: 2021.
	fecha2 := Date newDay: 31 month: 1 year: 2022.
	self assert: (donacionEfectivo montoDeDonacionesEntre: fecha1 y: fecha2) equals: 1000. 
]

{ #category : #tests }
DonacionTest >> testPago [
	self assert: (donacionEfectivo pago) equals: pagoEfectivo.
	self assert: (donacionPagoFacil pago) equals: pagoDePagoFacil.
	self assert: (donacionTransfBancaria pago) equals: pagoTransfBancaria
	
	
	
]

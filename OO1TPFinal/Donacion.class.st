Class {
	#name : #Donacion,
	#superclass : #Object,
	#instVars : [
		'mesDelPago',
		'monto',
		'comision',
		'organizacion',
		'donador',
		'fecha'
	],
	#category : #'OO1TPFinal-model'
}

{ #category : #accessing }
Donacion >> actualYear [
	^(Date today year == self fecha year)
	
]

{ #category : #accessing }
Donacion >> comision: unaComision [
	comision:= unaComision.
]

{ #category : #accessing }
Donacion >> donador [
	^donador
]

{ #category : #accessing }
Donacion >> fecha [
	^fecha
]

{ #category : #initialization }
Donacion >> initialize [
	fecha := Date today.
]

{ #category : #'as yet unclassified' }
Donacion >> mesAPagar: unMes organizacion: unaOrganizacion donante: unDonante [
	mesDelPago:= unMes.
	organizacion:= unaOrganizacion.
	donador:= unDonante.
]

{ #category : #accessing }
Donacion >> mesDelPago [
	^mesDelPago.
]

{ #category : #accessing }
Donacion >> monto [
	^monto
]

{ #category : #accessing }
Donacion >> monto: unMonto [
	monto:= unMonto.
]

{ #category : #accessing }
Donacion >> montoDeDonacionesEntre: unafecha y: otraFecha [
	((self fecha) >= unafecha & (self fecha) <= otraFecha) ifTrue: [ ^self monto ].
	^0
]

{ #category : #'as yet unclassified' }
Donacion >> pagoConComision: unMonto [
	^self subclassResponsibility
]

Class {
	#name : #Donacion,
	#superclass : #Object,
	#instVars : [
		'mes',
		'monto',
		'comision',
		'organizacion',
		'donador',
		'hora',
		'fecha'
	],
	#category : #'OO1TPFinal-model'
}

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
	hora := Time now.
]

{ #category : #accessing }
Donacion >> mes [
	^mes
]

{ #category : #'as yet unclassified' }
Donacion >> mes: unMes organizacion: unaOrganizacion donante: unDonante [
	mes:= unMes.
	organizacion:= unaOrganizacion.
	donador:= unDonante.
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

Class {
	#name : #PozoComunTest,
	#superclass : #TestCase,
	#instVars : [
		'pozo'
	],
	#category : #'OO1TPFinal-tests'
}

{ #category : #running }
PozoComunTest >> setUp [
	pozo := PozoComun objetivoPozo: 4000.

]

{ #category : #tests }
PozoComunTest >> testCargarMonto [
	pozo cargarMonto: 300.
	self assert: (pozo recaudacion) equals: 300.0.
	pozo cargarMonto: 450.
	self assert: (pozo recaudacion) equals: 750.0.
]

{ #category : #tests }
PozoComunTest >> testRecibirColaboracion [
	self assert: (pozo objetivoPozo ) equals: 4000.
	self assert: (pozo recaudacion) equals:0.
	pozo recibirColaboracion: 2000.
	self assert: (pozo recaudacion) equals:2000.
	pozo recibirColaboracion: 3000.
	self assert: (pozo recaudacion) equals:5000.
	
	
	
]

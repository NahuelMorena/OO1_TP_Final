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
PozoComunTest >> testObjetivoPozo [
	self assert: (pozo objetivoPozo) equals: 4000.
	
]

{ #category : #tests }
PozoComunTest >> testPozoIncompleto [
	self assert: (pozo pozoIncompleto ).
	pozo recibirColaboracion: 5000.
	self deny: (pozo pozoIncompleto).
]

{ #category : #tests }
PozoComunTest >> testRecaudacion [
	self assert: (pozo recaudacion) equals: 0.
	
]

{ #category : #tests }
PozoComunTest >> testRecibirColaboracion [
	self assert: (pozo objetivoPozo ) equals: 4000.
	self assert: (pozo recaudacion) equals: 0.
	pozo recibirColaboracion: 2000.
	self assert: (pozo recaudacion) equals:2000.
	pozo recibirColaboracion: 3000.
	self assert: (pozo recaudacion) equals:5000.
	
	
	
]

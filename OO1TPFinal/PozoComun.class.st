Class {
	#name : #PozoComun,
	#superclass : #Object,
	#instVars : [
		'recaudacion',
		'objetivoPozo',
		'pozoIncompleto'
	],
	#category : #'OO1TPFinal-model'
}

{ #category : #'as yet unclassified' }
PozoComun class >> objetivoPozo: unObjetivo [
	^ self new 
		cargarPozoComun: unObjetivo.
]

{ #category : #accessing }
PozoComun >> cargarMonto: unMonto [
	^(recaudacion := recaudacion + unMonto).
]

{ #category : #'as yet unclassified' }
PozoComun >> cargarPozoComun: unObjetivo [ 
	objetivoPozo := unObjetivo.
	recaudacion := 0.
	pozoIncompleto := true.
]

{ #category : #accessing }
PozoComun >> objetivoPozo [
	^objetivoPozo.
]

{ #category : #accessing }
PozoComun >> pozoIncompleto [
	^pozoIncompleto
]

{ #category : #accessing }
PozoComun >> recaudacion [
	^recaudacion.
]

{ #category : #accessing }
PozoComun >> recibirColaboracion: unMonto [
	((self cargarMonto: unMonto) >= self objetivoPozo asNumber) ifTrue: [ pozoIncompleto := false ]
]

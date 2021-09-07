Class {
	#name : #Sistema,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'organizaciones'
	],
	#category : #'OO1TPFinal-model'
}

{ #category : #initialization }
Sistema >> initialize [
	usuarios := OrderedCollection new.
	organizaciones := OrderedCollection new.
]

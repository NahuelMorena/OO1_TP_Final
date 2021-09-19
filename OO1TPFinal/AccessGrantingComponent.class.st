Class {
	#name : #AccessGrantingComponent,
	#superclass : #WAComponent,
	#instVars : [
		'userName',
		'password'
	],
	#category : #'OO1TPFinal-UI'
}

{ #category : #rendering }
AccessGrantingComponent >> renderContentOn: aCanvas [
   aCanvas
      form: [ self renderInputElementsOn: aCanvas.
	      ]
]

{ #category : #rendering }
AccessGrantingComponent >> renderInputElementsOn: aCanvas [
   aCanvas heading: 'TP Final OO1'.
   aCanvas label: 'Hola a la pagina'.

]

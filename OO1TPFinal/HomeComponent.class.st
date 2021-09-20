Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#category : #'OO1TPFinal-UI'
}

{ #category : #accessing }
HomeComponent >> model [ 
	^ Grupo soleInstance
]

{ #category : #rendering }
HomeComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Estas en el Home'.
   aCanvas label: '----'.
	(self model usuarios) ifNotNil: [ aCanvas label: 'hay usuarios' ].
	
	
]

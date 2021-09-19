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
AccessGrantingComponent >> model [ 
	^ Grupo soleInstance

]

{ #category : #rendering }
AccessGrantingComponent >> password [ 
	^password
]

{ #category : #rendering }
AccessGrantingComponent >> password: aPassword [
	password := aPassword
]

{ #category : #rendering }
AccessGrantingComponent >> proceedWith: aUser [
	self session user: aUser.
   self call: HomeComponent new

]

{ #category : #rendering }
AccessGrantingComponent >> renderButtonsOn: aCanvas [
   self subclassResponsibility
]

{ #category : #rendering }
AccessGrantingComponent >> renderContentOn: aCanvas [
   aCanvas
      form: [ self renderInputElementsOn: aCanvas.
	      self renderButtonsOn: aCanvas]
]

{ #category : #rendering }
AccessGrantingComponent >> renderInputCommonElementsOn: aCanvas [
   aCanvas heading: 'TP Final OO1'.
   aCanvas label: 'Nombre de usuario'.
	aCanvas paragraph: [ aCanvas textInput on: #userName of: self ].
   aCanvas label: 'contraseña'.
   aCanvas paragraph: [ aCanvas passwordInput on: #password of: self ]

]

{ #category : #rendering }
AccessGrantingComponent >> renderInputElementsOn: aCanvas [
   self subclassResponsibility

]

{ #category : #rendering }
AccessGrantingComponent >> userName [ 	
	^userName
]

{ #category : #rendering }
AccessGrantingComponent >> userName: aUserName [
	userName := aUserName
]

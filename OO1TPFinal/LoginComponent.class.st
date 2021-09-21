Class {
	#name : #LoginComponent,
	#superclass : #AccessGrantingComponent,
	#category : #'OO1TPFinal-UI'
}

{ #category : #accessing }
LoginComponent >> login [
	(self model usuario: (self userName) protegidoPor: (self password))
		ifNotNil: [ :it | self proceedWith: it ].

]

{ #category : #'as yet unclassified' }
LoginComponent >> registerNewUser [
	self call: RegisterComponent new
]

{ #category : #rendering }
LoginComponent >> renderButtonsOn: aCanvas [
	self renderSignInButtonOn: aCanvas.
	aCanvas horizontalRule.
	aCanvas paragraph: '¿No tienes una cuenta?'.
	self renderSignUpButtonOn: aCanvas.
]

{ #category : #rendering }
LoginComponent >> renderInputElementsOn: aCanvas [
	self renderInputCommonElementsOn: aCanvas.
]

{ #category : #rendering }
LoginComponent >> renderSignInButtonOn: aCanvas [
	aCanvas submitButton 
		callback: [ self login ];
		with: 'Iniciar sesion'
]

{ #category : #rendering }
LoginComponent >> renderSignUpButtonOn: aCanvas [
	aCanvas submitButton 
		callback: [ self registerNewUser ];
		with: 'Registrate'
]

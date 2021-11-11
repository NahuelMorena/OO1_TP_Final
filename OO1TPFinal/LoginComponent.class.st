Class {
	#name : #LoginComponent,
	#superclass : #AccessGrantingComponent,
	#category : #'OO1TPFinal-UI'
}

{ #category : #accessing }
LoginComponent >> login [
	self loginUser.
	self loginCoordinator.
]

{ #category : #'as yet unclassified' }
LoginComponent >> loginCoordinator [
	(self model coordinador: (self email ) protegidoPor: (self password))
		ifNotNil: [ :it | self proceedWithCoordinator: it ].
]

{ #category : #'as yet unclassified' }
LoginComponent >> loginUser [
	(self model usuario: (self email ) protegidoPor: (self password))
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

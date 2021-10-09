Class {
	#name : #CoordinatorProfileComponent,
	#superclass : #ProfileComponent,
	#instVars : [
		'userNumber'
	],
	#category : #'OO1TPFinal-UI'
}

{ #category : #accessing }
CoordinatorProfileComponent >> dni [
	^(self user) dni.
]

{ #category : #accessing }
CoordinatorProfileComponent >> email [
	^(self user) email.
]

{ #category : #accessing }
CoordinatorProfileComponent >> file [ 
	^(self user) legajo.
]

{ #category : #accessing }
CoordinatorProfileComponent >> model [ 
	^ Grupo soleInstance.
]

{ #category : #accessing }
CoordinatorProfileComponent >> name [ 
	^(self user) name.
]

{ #category : #accessing }
CoordinatorProfileComponent >> password [ 
	^(self user) contraseña.
]

{ #category : #accessing }
CoordinatorProfileComponent >> phone [ 
	^(self user) telefono.
]

{ #category : #rendering }
CoordinatorProfileComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Perfil de ', self name.
	aCanvas horizontalRule.
	self renderInformationOn: aCanvas.
	self renderReturnButton: aCanvas
]

{ #category : #accessing }
CoordinatorProfileComponent >> user [ 
	^ self model buscarDonantePorNumerodeDonante: userNumber.
]

{ #category : #accessing }
CoordinatorProfileComponent >> userNumber [
	^userNumber
]

{ #category : #accessing }
CoordinatorProfileComponent >> userNumber: anUserNumber [
	userNumber := anUserNumber.
]

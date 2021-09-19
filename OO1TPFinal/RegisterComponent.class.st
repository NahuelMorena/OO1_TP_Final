Class {
	#name : #RegisterComponent,
	#superclass : #AccessGrantingComponent,
	#instVars : [
		'dni',
		'legajo',
		'telefono',
		'email'
	],
	#category : #'OO1TPFinal-UI'
}

{ #category : #accessing }
RegisterComponent >> dni [
	^dni
]

{ #category : #accessing }
RegisterComponent >> dni: aDni [
	dni := aDni
]

{ #category : #accessing }
RegisterComponent >> email [ 
	^email
]

{ #category : #accessing }
RegisterComponent >> email: unEmail [
	email := unEmail
]

{ #category : #accessing }
RegisterComponent >> legajo [
	^legajo
]

{ #category : #accessing }
RegisterComponent >> legajo: unLegajo [
	legajo := unLegajo
]

{ #category : #rendering }
RegisterComponent >> registerAndLogin [
	|user|
	user := self model altaDonante: (self userName) dni: (self dni) telefono: (self telefono) email: (self email) legajo: (self legajo).
	self proceedWith: user.
]

{ #category : #rendering }
RegisterComponent >> renderButtonsOn: aCanvas [
	self renderSignUpButtonOn: aCanvas
]

{ #category : #rendering }
RegisterComponent >> renderInputElementsOn: aCanvas [
  	self renderInputCommonElementsOn: aCanvas.
   aCanvas label: 'DNI'.
	aCanvas paragraph: [ aCanvas textInput on: #dni of: self ].
   aCanvas label: 'Telefono'.
   aCanvas paragraph: [ aCanvas textInput on: #telefono of: self ].
	aCanvas label: 'Legajo'.
	aCanvas paragraph: [ aCanvas textInput on: #legajo of: self ].
]

{ #category : #rendering }
RegisterComponent >> renderSignUpButtonOn: aCanvas [
  aCanvas submitButton 
    callback: [ self registerAndLogin ];
    with: 'Registrarme'.
]

{ #category : #accessing }
RegisterComponent >> telefono [
	^telefono
]

{ #category : #accessing }
RegisterComponent >> telefono: unTelefono [
	telefono := unTelefono
]

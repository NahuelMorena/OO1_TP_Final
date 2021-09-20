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
	|numUser|
	numUser := self model altaDonante: (self userName) dni: (self dni) telefono: (self telefono) email: (self email) legajo: (self legajo) contraseña: (self password).
	self proceedWith: (self model buscarDonantePorNumerodeDonante: numUser).
]

{ #category : #rendering }
RegisterComponent >> renderButtonsOn: aCanvas [
	self renderSignUpButtonOn: aCanvas
]

{ #category : #rendering }
RegisterComponent >> renderInputElementsOn: aCanvas [
  	self renderInputCommonElementsOn: aCanvas.
   aCanvas label: 'DNI'.
	aCanvas paragraph: [ aCanvas numberInput on: #dni of: self ].
	aCanvas label: 'Email'.
	aCanvas paragraph: [ aCanvas emailInput on: #email of: self ].
   aCanvas label: 'Telefono'.
   aCanvas paragraph: [ aCanvas numberInput on: #telefono of: self ].
	aCanvas label: 'Legajo'.
	aCanvas paragraph: [ aCanvas numberInput on: #legajo of: self ].
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

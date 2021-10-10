Class {
	#name : #CoordinatorProfileComponent,
	#superclass : #ProfileComponent,
	#instVars : [
		'userNumber',
		'title'
	],
	#category : #'OO1TPFinal-UI'
}

{ #category : #accessing }
CoordinatorProfileComponent >> dni [
	^(self user) dni.
]

{ #category : #'as yet unclassified' }
CoordinatorProfileComponent >> donationList [
   ^ (self donationsForOrganization) select: [ :each | each isNotEmpty ]
	
]

{ #category : #'as yet unclassified' }
CoordinatorProfileComponent >> donationsForOrganization [
	^ self model organizaciones collect: [ :each | each donaciones] .
	
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
CoordinatorProfileComponent >> isUser: aDonation [
	^((self model buscarDonantePorNumerodeDonante: (aDonation donador)) == (self user)). 
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
	self renderOrganizationFollowList: aCanvas.
	self renderDonationList: aCanvas.
	self renderReturnButton: aCanvas
]

{ #category : #rendering }
CoordinatorProfileComponent >> renderDonationList: aCanvas [
	aCanvas heading level2; with: 'Donaciones del usuario'.
	aCanvas unorderedList: [ (self model organizaciones ) do: [ :each | 
			(each donaciones) do: [  :each2 | 
				(self isUser: each2) 
					ifTrue: [  
						self renderOrganizationName: aCanvas of: each.
						aCanvas text: 'Donador: ', (self user) name, ' ||| '.
						aCanvas text: 'Monto: ', ((each2 obtenerPagoSinComision) asString), ' ||| '.
						aCanvas text: 'Mes asignado: ', each2 mesDelPago, ' ||| '.
						aCanvas break.
					].
		].
		self title: nil.
		aCanvas horizontalRule.]]
]

{ #category : #accessing }
CoordinatorProfileComponent >> renderOrganizationName: aCanvas of: anOrganization [ 
	(title) ifNil: 
		[ aCanvas heading level3; with: (anOrganization denominacion). 
		  self title: 'activado']
	
	
]

{ #category : #accessing }
CoordinatorProfileComponent >> title [ 
	^title 
]

{ #category : #accessing }
CoordinatorProfileComponent >> title: aString [
	title := aString.
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

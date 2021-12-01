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

{ #category : #accessing }
CoordinatorProfileComponent >> renderDonationInformation: aCanvas of: aDonation [
	aCanvas text: 'Donador: ', (self user) name, ' ||| '.
	aCanvas text: 'Monto: ', ((aDonation obtenerPagoSinComision) asString), ' ||| '.
	aCanvas text: 'Mes asignado: ', aDonation mesDelPago, ' ||| '.
	aCanvas break.
	
]

{ #category : #rendering }
CoordinatorProfileComponent >> renderDonationList: aCanvas [
	aCanvas heading level2; with: 'Donaciones del usuario que presenta en lo que va del año'.
	aCanvas unorderedList: [ (self model organizaciones ) do: [ :each | 
			self renderOrganizationInformation: aCanvas of: each.
			self title: nil.
			aCanvas horizontalRule.]
	]
]

{ #category : #accessing }
CoordinatorProfileComponent >> renderOrganizationInformation: aCanvas of: anOrganization [ 
	(anOrganization buscarDonacionesPorUsuario: (self user)) do: [  :each2 |  
					self renderOrganizationName: aCanvas of: anOrganization.
					self renderDonationInformation: aCanvas of: each2.
			].
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

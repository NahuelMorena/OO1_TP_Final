Class {
	#name : #OrganizationComponent,
	#superclass : #WAComponent,
	#instVars : [
		'organization'
	],
	#category : #'OO1TPFinal-UI'
}

{ #category : #'as yet unclassified' }
OrganizationComponent >> doDonation [
	self 
     call: (NewDonationComponent new 
              organization: organization;
              yourself)
]

{ #category : #'as yet unclassified' }
OrganizationComponent >> followOrganization [
	organization agregarIntegrante: (self session user)
]

{ #category : #accessing }
OrganizationComponent >> organization [ 
	^organization
]

{ #category : #accessing }
OrganizationComponent >> organization: anOrganization [ 
	organization := anOrganization.
]

{ #category : #accessing }
OrganizationComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Informacion de la Organización'.
	self renderInformation: aCanvas.
	aCanvas break. 
	(self searchUser)
			ifFalse: [ self renderFollowOrganization: aCanvas ]
			ifTrue: [ 
				aCanvas label: 'Sigues a esta Organizacion ||'.
				self renderDonationOption: aCanvas ].
	
]

{ #category : #accessing }
OrganizationComponent >> renderDonationOption: aCanvas [
	aCanvas anchor 
      callback: [ self doDonation ];
      with: [ aCanvas button: 'Realizar una Donación'].
]

{ #category : #accessing }
OrganizationComponent >> renderFollowOrganization: aCanvas [
	aCanvas label: 'No sigues a esta Organizacion ||'.
	aCanvas anchor 
      callback: [ self followOrganization ];
      with: [ aCanvas button: 'Seguir organización'
		].
	
]

{ #category : #rendering }
OrganizationComponent >> renderInformation: aCanvas [.
	aCanvas label: 'Denominación: ', self organization denominacion.
	aCanvas horizontalRule.
	aCanvas label: 'Dirección: ', self organization direccion.
	aCanvas horizontalRule.
	aCanvas label: 'Representante: ', self organization representante nombre.
	aCanvas horizontalRule.
	aCanvas label: 'Email del Representante: ', self organization representante email.
	aCanvas horizontalRule.
	
]

{ #category : #accessing }
OrganizationComponent >> searchUser [
	^ organization integrantes includes: (self session user)
]

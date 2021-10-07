Class {
	#name : #CoordinatorHomeComponent,
	#superclass : #HomeComponent,
	#category : #'OO1TPFinal-UI'
}

{ #category : #'as yet unclassified' }
CoordinatorHomeComponent >> proposedList [
	^self model propuestas.
]

{ #category : #rendering }
CoordinatorHomeComponent >> renderContentOn: aCanvas [
	self renderCommonHome: aCanvas.
	self renderProposedOrganizations: aCanvas.
	self renderDonationOn: aCanvas.
	
	
]

{ #category : #rendering }
CoordinatorHomeComponent >> renderDonationOn: aCanvas [
	aCanvas heading:'donaciones'
]

{ #category : #rendering }
CoordinatorHomeComponent >> renderProposedList: aCanvas [
	aCanvas 
		unorderedList: [ (self proposedList ) do: [ :each | 
			aCanvas paragraph: [ aCanvas anchor
				callback: [ self showOrganization: each ];
				with: 'unaOrganization'
			].
			aCanvas label: 'Hola'.
		]
	]
	
]

{ #category : #rendering }
CoordinatorHomeComponent >> renderProposedOrganizations: aCanvas [
	aCanvas heading  
     level: 2;
     with: 'Propuestas de Organizaciones'.
	self renderProposedList: aCanvas.
	
]

Class {
	#name : #CoordinatorHomeComponent,
	#superclass : #HomeComponent,
	#category : #'OO1TPFinal-UI'
}

{ #category : #visiting }
CoordinatorHomeComponent >> acceptProposed: aProposed [
	self model aceptarPropuestaDeOrganizacion: aProposed
	
]

{ #category : #'as yet unclassified' }
CoordinatorHomeComponent >> donationList [
	^ self model organizaciones collect: [ :each | each donaciones].
]

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
CoordinatorHomeComponent >> renderDonationList: aCanvas [
	aCanvas unorderedList: [ (self donationList ) do: [ :each | 
		aCanvas text: 
			'Donador: ', (self model buscarDonantePorNumerodeDonante: (each donador)) nombre,' ||| '.
		aCanvas horizontalRule.
		]
	]
	
]

{ #category : #rendering }
CoordinatorHomeComponent >> renderDonationOn: aCanvas [
	aCanvas heading  level: 2; with: 'Donaciones del sistema'.
	self renderDonationList: aCanvas.
	self renderViewAllDonation: aCanvas.
]

{ #category : #rendering }
CoordinatorHomeComponent >> renderProposedList: aCanvas [
	aCanvas 
		unorderedList: [ (self proposedList ) do: [ :each | 
			aCanvas text: 'Denominación: ', each denominacion, ' ||| '.
			aCanvas text: 'Dirección: ', each direccion, ' ||| '.
			aCanvas text: 'Representante: ', each representante nombre, ' ||| '.
			aCanvas anchor 
      			callback: [ self acceptProposed: each ];
      			with: [ aCanvas button: 'Aceptar propuesta de organización' ].
			aCanvas horizontalRule.
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

{ #category : #rendering }
CoordinatorHomeComponent >> renderViewAllDonation: aCanvas [
]

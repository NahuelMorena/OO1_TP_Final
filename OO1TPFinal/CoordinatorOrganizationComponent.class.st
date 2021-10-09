Class {
	#name : #CoordinatorOrganizationComponent,
	#superclass : #OrganizationComponent,
	#category : #'OO1TPFinal-UI'
}

{ #category : #'as yet unclassified' }
CoordinatorOrganizationComponent >> donationList [
	^organization donaciones
	
]

{ #category : #accessing }
CoordinatorOrganizationComponent >> model [ 
	^ Grupo soleInstance.
]

{ #category : #accessing }
CoordinatorOrganizationComponent >> renderContentOn: aCanvas [
	self renderCommonOn: aCanvas.
	aCanvas heading level2; with: 'Donaciones de esta organización'.
	self renderDonationList: aCanvas.
	self renderReturnButton: aCanvas.
]

{ #category : #rendering }
CoordinatorOrganizationComponent >> renderDonationList: aCanvas [
	aCanvas unorderedList: [ (self donationList ) do: [ :each | 
		aCanvas text: 'Donador: ', (self model buscarDonantePorNumerodeDonante: (each donador)) nombre, ' ||| '.
		aCanvas text: 'Monto: ', ((each obtenerPagoSinComision) asString), ' ||| '.
		aCanvas text: 'Mes asignado: ', each mesDelPago, ' ||| '.
		aCanvas horizontalRule.
		]
	]
	
]

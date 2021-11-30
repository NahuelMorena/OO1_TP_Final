Class {
	#name : #CoordinatorOrganizationComponent,
	#superclass : #OrganizationComponent,
	#category : #'OO1TPFinal-UI'
}

{ #category : #'as yet unclassified' }
CoordinatorOrganizationComponent >> donationInThisMonthList [
	^organization obtenerDonacionesDeEsteMes.
	
]

{ #category : #'as yet unclassified' }
CoordinatorOrganizationComponent >> donationList [
	^ organization donaciones reject: [ :each  | (self donationInThisMonthList) includes: each ].
]

{ #category : #accessing }
CoordinatorOrganizationComponent >> model [ 
	^ Grupo soleInstance.
]

{ #category : #accessing }
CoordinatorOrganizationComponent >> renderContentOn: aCanvas [
	self renderCommonOn: aCanvas.
	aCanvas heading level2; with: 'Donaciones de esta organización de este mes'.
	self renderDonationInThisMonthList: aCanvas.
	aCanvas heading level2; with: 'Demas donaciones de la organización'.
	self renderDonationList: aCanvas.
	self renderReturnButton: aCanvas.
]

{ #category : #rendering }
CoordinatorOrganizationComponent >> renderDonationInThisMonthList: aCanvas [
	aCanvas unorderedList: [ (self donationInThisMonthList ) do: [ :each | 
		self renderInformationOnList: aCanvas donation: each.
		aCanvas horizontalRule.
		]
	]
	
]

{ #category : #rendering }
CoordinatorOrganizationComponent >> renderDonationList: aCanvas [
	aCanvas unorderedList: [ (self donationList ) do: [ :each | 
		self renderInformationOnList: aCanvas donation: each.
		aCanvas horizontalRule.
		]
	]
]

{ #category : #rendering }
CoordinatorOrganizationComponent >> renderInformationOnList: aCanvas donation: aDonation [ 
	aCanvas text: 'Donador: ', (self model buscarDonantePorNumerodeDonante: (aDonation donador)) name, ' ||| '.
		aCanvas text: 'Monto: ', ((aDonation pago obtenerPagoSinComision) asString), ' ||| '.
		aCanvas text: 'Mes asignado: ', aDonation mesDelPago, ' ||| '.
]

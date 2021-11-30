Class {
	#name : #CoordinatorOrganizationComponent,
	#superclass : #OrganizationComponent,
	#instVars : [
		'actualid'
	],
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

{ #category : #'as yet unclassified' }
CoordinatorOrganizationComponent >> getDonationInOrder [
	^ ((organization donaciones) asSortedCollection: [ :each :each2 | each donador >= each2 donador ])
	
]

{ #category : #'as yet unclassified' }
CoordinatorOrganizationComponent >> identifyDonor: aCanvas of: aDonation [
		(actualid) 
			ifNil: [ self writeName: aCanvas of: aDonation ]
			ifNotNil: [ (actualid == aDonation donador) 
									ifFalse: [ self writeName: aCanvas of: aDonation ]
			]
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
	aCanvas heading level2; with: 'Donaciones organizada por donantes'.
	self renderDonorList: aCanvas.
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
CoordinatorOrganizationComponent >> renderDonorList: aCanvas [
	aCanvas unorderedList: [ (self getDonationInOrder ) do: [ :each | 
			self identifyDonor: aCanvas of: each.
			self renderInformationOnList: aCanvas donation: each.
			aCanvas horizontalRule.
		]
	].
	actualid := nil
]

{ #category : #rendering }
CoordinatorOrganizationComponent >> renderInformationOnList: aCanvas donation: aDonation [ 
	aCanvas text: 'Donador: ', (self model buscarDonantePorNumerodeDonante: (aDonation donador)) name, ' ||| '.
		aCanvas text: 'Monto: ', ((aDonation pago obtenerPagoSinComision) asString), ' ||| '.
		aCanvas text: 'Mes asignado: ', aDonation mesDelPago, ' ||| '.
]

{ #category : #writing }
CoordinatorOrganizationComponent >> writeName: aCanvas of: aDonation [
	actualid := aDonation donador. 
	aCanvas heading level2; with: (self model buscarDonantePorNumerodeDonante: aDonation donador) name .
	
]

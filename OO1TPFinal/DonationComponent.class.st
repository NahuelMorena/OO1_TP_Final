Class {
	#name : #DonationComponent,
	#superclass : #WAComponent,
	#category : #'OO1TPFinal-UI'
}

{ #category : #'as yet unclassified' }
DonationComponent >> donorsList [
   |aux|
	aux := Set new.
	self model organizaciones do: [ :each | each donaciones do: [ :each2 | aux add: each2 donador ] ].
	^aux.
	
]

{ #category : #accessing }
DonationComponent >> model [ 
	^ Grupo soleInstance.
]

{ #category : #rendering }
DonationComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Apartado de donaciones'.
	self renderDonorsList: aCanvas.

]

{ #category : #rendering }
DonationComponent >> renderDonorsList: aCanvas [.
	aCanvas heading level2; with: 'Lista de donadores'.
	aCanvas
		unorderedList: [ (self donorsList) do: [ :each |
			aCanvas paragraph: [ aCanvas anchor
				callback: [ self showUser: each ];
				with: (self model buscarDonantePorNumerodeDonante: each) name. ].
			aCanvas horizontalRule.
			]
		]
]

{ #category : #'as yet unclassified' }
DonationComponent >> showUser: anUserNumber [
	self call: (CoordinatorProfileComponent new 
              	userNumber: anUserNumber;  yourself)
]

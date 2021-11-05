Class {
	#name : #DonationComponent,
	#superclass : #CoordinatorHomeComponent,
	#instVars : [
		'amount',
		'initialDay',
		'initialMonth',
		'initialYear',
		'finalDay',
		'finalMonth',
		'finalYear'
	],
	#category : #'OO1TPFinal-UI'
}

{ #category : #'as yet unclassified' }
DonationComponent >> amount [
	^amount
]

{ #category : #'as yet unclassified' }
DonationComponent >> calculateAmount [
	|initialDate finalDate|
	amount := 0.0.
	initialDate := Date newDay: (self initialDay asNumber) month: (self initialMonth asNumber) year: (self initialYear asNumber).
	finalDate := Date newDay: (self finalDay asNumber) month: (self finalMonth asNumber) year: (self initialYear asNumber).
	self model organizaciones do: 	
		[ :each | amount := amount + (each obtenerDonacionesEntre: (initialDate) y: (finalDate)) ]
]

{ #category : #'as yet unclassified' }
DonationComponent >> donationList [
	|aux|
	aux := OrderedCollection new.
	self model organizaciones do: [ :each | aux addAll: each donaciones].
	^aux.
	
]

{ #category : #'as yet unclassified' }
DonationComponent >> donorsList [
   |aux|
	aux := Set new.
	self model organizaciones do: [ :each | each donaciones do: [ :each2 | aux add: each2 donador ] ].
	^aux.
	
]

{ #category : #'as yet unclassified' }
DonationComponent >> finalDay [
	^finalDay
]

{ #category : #'as yet unclassified' }
DonationComponent >> finalDay: aFinalDay [
	finalDay := aFinalDay.
]

{ #category : #'as yet unclassified' }
DonationComponent >> finalMonth [
	^finalMonth
]

{ #category : #'as yet unclassified' }
DonationComponent >> finalMonth: aFinalMonth [
	finalMonth := aFinalMonth.
]

{ #category : #'as yet unclassified' }
DonationComponent >> finalYear [
	^finalYear
]

{ #category : #'as yet unclassified' }
DonationComponent >> finalYear: aFinalYear [
	finalYear := aFinalYear.
]

{ #category : #'as yet unclassified' }
DonationComponent >> initialDay [
	^initialDay 
]

{ #category : #'as yet unclassified' }
DonationComponent >> initialDay: anInitialDay [
	initialDay := anInitialDay.
]

{ #category : #'as yet unclassified' }
DonationComponent >> initialMonth [
	^initialMonth 
]

{ #category : #'as yet unclassified' }
DonationComponent >> initialMonth: anInitialMonth [
	initialMonth := anInitialMonth.
]

{ #category : #'as yet unclassified' }
DonationComponent >> initialYear [
	^initialYear 
]

{ #category : #'as yet unclassified' }
DonationComponent >> initialYear: anInitialYear [
	initialYear := anInitialYear.
]

{ #category : #accessing }
DonationComponent >> model [ 
	^ Grupo soleInstance.
]

{ #category : #rendering }
DonationComponent >> renderAllDonationList: aCanvas [
	aCanvas heading  level: 2; with: 'Donaciones del sistema'.
	aCanvas unorderedList: [ (self donationList ) do: [ :each | 
		aCanvas text: 'Donador: ', (self model buscarDonantePorNumerodeDonante: (each donador)) name, ' ||| '.
		aCanvas text: 'Organización: ', (self searchOrganizationOf: each) , ' ||| '.
		aCanvas text: 'Monto: ', ((each obtenerPagoSinComision) asString), ' ||| '.
		aCanvas text: 'Mes asignado: ', each mesDelPago, ' ||| '.
		aCanvas horizontalRule.
		]
	]
	
]

{ #category : #'as yet unclassified' }
DonationComponent >> renderAmountResultOn: aCanvas [
	(self amount) ifNotNil: [  
				aCanvas label: 'Resultado'.
				aCanvas break.
				aCanvas label: 'Monto obtenido entre las fechas dadas: ', self amount asString.
	].
]

{ #category : #rendering }
DonationComponent >> renderCalculateAmount: aCanvas [
	aCanvas heading  level: 2; with: 'Calcular monto obtenido entre fechas'.
	aCanvas form: [ 
		aCanvas label: 'Dia-mes-año de fecha inicial '.
		aCanvas paragraph: [ aCanvas numberInput on: #initialDay of: self ].
		aCanvas paragraph: [ aCanvas numberInput on: #initialMonth of: self ].
		aCanvas paragraph: [ aCanvas numberInput on: #initialYear of: self ].
		aCanvas label: 'Dia-mes-año de fecha final'.
		aCanvas paragraph: [ aCanvas numberInput on: #finalDay of: self ].
		aCanvas paragraph: [ aCanvas numberInput on: #finalMonth of: self ].
		aCanvas paragraph: [ aCanvas numberInput on: #finalYear of: self ].
		aCanvas submitButton 
			callback: [ self calculateAmount ];
			with: 'Calcular monto obtenido'.
	].
	self renderAmountResultOn: aCanvas.

]

{ #category : #rendering }
DonationComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Apartado de donaciones'.
	self renderDonorsList: aCanvas.
	self renderAllDonationList: aCanvas.
	self renderCalculateAmount: aCanvas.
	self renderReturnButton: aCanvas.

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
DonationComponent >> renderReturnButton: aCanvas [
	aCanvas
     paragraph: [ aCanvas anchor 
	      callback: [ self answer ];
	      with: [ aCanvas button with: 'Volver' ] ]
]

{ #category : #'as yet unclassified' }
DonationComponent >> showUser: anUserNumber [
	self call: (CoordinatorProfileComponent new 
              	userNumber: anUserNumber;  yourself)
]

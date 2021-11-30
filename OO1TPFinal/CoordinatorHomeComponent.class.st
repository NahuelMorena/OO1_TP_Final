Class {
	#name : #CoordinatorHomeComponent,
	#superclass : #HomeComponent,
	#instVars : [
		'collection'
	],
	#category : #'OO1TPFinal-UI'
}

{ #category : #visiting }
CoordinatorHomeComponent >> acceptProposed: aProposed [
	self model aceptarPropuestaDeOrganizacion: aProposed
	
]

{ #category : #'as yet unclassified' }
CoordinatorHomeComponent >> activateCollection [
	self model solicitarColaboracionPozoComun: collection
]

{ #category : #'as yet unclassified' }
CoordinatorHomeComponent >> collection [ 
	^collection
	
]

{ #category : #'as yet unclassified' }
CoordinatorHomeComponent >> collection: aCollection [
	collection := aCollection.
	
]

{ #category : #'as yet unclassified' }
CoordinatorHomeComponent >> donationList [
	|aux|
	aux := OrderedCollection new.
	self model organizaciones do: [ :each | aux addAll: each obtenerDonacionesDeEsteMes].
	^aux.
]

{ #category : #'as yet unclassified' }
CoordinatorHomeComponent >> proposedList [
	^self model propuestas.
]

{ #category : #'as yet unclassified' }
CoordinatorHomeComponent >> renderActivateCollectionOn: aCanvas [
	aCanvas form: [ 
		aCanvas label: 'Monto objetivo'.
		aCanvas paragraph: [ aCanvas numberInput on: #collection of: self ].
		aCanvas submitButton 
			callback: [ self activateCollection ];
			with: 'Iniciar pozo en Común'.
	]
]

{ #category : #rendering }
CoordinatorHomeComponent >> renderCollectionOn: aCanvas [
	aCanvas heading  level: 2; with: 'Pozo en común'.
	(self model pozoComun)
		ifTrue: [ self renderStatusCollectionOn: aCanvas ]
		ifFalse: [ (self model recaudacion == 0)
					ifTrue: [ self renderActivateCollectionOn: aCanvas. ]
					ifFalse: [ self renderCollectionResultOn: aCanvas ].			
		].
]

{ #category : #rendering }
CoordinatorHomeComponent >> renderCollectionResultOn: aCanvas [
	aCanvas label: 'Recaudación obtenida: ', self model recaudacion asString.
	aCanvas label: ' ||| Objetivo de la recaudación: ', self model objetivoPozo asString,' ||| '.
	aCanvas anchor 
      callback: [ self resetCollection ];
      with: [ aCanvas button: 'Resetear pozo en común'].
	
]

{ #category : #rendering }
CoordinatorHomeComponent >> renderContentOn: aCanvas [
	self renderCommonHome: aCanvas.
	self renderProposedOrganizations: aCanvas.
	self renderDonationOn: aCanvas.
	self renderCollectionOn: aCanvas.
	
	
]

{ #category : #rendering }
CoordinatorHomeComponent >> renderDonationInThisMonthList: aCanvas [
	aCanvas unorderedList: [ (self donationList ) do: [ :each | 
		self renderInformation: aCanvas of: each. 
		]
	]
	
]

{ #category : #rendering }
CoordinatorHomeComponent >> renderDonationOn: aCanvas [
	aCanvas heading  level: 2; with: 'Donaciones del sistema de este mes'.
	self renderDonationInThisMonthList: aCanvas.
	self renderViewAllDonation: aCanvas.
]

{ #category : #rendering }
CoordinatorHomeComponent >> renderInformation: aCanvas of: aDonation [
	aCanvas text: 'Donador: ', (self model buscarDonantePorNumerodeDonante: (aDonation donador)) name, ' ||| '.
	aCanvas text: 'Organización: ', (self searchOrganizationOf: aDonation) , ' ||| '.
	aCanvas text: 'Monto: ', ((aDonation pago obtenerPagoSinComision) asString), ' ||| '.
	aCanvas text: 'Mes asignado: ', aDonation mesDelPago, ' ||| '.
	aCanvas text: 'Fecha de realización: ', aDonation fecha asString, ' ||| '.
	aCanvas horizontalRule.
	
]

{ #category : #rendering }
CoordinatorHomeComponent >> renderProposedInformationOn: aCanvas of: proposed [ 
	aCanvas text: 'Denominación: ', proposed denominacion, ' ||| '.
	aCanvas text: 'Dirección: ', proposed direccion, ' ||| '.
	aCanvas text: 'Representante: ', proposed representante name, ' ||| '.
	aCanvas anchor 
   		callback: [ self acceptProposed: proposed ];
      	with: [ aCanvas button: 'Aceptar propuesta de organización' ].
	aCanvas horizontalRule.
]

{ #category : #rendering }
CoordinatorHomeComponent >> renderProposedList: aCanvas [
	aCanvas 
		unorderedList: [ (self proposedList ) do: [ :each | 
			self renderProposedInformationOn: aCanvas of: each.
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

{ #category : #'as yet unclassified' }
CoordinatorHomeComponent >> renderStatusCollectionOn: aCanvas [
	aCanvas heading  level: 3; with: 'Información sobre recaudación'.
	aCanvas label: 'Objetivo a recaudar: ', self model objetivoPozo asString.
	aCanvas break.
	aCanvas label: 'Recaudacion hasta el momento: ', self model recaudacion asString
	
]

{ #category : #rendering }
CoordinatorHomeComponent >> renderViewAllDonation: aCanvas [
	aCanvas anchor 
      callback: [ self showAllDonation ];
      with: [ aCanvas button: 'Sección de donaciones' ].
]

{ #category : #initialization }
CoordinatorHomeComponent >> resetCollection [
	self model resetearPozoComun.
	
]

{ #category : #rendering }
CoordinatorHomeComponent >> searchOrganizationOf: aDonation [
	|aux|
	self model organizaciones do: [ :each | (each donaciones includes: aDonation) ifTrue: [ aux := each denominacion ] ].
	^aux.
]

{ #category : #'as yet unclassified' }
CoordinatorHomeComponent >> showAllDonation [
	self call: DonationComponent new.
	
]

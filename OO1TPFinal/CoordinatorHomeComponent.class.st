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
	|aux|
	aux := OrderedCollection new.
	self model organizaciones do: [ :each | aux addAll: each donaciones].
	^aux.
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
		aCanvas text: 'Donador: ', (self model buscarDonantePorNumerodeDonante: (each donador)) nombre, ' ||| '.
		aCanvas text: 'Organización: ', (self searchOrganizationOf: each) , ' ||| '.
		aCanvas text: 'Monto: ', ((each obtenerPagoSinComision) asString), ' ||| '.
		aCanvas text: 'Mes asignado: ', each mesDelPago, ' ||| '.
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
	aCanvas anchor 
      callback: [ self showAllDonation ];
      with: [ aCanvas button: 'Sección de donaciones' ].
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

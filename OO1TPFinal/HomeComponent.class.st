Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'donation'
	],
	#category : #'OO1TPFinal-UI'
}

{ #category : #'as yet unclassified' }
HomeComponent >> createNewOrganization [
	self call: NewOrganizationComponent new.
]

{ #category : #'as yet unclassified' }
HomeComponent >> donateCollection [
	self model pozoComun recibirColaboracion: (donation asNumber).
]

{ #category : #'as yet unclassified' }
HomeComponent >> donation [
	^donation
	
]

{ #category : #'as yet unclassified' }
HomeComponent >> donation: aDonation [
	donation := aDonation 
	
]

{ #category : #accessing }
HomeComponent >> model [ 
	^ Grupo soleInstance.
]

{ #category : #'as yet unclassified' }
HomeComponent >> organizationsList [
	^self model organizaciones.
]

{ #category : #accessing }
HomeComponent >> profileView [
	 self call: ProfileComponent new  
	
]

{ #category : #rendering }
HomeComponent >> renderCollectionFormInformation: aCanvas [
	aCanvas heading  level: 2; with: 'Pozo común'. 
	aCanvas label: '¿Realizar donación al Pozo Común?'.
	aCanvas break.
	aCanvas label: 'Objetivo a recaudar: ', self model pozoComun objetivoPozo asString, ' ||| Recaudado: ', self model pozoComun recaudacion asString.
	aCanvas break. aCanvas break.
]

{ #category : #'as yet unclassified' }
HomeComponent >> renderCollectionFormOn: aCanvas [
	self renderCollectionFormInformation: aCanvas. 
	aCanvas form: [ 
		aCanvas label: 'Monto a donar'.
		aCanvas paragraph: [ aCanvas numberInput on: #donation of: self ].
		aCanvas submitButton 
			callback: [ self donateCollection ];
			with: 'Donar'.
	].
	aCanvas horizontalRule.
	
	
]

{ #category : #rendering }
HomeComponent >> renderCommonHome: aCanvas [
	aCanvas heading: 'Esta en Home'.
	aCanvas anchor 
   		callback: [ self profileView];
      with: [ aCanvas heading level: 2; with: 'Perfil de ', self session user name ].
	aCanvas horizontalRule.
	self renderDonateCollectionOn: aCanvas.
	self renderOrganizationsOn: aCanvas.
	aCanvas horizontalRule.
	
	
]

{ #category : #'as yet unclassified' }
HomeComponent >> renderContentOn: aCanvas [
	self renderCommonHome: aCanvas.
]

{ #category : #'as yet unclassified' }
HomeComponent >> renderDonateCollectionOn: aCanvas [
	(self model pozoComun) 
		ifNotNil: [ 
			(self model pozoComun pozoIncompleto) 
				ifTrue: [  self renderCollectionFormOn: aCanvas. ]
		] 
	
]

{ #category : #rendering }
HomeComponent >> renderOrganizationInformation: aCanvas of: anOrganization [
	aCanvas paragraph: [ aCanvas anchor
		callback: [ self showOrganization: anOrganization ];
		with: anOrganization denominacion.
	].
	aCanvas text: 'Representante: ', anOrganization representante name, ' ||| '.
	aCanvas text: 'Direccion: ', anOrganization direccion, ' ||| '.
	aCanvas horizontalRule.
]

{ #category : #rendering }
HomeComponent >> renderOrganizationsList: aCanvas [
	aCanvas 
		unorderedList: [ (self organizationsList ) do: [ :each | 
			self renderOrganizationInformation: aCanvas of: each.
		]
	]
		

]

{ #category : #rendering }
HomeComponent >> renderOrganizationsOn: aCanvas [
	aCanvas heading  
     level: 2;
     with: 'Organizaciones del sistema'.
	self renderOrganizationsList: aCanvas.
	aCanvas anchor 
      callback: [ self createNewOrganization ];
      with: [ aCanvas button: 'Proponer nueva organización' ].
]

{ #category : #'as yet unclassified' }
HomeComponent >> showOrganization: anOrganization [
	(self model coordinadores includes: (self session user)) 
			ifTrue: 
				[ self call: (CoordinatorOrganizationComponent new 
              	organization: anOrganization;  yourself) ]
			ifFalse: 
				[ self call: (OrganizationComponent new 
        			organization: anOrganization;  yourself) ].
	
]

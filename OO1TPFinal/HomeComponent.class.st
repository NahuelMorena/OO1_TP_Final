Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#category : #'OO1TPFinal-UI'
}

{ #category : #'as yet unclassified' }
HomeComponent >> createNewOrganization [
	self call: NewOrganizationComponent new.
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
	self call: ProfileComponent new.
]

{ #category : #rendering }
HomeComponent >> renderCommonHome: aCanvas [
	aCanvas heading: 'Esta en Home'.
	aCanvas anchor 
   		callback: [ self profileView];
      with: [ aCanvas heading level: 2; with: 'Perfil de ', self session user nombre ].
	aCanvas horizontalRule.
	self renderOrganizationsOn: aCanvas.
	aCanvas horizontalRule.
	
	
]

{ #category : #'as yet unclassified' }
HomeComponent >> renderContentOn: aCanvas [
	self renderCommonHome: aCanvas.
]

{ #category : #rendering }
HomeComponent >> renderOrganizationsList: aCanvas [
	aCanvas 
		unorderedList: [ (self organizationsList ) do: [ :each | 
			aCanvas paragraph: [ aCanvas anchor
				callback: [ self showOrganization: each ];
				with: each denominacion.
			].
			aCanvas text: 'Representante: ', each representante nombre, ' ||| '.
			aCanvas text: 'Direccion: ', each direccion, ' ||| '.
			aCanvas horizontalRule.
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
	self 
     call: (OrganizationComponent new 
              	organization: anOrganization;
               yourself)
]

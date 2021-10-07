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
	
	
]

{ #category : #accessing }
HomeComponent >> renderContentOn: aCanvas [
	self renderCommonHome: aCanvas.
	aCanvas horizontalRule.
	self renderOrganizationsOn: aCanvas.
	aCanvas horizontalRule.

	aCanvas label: '//Nombre de usuario: ', self session user nombre.
	aCanvas label: '//Contraseña de usuario: ', self session user contraseña.
	(self model usuario: (self session user email) protegidoPor: (self session user contraseña))
      ifNotNil: [ aCanvas label: 'encuentro algo re easy'].
	
]

{ #category : #rendering }
HomeComponent >> renderOrganizationsList: aCanvas [
	aCanvas 
		unorderedList: [ (self organizationsList ) do: [ :each | 
			aCanvas paragraph: [ aCanvas anchor
				callback: [ self showOrganization: each ];
				with: 'unaOrganization'
			]
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
HomeComponent >> showOrganization: each [
]

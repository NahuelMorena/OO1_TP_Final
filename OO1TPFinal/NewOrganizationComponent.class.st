Class {
	#name : #NewOrganizationComponent,
	#superclass : #WAComponent,
	#instVars : [
		'denominacion',
		'direccion'
	],
	#category : #'OO1TPFinal-UI'
}

{ #category : #accessing }
NewOrganizationComponent >> denominacion [
	^denominacion
]

{ #category : #accessing }
NewOrganizationComponent >> denominacion: unaDenominacion [
	denominacion := unaDenominacion
]

{ #category : #accessing }
NewOrganizationComponent >> direccion [
	^direccion
]

{ #category : #accessing }
NewOrganizationComponent >> direccion: unaDireccion [
	direccion:= unaDireccion
]

{ #category : #accessing }
NewOrganizationComponent >> model [ 
	^ Grupo soleInstance.
]

{ #category : #rendering }
NewOrganizationComponent >> registerNewOrganization [
	self model 
		altaOrganizacion: (self denominacion) 
		representante: (self session user) 
		direccion: (self direccion). 
	self answer.
	
]

{ #category : #rendering }
NewOrganizationComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Nueva Organización'.
	aCanvas form: [  
		self renderInputElementsOn: aCanvas.
		self renderRegisterButtonOn: aCanvas.].
	aCanvas break.
	aCanvas break.
	aCanvas text: 
		'La organización creada debera ser aprobada por un coordinador antes de aparecer en el sistema.'.
	self renderReturnButton: aCanvas.
	
]

{ #category : #rendering }
NewOrganizationComponent >> renderInputElementsOn: aCanvas [
	aCanvas label: 'Denominación de la organización'.
	aCanvas paragraph: [ aCanvas textInput on: #denominacion of: self ].
	aCanvas label: 'Dirección'.
	aCanvas paragraph: [ aCanvas textInput on: #direccion of: self ].
]

{ #category : #rendering }
NewOrganizationComponent >> renderRegisterButtonOn: aCanvas [
	aCanvas submitButton 
		callback: [ self registerNewOrganization ];
		with: 'Registrar Organización'.
]

{ #category : #rendering }
NewOrganizationComponent >> renderReturnButton: aCanvas [
	aCanvas
     paragraph: [ aCanvas anchor 
	      callback: [ self answer ];
	      with: [ aCanvas button with: 'Volver' ] ]
]

Class {
	#name : #NewDonationComponent,
	#superclass : #WAComponent,
	#instVars : [
		'organization',
		'money',
		'month'
	],
	#category : #'OO1TPFinal-UI'
}

{ #category : #'as yet unclassified' }
NewDonationComponent >> bankPaymentMethod [
	self model realizarDonacionTransferenciaBancaria: (self session user obtenerIdentificacion ) 
				  para: (self organization) 
				  cantidad: (self money) 
				  paraEl: (self month).
	self answer.
	
]

{ #category : #'as yet unclassified' }
NewDonationComponent >> cashPaymentMethod [
	self model realizarDonacionEfectivo: (self session user obtenerIdentificacion ) 
				  para: (self organization)  
				  cantidad: (self money) 
				  paraEl: (self money).
	self answer.
]

{ #category : #accessing }
NewDonationComponent >> deleteInformation [
	month := nil.
	money := nil.
]

{ #category : #'as yet unclassified' }
NewDonationComponent >> easyPaymentMethod [
	self model realizarDonacionPagoFacil: (self session user obtenerIdentificacion ) 
				  para: (self organization) 
				  cantidad: (self money) 
				  paraEl: (self month).
	self answer.
]

{ #category : #accessing }
NewDonationComponent >> model [ 	
	^ Grupo soleInstance.
]

{ #category : #accessing }
NewDonationComponent >> money [
	^money
]

{ #category : #accessing }
NewDonationComponent >> money: aMoney [
	money := aMoney
]

{ #category : #accessing }
NewDonationComponent >> month [
	^month
	
]

{ #category : #accessing }
NewDonationComponent >> month: aMonth [
	month := aMonth.
]

{ #category : #accessing }
NewDonationComponent >> organization [
	^organization
]

{ #category : #accessing }
NewDonationComponent >> organization: anOrganization [
	organization := anOrganization.
]

{ #category : #rendering }
NewDonationComponent >> renderBankPaymentMethodOn: aCanvas [
	aCanvas anchor 
      callback: [ self bankPaymentMethod ];
      with: [ aCanvas button: 'Realizar donación mediante Pago Bancario' ].
	
]

{ #category : #rendering }
NewDonationComponent >> renderCashPaymentMethodOn: aCanvas [
	aCanvas anchor 
      callback: [ self cashPaymentMethod ];
      with: [ aCanvas button: 'Realizar donación mediante Pago en Efectivo' ].
]

{ #category : #rendering }
NewDonationComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Realizar donación a ', organization denominacion.
	aCanvas heading  level: 2; with: 'Dirección: ', organization direccion.
	(self money) 
		ifNil: [ self renderDonateFormOn: aCanvas. ] 
		ifNotNil: [ aCanvas text: 'Selecciona metodo de pago para donar $', self money,' para el mes: ', self month.
						aCanvas horizontalRule.
						aCanvas break.
						self renderPaymentMethods: aCanvas].
	aCanvas horizontalRule.
	aCanvas break. 
	self renderDeleteInformation: aCanvas.
	self renderReturnButton: aCanvas

]

{ #category : #accessing }
NewDonationComponent >> renderDeleteInformation: aCanvas [
	aCanvas anchor 
      callback: [ self deleteInformation ];
      with: [ aCanvas button: 'Modificar datos ingresados' ].
	
]

{ #category : #rendering }
NewDonationComponent >> renderDonateFormOn: aCanvas [
	aCanvas form: [ 
		aCanvas label: 'Monto a donar'.
		aCanvas paragraph: [ aCanvas numberInput on: #money  of: self ].
		aCanvas label: 'Mes a la que corresponde la donación'.
		aCanvas paragraph: [ aCanvas numberInput on: #month of: self ].
		aCanvas submitButton 
			with: 'Cargar monto a donar'.
	]
	
]

{ #category : #rendering }
NewDonationComponent >> renderEasyPaymentMethodOn: aCanvas [
	aCanvas anchor 
      callback: [ self easyPaymentMethod ];
      with: [ aCanvas button: 'Realizar donación mediante Pago facil' ].
]

{ #category : #rendering }
NewDonationComponent >> renderPaymentMethods: aCanvas [
	self renderCashPaymentMethodOn: aCanvas.
	aCanvas text: ' ||| '.
	self renderBankPaymentMethodOn: aCanvas.
	aCanvas text: ' ||| '.
	self renderEasyPaymentMethodOn: aCanvas.
	
	
	
]

{ #category : #rendering }
NewDonationComponent >> renderReturnButton: aCanvas [
	aCanvas
     paragraph: [ aCanvas anchor 
	      callback: [ self answer ];
	      with: [ aCanvas button with: 'Volver' ] ]
	
	
	
]

Class {
	#name : #ProfileComponent,
	#superclass : #WAComponent,
	#category : #'OO1TPFinal-UI'
}

{ #category : #accessing }
ProfileComponent >> dni [ 	
	^ self session user dni.
]

{ #category : #accessing }
ProfileComponent >> email [ 
	^ self session user email.
]

{ #category : #rendering }
ProfileComponent >> file [ 
	^ self session user legajo.
	
]

{ #category : #accessing }
ProfileComponent >> name [ 
	^self session user name.
]

{ #category : #accessing }
ProfileComponent >> password [ 
	^ self session user contraseña.
]

{ #category : #accessing }
ProfileComponent >> phone [ 
	^ self session user telefono.
]

{ #category : #rendering }
ProfileComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Perfil de ', self name.
	aCanvas horizontalRule.
	self renderInformationOn: aCanvas.
	aCanvas break.
	self renderReturnButton: aCanvas.
]

{ #category : #rendering }
ProfileComponent >> renderInformationOn: aCanvas [
	aCanvas label: 'Nombre de usuario: ', self name.
	aCanvas horizontalRule.
	aCanvas label: 'Email: ', self email.
	aCanvas horizontalRule.
	aCanvas label: 'Contraseña: ', self password.
	aCanvas horizontalRule.
	aCanvas label: 'DNI: ', self dni.
	aCanvas horizontalRule.
	aCanvas label: 'Telefono: ', self phone.
	aCanvas horizontalRule.
	aCanvas label: 'Legajo: ', self file.

	
]

{ #category : #rendering }
ProfileComponent >> renderReturnButton: aCanvas [
	aCanvas
     paragraph: [ aCanvas anchor 
	      callback: [ self answer ];
	      with: [ aCanvas button with: 'Volver' ] ]
]

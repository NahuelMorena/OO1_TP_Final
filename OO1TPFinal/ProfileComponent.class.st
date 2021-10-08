Class {
	#name : #ProfileComponent,
	#superclass : #WAComponent,
	#category : #'OO1TPFinal-UI'
}

{ #category : #rendering }
ProfileComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Perfil de ', self session user nombre.
	aCanvas horizontalRule.
	self renderInformationOn: aCanvas.
	aCanvas break.
	self renderReturnButton: aCanvas.
]

{ #category : #rendering }
ProfileComponent >> renderInformationOn: aCanvas [
	aCanvas label: 'Nombre de usuario: ', self session user nombre.
	aCanvas horizontalRule.
	aCanvas label: 'Email: ', self session user email.
	aCanvas horizontalRule.
	aCanvas label: 'Contraseña: ', self session user contraseña.
	aCanvas horizontalRule.
	aCanvas label: 'DNI: ', self session user dni.
	aCanvas horizontalRule.
	aCanvas label: 'Telefono: ', self session user telefono.
	aCanvas horizontalRule.
	aCanvas label: 'Legajo: ', self session user legajo.

	
]

{ #category : #rendering }
ProfileComponent >> renderReturnButton: aCanvas [
	aCanvas
     paragraph: [ aCanvas anchor 
	      callback: [ self answer ];
	      with: [ aCanvas button with: 'Volver' ] ]
]

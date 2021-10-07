Class {
	#name : #ProfileComponent,
	#superclass : #WAComponent,
	#category : #'OO1TPFinal-UI'
}

{ #category : #rendering }
ProfileComponent >> renderContentOn: aCanvas [
	aCanvas label: '//Nombre de usuario: ', self session user nombre.

]

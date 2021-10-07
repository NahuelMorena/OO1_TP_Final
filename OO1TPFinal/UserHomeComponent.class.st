Class {
	#name : #UserHomeComponent,
	#superclass : #HomeComponent,
	#category : #'OO1TPFinal-UI'
}

{ #category : #accessing }
UserHomeComponent >> renderContentOn: aCanvas [
	self renderCommonHome: aCanvas.
	
	aCanvas horizontalRule.
	self renderOrganizationsOn: aCanvas.
	aCanvas horizontalRule.

	aCanvas label: '//Nombre de usuario: ', self session user nombre.
	aCanvas label: '//Contraseña de usuario: ', self session user contraseña.
	(self model usuario: (self session user email) protegidoPor: (self session user contraseña))
      ifNotNil: [ aCanvas label: 'encuentro algo re easy'].
]

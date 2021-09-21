Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#category : #'OO1TPFinal-UI'
}

{ #category : #accessing }
HomeComponent >> model [ 
	^ Grupo soleInstance.
]

{ #category : #accessing }
HomeComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Estas en Home'.
	aCanvas label: '//Nombre de usuario: ', self session user nombre.
	aCanvas label: '//Contraseña de usuario: ', self session user contraseña.
	(self model usuario: (self session user nombre) protegidoPor: (self session user contraseña))
      ifNotNil: [ aCanvas label: 'encuentro algo re easy'].
	
]

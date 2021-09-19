Class {
	#name : #SessionWithUser,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'OO1TPFinal-UI'
}

{ #category : #accessing }
SessionWithUser >> user [
	^user
]

{ #category : #accessing }
SessionWithUser >> user: anObject [
	user := anObject 
]

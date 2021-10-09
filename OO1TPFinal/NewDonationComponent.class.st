Class {
	#name : #NewDonationComponent,
	#superclass : #WAComponent,
	#instVars : [
		'organization',
		'money'
	],
	#category : #'OO1TPFinal-UI'
}

{ #category : #accessing }
NewDonationComponent >> organization [
	^organization
]

{ #category : #accessing }
NewDonationComponent >> organization: anOrganization [
	organization := anOrganization.
]

{ #category : #rendering }
NewDonationComponent >> renderContentOn: aCanvas [
]

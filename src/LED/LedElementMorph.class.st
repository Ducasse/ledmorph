Class {
	#name : #LedElementMorph,
	#superclass : #Morph,
	#instVars : [
		'highlighted'
	],
	#category : #LED
}

{ #category : #initialization }
LedElementMorph >> defaultColor [

	^ Color green
]

{ #category : #drawing }
LedElementMorph >> drawOnFills: aRectangle [

	^ true
]

{ #category : #accessing }
LedElementMorph >> highlighted [

	^ highlighted
]

{ #category : #accessing }
LedElementMorph >> highlighted: aBoolean [

	highlighted := aBoolean.
	self changed.
]

{ #category : #initialization }
LedElementMorph >> initialize [

	super initialize.	
	highlighted := false
]

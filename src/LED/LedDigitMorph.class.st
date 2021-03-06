"
I am a 7-segment LED that can display a decimal digit

LedDigitMorph new openInWorld

LedDigitMorph new
	 digit: 8;
	 openInWorld
"
Class {
	#name : #LedDigitMorph,
	#superclass : #LedElementMorph,
	#instVars : [
		'digit'
	],
	#classVars : [
		'HSegmentOrigins',
		'HSegments',
		'VSegmentOrigins',
		'VSegments'
	],
	#category : #LED
}

{ #category : #'class initialization' }
LedDigitMorph class >> initialize [
	HSegmentOrigins := {0.2@0.1. 0.2@0.45. 0.2@0.8}.
	VSegmentOrigins := {0.1@0.2. 0.1@0.55. 0.8@0.2. 0.8@0.55}.
	HSegments := {
		{true. false. true}.
		{false. false. false}.
		{true. true. true}.
		{true. true. true}.
		{false. true. false}.
		{true. true. true}.
		{true. true. true}.
		{true. false. false}.
		{true. true. true}.
		{true. true. true}.
		{false. true. false}}.
	VSegments := {
		{true. true. true. true}.
		{false. false. true. true}.
		{false. true. true. false}.
		{false. false. true. true}.
		{true. false. true. true}.
		{true. false. false. true}.
		{true. true. false. true}.
		{false. false. true. true}.
		{true. true. true. true}.
		{true. false. true. true}.
		{false. false. false. false}}.
]

{ #category : #accessing }
LedDigitMorph >> digit [

	^ digit
]

{ #category : #accessing }
LedDigitMorph >> digit: anInteger [

	digit := anInteger \\ 10	
]

{ #category : #drawing }
LedDigitMorph >> drawOn: aCanvas [

	| foregroundColor backgroundColor thickness hThickness vThickness hOffset vOffset |
	foregroundColor := highlighted ifTrue: [Color white] ifFalse: [color].
	backgroundColor := color muchDarker.
	hThickness := self height * 0.1.
	vThickness := self width * 0.1.
	thickness := hThickness min: vThickness.
	vOffset := ((hThickness - thickness) // 2) max: 0.
	hOffset := ((vThickness - thickness) // 2) max: 0.
	aCanvas fillRectangle: self bounds color: backgroundColor.
	"added to show the minus sign"
	(digit asString = '-') ifTrue: [digit := 10].
	HSegmentOrigins with: (HSegments at: digit+1) do:
		[:o :isLit |
		aCanvas
			fillRectangle: (Rectangle
				origin: (self position + (0@vOffset) + (o * self extent)) rounded
				extent: ((self width * 0.6) @ thickness) rounded)
			color: (isLit ifTrue: [foregroundColor] ifFalse: [backgroundColor])].
	VSegmentOrigins with: (VSegments at: digit+1) do:
		[:o :isLit |
		aCanvas
			fillRectangle: (Rectangle
				origin: (self position + (hOffset@0) + (o * self extent)) rounded
				extent: (thickness @ (self height * 0.25)) rounded)
			color: (isLit ifTrue: [foregroundColor] ifFalse: [backgroundColor])].

]

{ #category : #initialization }
LedDigitMorph >> initialize [
	"initialize the state of the receiver"
	super initialize.
	digit := 0 
]

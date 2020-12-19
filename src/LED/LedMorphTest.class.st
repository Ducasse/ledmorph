Class {
	#name : #LedMorphTest,
	#superclass : #TestCase,
	#category : #'LED-Test'
}

{ #category : #tests }
LedMorphTest >> testExample1 [

	self shouldnt: [ LedMorph new string:'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'; openInWorld; delete  ] raise: Error
]

{ #category : #tests }
LedMorphTest >> testExample2 [

	self shouldnt: [LedMorph new  chars: 10; string:'           I must get a life';flash:true;scrollLoop:true; openInWorld; delete] raise: Error
]

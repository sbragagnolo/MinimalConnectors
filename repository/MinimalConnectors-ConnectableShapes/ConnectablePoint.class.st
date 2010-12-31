Class {
	#name : #ConnectablePoint,
	#superclass : #Morph,
	#category : #'MinimalConnectors-ConnectableShapes'
}

{ #category : #'as yet unclassified' }
ConnectablePoint >> addMorph: aMorph [
	super addMorph: aMorph.
	aMorph center: self center.
]

{ #category : #'as yet unclassified' }
ConnectablePoint >> connections [
	^self submorphs inject: Set new into:[:conns :point | conns union: point connections ]
]

{ #category : #'as yet unclassified' }
ConnectablePoint >> initialize [ 
	super initialize.
	self extent: 1@1.
	self color: Color transparent.
	self borderColor: Color transparent 
	
]

{ #category : #'as yet unclassified' }
ConnectablePoint >> points [
	^self submorphs 
]

{ #category : #'as yet unclassified' }
ConnectablePoint >> updateLayout [
	self center: owner center.
]

{ #category : #'as yet unclassified' }
ConnectablePoint >> updateView [
	"self comeToFront."
]

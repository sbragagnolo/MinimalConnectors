Class {
	#name : #ConnectablePointMorph,
	#superclass : #Morph,
	#category : #'MinimalConnectors-ConnectableShapes'
}

{ #category : #'as yet unclassified' }
ConnectablePointMorph >> addMorph: aMorph [
	super addMorph: aMorph.
	aMorph center: self center.
]

{ #category : #'as yet unclassified' }
ConnectablePointMorph >> connections [
	^self submorphs inject: Set new into:[:conns :point | conns union: point connections ]
]

{ #category : #'as yet unclassified' }
ConnectablePointMorph >> initialize [ 
	super initialize.
	self extent: 1@1.
	self color: Color transparent.
	self borderColor: Color transparent 
	
]

{ #category : #'as yet unclassified' }
ConnectablePointMorph >> points [
	^self submorphs 
]

{ #category : #'as yet unclassified' }
ConnectablePointMorph >> updateLayout [
	self center: owner center.
]

{ #category : #'as yet unclassified' }
ConnectablePointMorph >> updateView [
	"self comeToFront."
]

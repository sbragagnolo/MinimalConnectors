Class {
	#name : #ConnectableBorderMorph,
	#superclass : #RectangleMorph,
	#category : #'MinimalConnectors-ConnectableShapes'
}

{ #category : #'as yet unclassified' }
ConnectableBorderMorph >> addConnectionPoint: aMorph [
	self addMorph: aMorph.
	self cellInset: (owner width / (self submorphs size +1)).
]

{ #category : #'as yet unclassified' }
ConnectableBorderMorph >> connectionPoints [
	^self submorphs
]

{ #category : #'as yet unclassified' }
ConnectableBorderMorph >> sortSubmorphsBy: aBlock [
	"Sort the receiver's submorphs by the criterion indicated in the provided symbol"
	|subs|
	
	subs := submorphs.
	self removeAllMorphs.
	
	(subs sort: aBlock) do:[:s | self addMorph: s]
]

{ #category : #updating }
ConnectableBorderMorph >> updateConnections [
	self connectionPoints do:[:point | point updateConnections .]
]

{ #category : #'as yet unclassified' }
ConnectableBorderMorph >> updateLayout [
	self subclassResponsibility
]

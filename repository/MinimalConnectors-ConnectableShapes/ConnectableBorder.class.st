Class {
	#name : #ConnectableBorder,
	#superclass : #RectangleMorph,
	#category : #'MinimalConnectors-ConnectableShapes'
}

{ #category : #'as yet unclassified' }
ConnectableBorder >> addConnectionPoint: aMorph [
	self addMorph: aMorph.
	self cellInset: (owner width / (self submorphs size +1)).
]

{ #category : #'as yet unclassified' }
ConnectableBorder >> connectionPoints [
	^self submorphs
]

{ #category : #'as yet unclassified' }
ConnectableBorder >> sortSubmorphsBy: aBlock [
	"Sort the receiver's submorphs by the criterion indicated in the provided symbol"
	|subs|
	
	subs := submorphs.
	self removeAllMorphs.
	
	(subs sortBy: aBlock) do:[:s | self addMorph: s]
]

{ #category : #updating }
ConnectableBorder >> updateConnections [
	self connectionPoints do:[:point | point updateConnections .]
]

{ #category : #'as yet unclassified' }
ConnectableBorder >> updateLayout [
	self subclassResponsibility
]

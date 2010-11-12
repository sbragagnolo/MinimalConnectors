Class {
	#name : #ConnectableBorder,
	#superclass : #RectangleMorph,
	#category : #'MinimalConnectors-ConnectableShapes'
}

{ #category : #'as yet unclassified' }
ConnectableBorder >> connectionPoints [
	^self submorphs select:[:subMorph | subMorph isKindOf: SingleConnectionPoint ]
]

{ #category : #'as yet unclassified' }
ConnectableBorder >> sortSubmorphsBy: aBlock [
	"Sort the receiver's submorphs by the criterion indicated in the provided symbol"
	|subs|
	
	subs := submorphs.
	self removeAllMorphs.
	
	(subs sortBy: aBlock) do:[:s | self addMorph: s]
]

{ #category : #'as yet unclassified' }
ConnectableBorder >> updateConnectionsLabel [ 
	self connectionPoints do:[:point | point connections do:[:conn | conn  updateLabel.]]
]

{ #category : #'as yet unclassified' }
ConnectableBorder >> updateLayout [
	self subclassResponsibility
]

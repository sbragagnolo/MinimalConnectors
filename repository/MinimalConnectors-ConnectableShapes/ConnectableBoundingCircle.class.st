Class {
	#name : #ConnectableBoundingCircle,
	#superclass : #Morph,
	#instVars : [
		'points',
		'center'
	],
	#category : #'MinimalConnectors-ConnectableShapes'
}

{ #category : #'as yet unclassified' }
ConnectableBoundingCircle >> addConnectionPoint: aConnectionPoint thatConnectsTo: aShape [
	(self connectionNear: aShape ) addMorph: aConnectionPoint .
	 
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircle >> bottomPoint [
	^self points at: 3 ifAbsentPut:[ConnectablePoint new center: self bottomCenter]
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircle >> centerPoint [
	^center ifNil:[center:= ConnectablePoint new center: self center]
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircle >> connectionNear: anotherConnectableShape [
	^self points add: (ConnectablePoint new center: (owner closestPointTo: anotherConnectableShape center))
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircle >> connections [
	^(self submorphs select:[:sub | sub isKindOf: ConnectionMorph ]) union:(self points inject: Set new into:[:conns :point | conns union: point connections])
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircle >> initialize [ 
	super initialize.
	self color: Color transparent.
	self borderColor: Color black.
	
	points := OrderedCollection new.
	"self addMorph: self leftPoint.
	self addMorph: self rightPoint.
	self addMorph: self topPoint.
	self addMorph: self bottomPoint "
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircle >> leftPoint [
	^self points at: 4 ifAbsentPut:[ConnectablePoint new center: self leftCenter]
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircle >> points [
	^points
]

{ #category : #updating }
ConnectableBoundingCircle >> resetConnectionPoints [
	self points do:[:point | point removeAllMorphs ]
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircle >> rightPoint [
	^self points at: 2 ifAbsentPut:[ConnectablePoint new center: self rightCenter]
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircle >> topPoint [
	^self points at: 1 ifAbsentPut:[ ConnectablePoint new center: self topCenter]
]

{ #category : #updating }
ConnectableBoundingCircle >> updateConnections [
	self connections do:[:conn | conn  updateView; updateLabel.]
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircle >> updateLayout [ 
	self bounds: owner bounds.
	self center: owner center.
	"self leftPoint center: self leftCenter.
	self topPoint center: self topCenter.
	self bottomPoint center: self bottomCenter.
	self rightPoint center: self rightCenter ."
	self centerPoint center: self center.
	
	(self centerPoint points allSatisfy: [:point | point outConnections isEmpty ]) 
		ifTrue:[owner comeToFront ]
	
]

{ #category : #updating }
ConnectableBoundingCircle >> updateView [
	
]

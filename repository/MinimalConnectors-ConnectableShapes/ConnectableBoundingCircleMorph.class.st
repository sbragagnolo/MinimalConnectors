Class {
	#name : #ConnectableBoundingCircleMorph,
	#superclass : #Morph,
	#instVars : [
		'points',
		'center'
	],
	#category : #'MinimalConnectors-ConnectableShapes'
}

{ #category : #'as yet unclassified' }
ConnectableBoundingCircleMorph >> addConnectionPoint: aConnectionPoint thatConnectsTo: aShape [
	(self connectionNear: aShape ) addMorph: aConnectionPoint .
	 
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircleMorph >> bottomPoint [
	^self points at: 3 ifAbsentPut:[ConnectablePointMorph new center: self bottomCenter]
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircleMorph >> centerPoint [
	^center ifNil:[center:= ConnectablePointMorph new center: self center]
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircleMorph >> connectionNear: anotherConnectableShape [
	^self points add: (ConnectablePointMorph new center: (owner closestPointTo: anotherConnectableShape center))
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircleMorph >> connections [
	^(self submorphs select:[:sub | sub isKindOf: ConnectionMorph ]) union:(self points inject: Set new into:[:conns :point | conns union: point connections])
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircleMorph >> initialize [ 
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
ConnectableBoundingCircleMorph >> leftPoint [
	^self points at: 4 ifAbsentPut:[ConnectablePointMorph new center: self leftCenter]
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircleMorph >> points [
	^points
]

{ #category : #updating }
ConnectableBoundingCircleMorph >> resetConnectionPoints [
	self points do:[:point | point removeAllMorphs ]
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircleMorph >> rightPoint [
	^self points at: 2 ifAbsentPut:[ConnectablePointMorph new center: self rightCenter]
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircleMorph >> topPoint [
	^self points at: 1 ifAbsentPut:[ ConnectablePointMorph new center: self topCenter]
]

{ #category : #updating }
ConnectableBoundingCircleMorph >> updateConnections [
	self connections do:[:conn | conn  updateView; updateLabel.]
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircleMorph >> updateLayout [ 
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
ConnectableBoundingCircleMorph >> updateView [
	
]

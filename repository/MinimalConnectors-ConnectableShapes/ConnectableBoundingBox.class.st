"
A ConnectableBoundingBox is a bounding box with connection points for another morph that is going to be used as part of a graph or any diagram with connections between morphs (a class diagram, a sequence diagram, object diagram, etc)

"
Class {
	#name : #ConnectableBoundingBox,
	#superclass : #BorderedMorph,
	#instVars : [
		'borders'
	],
	#category : #'MinimalConnectors-ConnectableShapes'
}

{ #category : #'as yet unclassified' }
ConnectableBoundingBox >> addConnectionPoint: aConnectionPoint thatConnectsTo: aShape [
	(self connectionNear: aShape ) addConnectionPoint: aConnectionPoint .
	 
]

{ #category : #borders }
ConnectableBoundingBox >> borders [
	^borders

]

{ #category : #borders }
ConnectableBoundingBox >> bottomBorder [
	^self borders at: 3 ifAbsentPut:[ self newHorizontalBorder].
]

{ #category : #'as yet unclassified' }
ConnectableBoundingBox >> connectionNear: anotherClassBox [
	self top > anotherClassBox bottom ifTrue:[^self  topBorder].
	self bottom < anotherClassBox top ifTrue:[^self  bottomBorder].
	self left > anotherClassBox right ifTrue:[^self  leftBorder].
	self right < anotherClassBox left ifTrue:[^self  rightBorder].
	^self  leftBorder
]

{ #category : #'connection points' }
ConnectableBoundingBox >> connectionPoints [
	^self borders inject: OrderedCollection new into:[:points :border | points union: border submorphs ]
]

{ #category : #'as yet unclassified' }
ConnectableBoundingBox >> connections [
	^self submorphs select:[:sub | sub isKindOf: Connection ]
]

{ #category : #accessing }
ConnectableBoundingBox >> defaultColor [
	^Color veryLightGray 
]

{ #category : #accessing }
ConnectableBoundingBox >> delta [
	^ 10
]

{ #category : #'connection points' }
ConnectableBoundingBox >> initialize [ 
	super initialize.
	borderColor := Color gray.
	borders := OrderedCollection new.
	
	self addMorph: self leftBorder.
	self addMorph: self topBorder.
	self addMorph: self rightBorder.
	self addMorph: self bottomBorder.

]

{ #category : #borders }
ConnectableBoundingBox >> leftBorder [
	^self borders at: 4 ifAbsentPut:[self newVerticalBorder].
]

{ #category : #'as yet unclassified' }
ConnectableBoundingBox >> newHorizontalBorder [
	^ (HorizontalConnectableBorder new)
]

{ #category : #'as yet unclassified' }
ConnectableBoundingBox >> newVerticalBorder [
	^ (VerticalConnectableBorder new)
	
]

{ #category : #'as yet unclassified' }
ConnectableBoundingBox >> noteNewOwner: aMorph [
	self updateLayout
		
]

{ #category : #updating }
ConnectableBoundingBox >> resetConnectionPoints [
	self borders do: #removeAllMorphs 
]

{ #category : #borders }
ConnectableBoundingBox >> rightBorder [
	^self borders at: 2 ifAbsentPut:[self newVerticalBorder].
]

{ #category : #borders }
ConnectableBoundingBox >> topBorder [
	^self borders at: 1 ifAbsentPut:[self newHorizontalBorder].
]

{ #category : #'as yet unclassified' }
ConnectableBoundingBox >> updateConnections [
	self borders do:[:border | border updateConnections]
]

{ #category : #'as yet unclassified' }
ConnectableBoundingBox >> updateLayout [
	self bounds: owner bounds.
	self borders do: #updateLayout.
	
	self leftBorder center: self leftCenter - (3 @ 0).
	self topBorder center: self topCenter "- (0 @ 2)". 
	self rightBorder center: self rightCenter - (3 @ 0).
	self bottomBorder center: self bottomCenter" - (0 @ 2)". 

	

]

{ #category : #'as yet unclassified' }
ConnectableBoundingBox >> updateView [
	self borders do: #updateView


]

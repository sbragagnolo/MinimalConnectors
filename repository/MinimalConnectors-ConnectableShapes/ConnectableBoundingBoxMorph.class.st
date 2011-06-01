"
A ConnectableBoundingBox is a bounding box with connection points for another morph that is going to be used as part of a graph or any diagram with connections between morphs (a class diagram, a sequence diagram, object diagram, etc)

"
Class {
	#name : #ConnectableBoundingBoxMorph,
	#superclass : #RectangleMorph,
	#instVars : [
		'borders'
	],
	#category : #'MinimalConnectors-ConnectableShapes'
}

{ #category : #'as yet unclassified' }
ConnectableBoundingBoxMorph >> addConnectionPoint: aConnectionPoint thatConnectsTo: aShape [
	(self connectionNear: aShape ) addConnectionPoint: aConnectionPoint .
	 
]

{ #category : #borders }
ConnectableBoundingBoxMorph >> borders [
	^borders

]

{ #category : #borders }
ConnectableBoundingBoxMorph >> bottomBorder [
	^self borders at: 3 ifAbsentPut:[ self newHorizontalBorder].
]

{ #category : #'as yet unclassified' }
ConnectableBoundingBoxMorph >> connectionNear: anotherClassBox [
	self top > anotherClassBox bottom ifTrue:[^self  topBorder].
	self bottom < anotherClassBox top ifTrue:[^self  bottomBorder].
	self left > anotherClassBox right ifTrue:[^self  leftBorder].
	self right < anotherClassBox left ifTrue:[^self  rightBorder].
	^self  leftBorder
]

{ #category : #'connection points' }
ConnectableBoundingBoxMorph >> connectionPoints [
	^self borders inject: OrderedCollection new into:[:points :border | points union: border submorphs ]
]

{ #category : #'as yet unclassified' }
ConnectableBoundingBoxMorph >> connections [
	^self submorphs select:[:sub | sub isKindOf: ConnectionMorph ]
]

{ #category : #accessing }
ConnectableBoundingBoxMorph >> defaultColor [
	^Color veryLightGray 
]

{ #category : #accessing }
ConnectableBoundingBoxMorph >> delta [
	^ 10
]

{ #category : #'connection points' }
ConnectableBoundingBoxMorph >> initialize [ 
	super initialize.
	borderColor := Color gray.
	borders := OrderedCollection new.
	
	self addMorph: self leftBorder.
	self addMorph: self topBorder.
	self addMorph: self rightBorder.
	self addMorph: self bottomBorder.

]

{ #category : #borders }
ConnectableBoundingBoxMorph >> leftBorder [
	^self borders at: 4 ifAbsentPut:[self newVerticalBorder].
]

{ #category : #'as yet unclassified' }
ConnectableBoundingBoxMorph >> newHorizontalBorder [
	^ HorizontalConnectableBorderMorph new
]

{ #category : #'as yet unclassified' }
ConnectableBoundingBoxMorph >> newVerticalBorder [
	^ VerticalConnectableBorderMorph new 
]

{ #category : #'as yet unclassified' }
ConnectableBoundingBoxMorph >> noteNewOwner: aMorph [
	self updateLayout
		
]

{ #category : #updating }
ConnectableBoundingBoxMorph >> resetConnectionPoints [
	self borders do: #removeAllMorphs 
]

{ #category : #borders }
ConnectableBoundingBoxMorph >> rightBorder [
	^self borders at: 2 ifAbsentPut:[self newVerticalBorder].
]

{ #category : #borders }
ConnectableBoundingBoxMorph >> topBorder [
	^self borders at: 1 ifAbsentPut:[self newHorizontalBorder].
]

{ #category : #'as yet unclassified' }
ConnectableBoundingBoxMorph >> updateConnections [
	self borders do:[:border | border updateConnections]
]

{ #category : #'as yet unclassified' }
ConnectableBoundingBoxMorph >> updateLayout [
	self bounds: owner bounds.
	self borders do: #updateLayout.
	
	self leftBorder center: self leftCenter - (3 @ 0).
	self topBorder center: self topCenter "- (0 @ 2)". 
	self rightBorder center: self rightCenter - (3 @ 0).
	self bottomBorder center: self bottomCenter" - (0 @ 2)". 

	

]

{ #category : #'as yet unclassified' }
ConnectableBoundingBoxMorph >> updateView [
	self borders do: #updateView


]

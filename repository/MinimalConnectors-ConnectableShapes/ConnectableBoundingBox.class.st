"
A ConnectableBoundingBox is a bounding box with connection points for another morph that is going to be used as part of a graph or any diagram with connections between morphs (a class diagram, a sequence diagram, object diagram, etc)

"
Class {
	#name : #ConnectableBoundingBox,
	#superclass : #RectangleMorph,
	#instVars : [
		'leftBorder',
		'topBorder',
		'bottomBorder',
		'rightBorder'
	],
	#category : #'MinimalConnectors-ConnectableShapes'
}

{ #category : #'as yet unclassified' }
ConnectableBoundingBox >> addConnectionPoint: aConnectionPoint thatConnectsTo: aShape [
	(self connectionNear: aShape ) addMorph: aConnectionPoint .
	 
]

{ #category : #'as yet unclassified' }
ConnectableBoundingBox >> borders [
	^{self leftBorder . self bottomBorder . self rightBorder . self topBorder }

]

{ #category : #'as yet unclassified' }
ConnectableBoundingBox >> bottomBorder [
	^bottomBorder ifNil:[bottomBorder := self newHorizontalBorder].
]

{ #category : #'as yet unclassified' }
ConnectableBoundingBox >> bounds: bounds2 [
	
	super bounds: bounds2 
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
	
	self addMorph: self leftBorder.
	self addMorph: self topBorder.
	self addMorph: self rightBorder.
	self addMorph: self bottomBorder.

]

{ #category : #'as yet unclassified' }
ConnectableBoundingBox >> leftBorder [
	^leftBorder ifNil:[leftBorder:= self newVerticalBorder].
]

{ #category : #'as yet unclassified' }
ConnectableBoundingBox >> newBorder [
	^HorizontalConnectableBorder new 
		color: Color transparent ; 
		borderColor: Color transparent ;
		width: 1;
		layoutPolicy: TableLayout new;
		wrapCentering: #center;
		layoutInset: 0.
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

{ #category : #'as yet unclassified' }
ConnectableBoundingBox >> rightBorder [
	^rightBorder ifNil:[rightBorder:= self newVerticalBorder].
]

{ #category : #'as yet unclassified' }
ConnectableBoundingBox >> topBorder [
	^topBorder ifNil:[topBorder:= self newHorizontalBorder].
]

{ #category : #'as yet unclassified' }
ConnectableBoundingBox >> updateConnectionsLabel [ 
	self borders do:[:border | border updateConnectionsLabel ]
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

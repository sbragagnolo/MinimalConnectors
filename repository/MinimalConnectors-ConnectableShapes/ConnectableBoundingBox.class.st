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
	(owner connectionBorderNear: aShape ) addMorph: aConnectionPoint .
	 
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

{ #category : #'connection points' }
ConnectableBoundingBox >> connectionPoints [
	^self borders inject: OrderedCollection new into:[:points :border | points union: border submorphs ]
]

{ #category : #'as yet unclassified' }
ConnectableBoundingBox >> connections [
	^self submorphs select:[:sub | sub isKindOf: UMLConnection ]
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
		color: Color transparent;
		borderColor: Color transparent;
		width: 1;
		layoutPolicy: TableLayout new;
		layoutInset: 0;
		wrapCentering: #center;
		cellPositioning: #center;
		listCentering: #center;
		hResizing: #spaceFill;
		vResizing: #rigid
]

{ #category : #'as yet unclassified' }
ConnectableBoundingBox >> newVerticalBorder [
	^ (VerticalConnectableBorder new)
		color: Color transparent;
		borderColor: Color transparent;
		width: 1;
		layoutPolicy: TableLayout new;
		layoutInset: 0;
		listDirection: #topToBottom;
		wrapCentering: #center;
		cellPositioning: #center;
		listCentering: #center;
		hResizing: #rigid;
		vResizing: #spaceFill
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
ConnectableBoundingBox >> updateLayout [
	self bounds: owner bounds.

	self leftBorder center: self leftCenter - (3 @ 0).
	self topBorder center: self topCenter "- (0 @ 2)". 
	self rightBorder center: self rightCenter - (3 @ 0).
	self bottomBorder center: self bottomCenter" - (0 @ 2)". 

	self borders do: #updateLayout

]

{ #category : #'as yet unclassified' }
ConnectableBoundingBox >> updateView [
	self borders do: #updateView


]
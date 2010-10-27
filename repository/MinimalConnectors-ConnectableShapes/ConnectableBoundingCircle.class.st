Class {
	#name : #ConnectableBoundingCircle,
	#superclass : #Morph,
	#instVars : [
		'topPoint',
		'bottomPoint',
		'leftPoint',
		'rightPoint'
	],
	#category : #'MinimalConnectors-ConnectableShapes'
}

{ #category : #'as yet unclassified' }
ConnectableBoundingCircle >> addConnectionPoint: aConnectionPoint thatConnectsTo: aShape [
	(self connectionNear: aShape ) addMorph: aConnectionPoint .
	 
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircle >> bottomPoint [
	^bottomPoint ifNil:[bottomPoint:= ConnectablePoint new center: self bottomCenter]
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircle >> connectionNear: anotherClassBox [
	self top > anotherClassBox bottom ifTrue:[^self  topPoint].
	self bottom < anotherClassBox top ifTrue:[^self  bottomPoint].
	self left > anotherClassBox right ifTrue:[^self  leftPoint].
	self right < anotherClassBox left ifTrue:[^self  rightPoint].
	^self  leftPoint
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircle >> connections [
	^self submorphs select:[:sub | sub isKindOf: Connection ]
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircle >> initialize [ 
	super initialize.
	self color: Color transparent.
	self borderColor: Color black.
	
	self addMorph: self leftPoint.
	self addMorph: self rightPoint.
	self addMorph: self topPoint.
	self addMorph: self bottomPoint 
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircle >> leftPoint [
	^leftPoint ifNil:[leftPoint:= ConnectablePoint new center: self leftCenter]
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircle >> rightPoint [
	^rightPoint ifNil:[rightPoint:= ConnectablePoint new center: self rightCenter]
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircle >> topPoint [
	^topPoint ifNil:[topPoint:= ConnectablePoint new center: self topCenter]
]

{ #category : #'as yet unclassified' }
ConnectableBoundingCircle >> updateLayout [ 
	self bounds: owner bounds.
	self center: owner center.
	self leftPoint center: self leftCenter.
	self topPoint center: self topCenter.
	self bottomPoint center: self bottomCenter.
	self rightPoint center: self rightCenter .
]

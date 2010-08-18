Trait {
	#name : #TConnectableShape,
	#category : #'MinimalConnectors-ConnectableShapes'
}

{ #category : #'as yet unclassified' }
TConnectableShape >> connectTo: anotherBox using: aConnection [
	| origin destination |
	origin := SingleConnectionPoint new.
	destination := SingleConnectionPoint new.
	self connectableBoundingBox addConnectionPoint: origin thatConnectsTo: anotherBox.
	anotherBox connectableBoundingBox addConnectionPoint: destination thatConnectsTo:  self.
	aConnection from: origin to: destination.
	self connectableBoundingBox addMorph: aConnection.

]

{ #category : #'as yet unclassified' }
TConnectableShape >> connectableBoundingBox [
	"Each class using this trait should implement this method and very probably add an instance variable for storing a ConnectableBoundingBox instance"
	self shouldBeImplemented 
]

{ #category : #'as yet unclassified' }
TConnectableShape >> connectionBorderNear: anotherClassBox [
	self top > anotherClassBox bottom ifTrue:[^self connectableBoundingBox topBorder].
	self bottom < anotherClassBox top ifTrue:[^self connectableBoundingBox bottomBorder].
	self left > anotherClassBox right ifTrue:[^self connectableBoundingBox leftBorder].
	self right < anotherClassBox left ifTrue:[^self connectableBoundingBox rightBorder].
	^self connectableBoundingBox leftBorder

]

{ #category : #accessing }
TConnectableShape >> connections [ 
	^self connectableBoundingBox connections 
]

Trait {
	#name : #TConnectableShape,
	#category : #'MinimalConnectors-ConnectableShapes'
}

{ #category : #'as yet unclassified' }
TConnectableShape >> connectTo: anotherBox [ 
	self connectTo: anotherBox using: Connection new

]

{ #category : #'as yet unclassified' }
TConnectableShape >> connectTo: anotherBox using: aConnection [
	| origin destination |
	origin := SingleConnectionPoint new.
	destination := SingleConnectionPoint new.
	self connectableBounds addConnectionPoint: origin thatConnectsTo: anotherBox.
	anotherBox connectableBounds addConnectionPoint: destination thatConnectsTo:  self.
	aConnection from: origin to: destination.
	self connectableBounds addMorph: aConnection.

]

{ #category : #'as yet unclassified' }
TConnectableShape >> connectableBounds [
	"Each class using this trait should implement this method and very probably add an instance variable for storing a ConnectableBoundingBox instance"
	self shouldBeImplemented 
]

{ #category : #accessing }
TConnectableShape >> connections [ 
	^self connectableBounds connections 
]

{ #category : #'as yet unclassified' }
TConnectableShape >> handlesMouseDown: evt [
	^true
]

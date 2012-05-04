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
	self connectableBounds changed.
	anotherBox connectableBounds changed.

	self connectableBounds addMorph: aConnection  .
	anotherBox connectableBounds addMorph: aConnection.
	aConnection from: origin to: destination.
	self connectableBounds  updateView  .
	anotherBox connectableBounds  updateView.
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

{ #category : #'as yet unclassified' }
TConnectableShape >> justDroppedInto: aMorph event: anEvent [
	self diagramNode position: self position.
	self owner updateRelationships.

]

{ #category : #'as yet unclassified' }
TConnectableShape >> mouseDown: evt [
	self eventHandler mouseDown: evt
]

{ #category : #'as yet unclassified' }
TConnectableShape >> mouseMove: evt [
	self eventHandler handleMove: evt.
	
]

{ #category : #'as yet unclassified' }
TConnectableShape >> mouseUp: evt [
	self eventHandler stopHandleDrag: evt.
]

{ #category : #'as yet unclassified' }
TConnectableShape >> wantsToBeDroppedInto: aMorph [
	^aMorph isKindOf: DiagramWhiteboard 
]

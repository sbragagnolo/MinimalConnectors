Trait {
	#name : #TConnectableMorph,
	#category : #'MinimalConnectors-ConnectableShapes'
}

{ #category : #'as yet unclassified' }
TConnectableMorph >> connectTo: anotherBox [ 
	self connectTo: anotherBox using: ConnectionMorph defaultConnection

]

{ #category : #'as yet unclassified' }
TConnectableMorph >> connectTo: anotherBox using: aConnection [
	| origin destination |
	origin := SingleConnectionPointMorph new.
	destination := SingleConnectionPointMorph new.
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
TConnectableMorph >> connectableBounds [
	"Each class using this trait should implement this method and very probably add an instance variable for storing a ConnectableBoundingBox instance"
	self shouldBeImplemented 
]

{ #category : #accessing }
TConnectableMorph >> connections [ 
	^self connectableBounds connections 
]

{ #category : #'as yet unclassified' }
TConnectableMorph >> handlesMouseDown: evt [
	^true
]

{ #category : #'as yet unclassified' }
TConnectableMorph >> justDroppedInto: aMorph event: anEvent [
	self diagramNode position: self position.
	self owner updateRelationships.

]

{ #category : #'as yet unclassified' }
TConnectableMorph >> mouseDown: evt [
	self eventHandler mouseDown: evt
]

{ #category : #'as yet unclassified' }
TConnectableMorph >> mouseMove: evt [
	self eventHandler handleMove: evt.
	
]

{ #category : #'as yet unclassified' }
TConnectableMorph >> mouseUp: evt [
	self eventHandler stopHandleDrag: evt.
]

{ #category : #'as yet unclassified' }
TConnectableMorph >> wantsToBeDroppedInto: aMorph [
	^aMorph isKindOf: DiagramWhiteboard 
]

Class {
	#name : #DraggingEventHandler,
	#superclass : #Object,
	#instVars : [
		'passenger',
		'desiredPoint',
		'offset',
		'dragStartPoint'
	],
	#category : #'MinimalConnectors-ConnectableShapes'
}

{ #category : #'as yet unclassified' }
DraggingEventHandler >> handleMove: evt [
	| lastPoint |
	lastPoint := desiredPoint.
	desiredPoint := evt position + offset.
	lastPoint = desiredPoint ifTrue: [ ^self ].
	passenger position: desiredPoint .
]

{ #category : #'as yet unclassified' }
DraggingEventHandler >> mouseDown: evt [
	self startHandleDrag: evt.
]

{ #category : #accessing }
DraggingEventHandler >> passenger [
	^ passenger
]

{ #category : #accessing }
DraggingEventHandler >> passenger: anObject [
	passenger := anObject
]

{ #category : #'as yet unclassified' }
DraggingEventHandler >> startHandleDrag: evt [
	"evt hand newMouseFocus: self passenger."
	"passenger center: evt position."
	desiredPoint := passenger position..
	offset := desiredPoint - evt position.
	dragStartPoint := evt position.
	"self triggerEvent: #dragStart."
	
]

{ #category : #'as yet unclassified' }
DraggingEventHandler >> stopHandleDrag: evt [
	dragStartPoint := desiredPoint := nil.
	evt hand releaseMouseFocus: self passenger.
	"self passenger justDroppedInto: self passenger owner event: evt"
	"self triggerEvent: #dragStop."
]

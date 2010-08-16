Class {
	#name : #NCCurveHandleMorph,
	#superclass : #Morph,
	#instVars : [
		'dragStartPoint',
		'targetPoint',
		'desiredPoint',
		'getPoint',
		'setPoint',
		'offset'
	],
	#category : #'MinimalConnectors-CurvesAndArrows'
}

{ #category : #'event handling' }
NCCurveHandleMorph >> adjustCurve [
	| retval |
	retval := setPoint valueWithEnoughArguments: { desiredPoint }.
	targetPoint := getPoint value.
	^retval
]

{ #category : #accessing }
NCCurveHandleMorph >> dragStartPoint [
	^dragStartPoint
]

{ #category : #drawing }
NCCurveHandleMorph >> drawOn: aCanvas [
	aCanvas frameAndFillRectangle: self bounds
		fillColor: self fillStyle
		borderWidth: 1
		borderColor: self fillStyle asColor muchDarker
]

{ #category : #'event handling' }
NCCurveHandleMorph >> handleMove: evt [
	| lastPoint |
	lastPoint := desiredPoint.
	desiredPoint := evt position + offset.
	lastPoint = desiredPoint ifTrue: [ ^self ].
	self adjustCurve
		ifTrue: [ self center: evt position ]
		ifFalse: [ self stopHandleDrag: evt ].

]

{ #category : #initialization }
NCCurveHandleMorph >> initialize [
	super initialize.
	self extent: 10@10.
	offset := 0@0.
	self on: #mouseDown send: #startHandleDrag: to: self.
	self on: #mouseUp send: #stopHandleDrag: to: self.
	self on: #mouseMove send: #handleMove: to: self.
]

{ #category : #testing }
NCCurveHandleMorph >> isConnectable [
	^false

]

{ #category : #testing }
NCCurveHandleMorph >> isCurveHandle [
	^true
]

{ #category : #testing }
NCCurveHandleMorph >> isHandleMorph [
	^true
]

{ #category : #layers }
NCCurveHandleMorph >> morphicLayerNumber [
	^20
]

{ #category : #'event handling' }
NCCurveHandleMorph >> mouseUpEvent [
	"Synthesize a mouse up event for use by Players, etc."
	^MouseButtonEvent new setType: #mouseUp position: self center buttons: MouseEvent redButton hand: self world activeHand.
]

{ #category : #initialization }
NCCurveHandleMorph >> setPointSelector [
	^setPoint selector
]

{ #category : #initialization }
NCCurveHandleMorph >> setPointSelector: sel [
	setPoint selector: sel
]

{ #category : #'event handling' }
NCCurveHandleMorph >> startHandleDrag: evt [
	evt hand newMouseFocus: self.
	self center: evt position.
	desiredPoint := getPoint value.
	offset := desiredPoint - evt position.
	dragStartPoint := evt position.
	self triggerEvent: #dragStart.
	
]

{ #category : #'stepping and presenter' }
NCCurveHandleMorph >> step [
	| newCenter |
	dragStartPoint ifNotNil: [ ^self ].
	newCenter := getPoint value rounded.
	(self center ~= newCenter) ifTrue: [ self center: newCenter ].
]

{ #category : #'stepping and presenter' }
NCCurveHandleMorph >> stepTime [
	^100
]

{ #category : #'event handling' }
NCCurveHandleMorph >> stopHandleDrag: evt [
	dragStartPoint := desiredPoint := nil.
	evt hand releaseMouseFocus: self.
	self triggerEvent: #dragStop.
]

{ #category : #initialization }
NCCurveHandleMorph >> target [
	^getPoint receiver
]

{ #category : #initialization }
NCCurveHandleMorph >> target: aMorph arguments: args getPointSelector: getPointSel setPointSelector: setPointSel [
	getPoint := WeakMessageSend receiver: aMorph selector: getPointSel arguments: args.
	setPoint := WeakMessageSend receiver: aMorph selector: setPointSel arguments: args.
	targetPoint := nil.
	self center: getPoint value.
]

{ #category : #initialization }
NCCurveHandleMorph >> vertices [
	^getPoint arguments
]

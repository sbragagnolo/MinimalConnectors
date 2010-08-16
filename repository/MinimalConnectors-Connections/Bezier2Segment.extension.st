Extension { #name : #Bezier2Segment }

{ #category : #'*MinimalConnectors-Connections' }
Bezier2Segment >> controlPoints [
	^{start. via. end}
]

{ #category : #'*MinimalConnectors-Connections' }
Bezier2Segment >> controlPointsDo: aBlock [
	aBlock value: start; value: via; value: end
]

{ #category : #'*MinimalConnectors-Connections' }
Bezier2Segment >> intersectionsWithLineFrom: e1 to: e2 [
	"Answer the set of intersections, if any"
	| retval l i |
	retval := OrderedCollection new: 2.
	l := LineSegment from: e1 to: e2.
	self lineSegmentsDo: [ :p1 :p2 | | s |
		s := LineSegment from: p1 to: p2.
		i := s intersectionWith: l.
		i ifNotNil: [ retval add: i ].
		retval size = 2 ifTrue: [ ^retval asArray ].
	].
	^retval asArray
]

{ #category : #'*MinimalConnectors-Connections' }
Bezier2Segment >> lineSegmentsWithParametricValueDo: aBlock [
	"Evaluate aBlock with the receiver's line segments and the corresponding parametric values, ranging from just above 0 to 1.0"
	"Note: We could use forward differencing here."
	| steps last deltaStep t lastT next |
	steps := 1 max: (self length // 10). "Assume 10 pixels per step"
	last := start.
	deltaStep := 1.0 / steps asFloat.
	t := deltaStep.
	lastT := 0.0.
	1 to: steps do:[:i|
		next := self valueAt: t.
		aBlock value: last value: next value: lastT value: t.
		last := next.
		lastT := t.
		t := t + deltaStep].
]

{ #category : #'*MinimalConnectors-Connections' }
Bezier2Segment >> roundTo: quantum [
	super roundTo: quantum.
	via := via roundTo: quantum.

]

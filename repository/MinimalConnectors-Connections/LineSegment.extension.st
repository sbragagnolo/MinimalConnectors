Extension { #name : #LineSegment }

{ #category : #'*MinimalConnectors-Connections' }
LineSegment >> controlPoints [
	^{start. end}
]

{ #category : #'*MinimalConnectors-Connections' }
LineSegment >> controlPointsDo: aBlock [
	aBlock value: start; value: end
]

{ #category : #'*MinimalConnectors-Connections' }
LineSegment >> intersectionWith: anotherSegment [
	"Copied from LineIntersections>>intersectFrom:to:with:to:"
	| det deltaPt alpha beta pt1Dir pt2Dir |
	pt1Dir := end - start.
	pt2Dir := anotherSegment end - anotherSegment start.
	det := (pt1Dir x * pt2Dir y) - (pt1Dir y * pt2Dir x).
	deltaPt := anotherSegment start - start.
	alpha := (deltaPt x * pt2Dir y) - (deltaPt y * pt2Dir x).
	beta := (deltaPt x * pt1Dir y) - (deltaPt y * pt1Dir x).
	det = 0 ifTrue:[^nil]. "no intersection"
	alpha * det < 0 ifTrue:[^nil].
	beta * det < 0 ifTrue:[^nil].
	det > 0 
		ifTrue:[(alpha > det or:[beta > det]) ifTrue:[^nil]]
		ifFalse:[(alpha < det or:[beta < det]) ifTrue:[^nil]].
	"And compute intersection"
	^start + (alpha * pt1Dir / (det@det))
]

{ #category : #'*MinimalConnectors-Connections' }
LineSegment >> intersectionsWithLineFrom: e1 to: e2 [
	"Answer the set of intersections, if any"
	| intersection |
	intersection := self intersectionWith: (LineSegment from: e1 to: e2).
	^intersection ifNotNil: [ { intersection } ] ifNil: [ {} ].
]

{ #category : #'*MinimalConnectors-Connections' }
LineSegment >> lineSegmentsWithParametricValueDo: aBlock [
	"Evaluate aBlock with the receiver's line segments"
	aBlock value: start value: end value: 0.0 value: 1.0
]

{ #category : #'*MinimalConnectors-Connections' }
LineSegment >> roundTo: quantum [
	start := start roundTo: quantum.
	end := end roundTo: quantum.
]

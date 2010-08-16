Class {
	#name : #NCLineCurveInfo,
	#superclass : #Object,
	#instVars : [
		'line',
		'targetPoint',
		'segmentIndex',
		'closestPoint',
		'minDist',
		'minT'
	],
	#category : #'MinimalConnectors-CurvesAndArrows'
}

{ #category : #geometry }
NCLineCurveInfo >> bezierBorderPoints [
	| segOffs b1 b2 cpts |
	segOffs := segmentIndex - 1 * 3.
	cpts := line contours first.
	b1 := Bezier2Segment from: (cpts at: segOffs + 1)
		via: (cpts at: segOffs + 2)
		to: (cpts at: segOffs + 3).
	cpts := line contours third.
	segOffs := cpts size - segOffs.
	b2 := Bezier2Segment from: (cpts at: segOffs)
		via: (cpts at: segOffs - 1)
		to: (cpts at: segOffs - 2).
	^{ b2 valueAt: minT. b1 valueAt: minT }

]

{ #category : #geometry }
NCLineCurveInfo >> borderPoints [
	| segOffs b1 b2 cpts |
	line isCurve ifTrue: [ ^self bezierBorderPoints ].
	cpts := line contours first.
	b1 := LineSegment from: (cpts at: segmentIndex)
		to: (cpts at: segmentIndex + 1).
	cpts := line contours third.
	segOffs := cpts size - segmentIndex.
	b2 := LineSegment from: (cpts at: segOffs + 1)
		to: (cpts at: segOffs).
	^{ b2 valueAt: minT. b1 valueAt: minT }

]

{ #category : #geometry }
NCLineCurveInfo >> closestBigSegment [
	"Answer the starting index of the line's (big) segment nearest to aPoint"
	| bigSegment |
	line isCurve ifFalse: [ ^segmentIndex ].
	bigSegment := 1.
	1 to: segmentIndex do: [ :i |
		(line segments at: i) isBezier2Segment ifTrue: [
			bigSegment := bigSegment + 1.
			i = segmentIndex ifTrue: [ minT < 0.5 ifTrue: [ bigSegment := bigSegment - 1 ]].
		]].
	^bigSegment
]

{ #category : #accessing }
NCLineCurveInfo >> closestPoint [
	^closestPoint
]

{ #category : #accessing }
NCLineCurveInfo >> line [
	^line
]

{ #category : #initialization }
NCLineCurveInfo >> line: aNCLine targetPoint: tPoint segmentIndex: index closestPoint: cPoint minDist: mDist minT: mT [
	line:=aNCLine.
	targetPoint:=tPoint.
	segmentIndex:=index.
	closestPoint:=cPoint.
	minDist:=mDist.
	minT:=mT
]

{ #category : #accessing }
NCLineCurveInfo >> minDist [
	^minDist
]

{ #category : #accessing }
NCLineCurveInfo >> minT [
	^minT
]

{ #category : #accessing }
NCLineCurveInfo >> normal [
	^self tangent normal
]

{ #category : #geometry }
NCLineCurveInfo >> offset [
	"Answer the offset between the target and the point on the curve"
	^targetPoint - closestPoint
]

{ #category : #'as yet unclassified' }
NCLineCurveInfo >> printOn: aStream [
	aStream nextPutAll: 'NCLineCurveInfo(';
		print: line;
		nextPutAll: ' target='; print: (targetPoint truncateTo: 0.01);
		nextPutAll: ' seg='; print: segmentIndex;
		nextPutAll: ' closest='; print: (closestPoint truncateTo: 0.01);
		nextPutAll: ' minDist='; print: (minDist truncateTo: 0.01);
		nextPutAll: ' minT='; print: ( minT truncateTo: 0.01);
		nextPutAll: ')'
]

{ #category : #accessing }
NCLineCurveInfo >> segment [
	^line segments at: segmentIndex
]

{ #category : #accessing }
NCLineCurveInfo >> segmentIndex [
	^segmentIndex
]

{ #category : #accessing }
NCLineCurveInfo >> tangent [
	^(line segments at: segmentIndex) tangentAt: minT.
]

{ #category : #accessing }
NCLineCurveInfo >> targetPoint [
	^targetPoint
]

{ #category : #geometry }
NCLineCurveInfo >> vertexWithinProportion: proportion andDistance: dist [
	"Answer which vertex is within proportion of the current segment (0..1), if any, and also within dist pixels.
	Answer 0 if none."
	| seg |
	seg := line segments at: segmentIndex ifAbsent: [ ^0 ].
	line isCurve ifTrue: [
		seg isBezier2Segment ifFalse: [ ^0 ].
		^(((minT - 0.5) abs <= proportion) and: [ minDist <= dist ])
			ifTrue: [ ((line segments select: [ :ea | ea isBezier2Segment ]) indexOf: seg) + 1 ]
			ifFalse: [ 0 ].
	] ifFalse: [ | atBegin atEnd |
		atBegin :=  minT between: 0.0 and: proportion / 2.0.
		atEnd :=  minT between: (1.0 - (proportion / 2.0)) and: 1.0.
		^(atEnd | atBegin and: [ minDist <= dist ]) 
			ifTrue: [ segmentIndex + (atEnd ifTrue: [ 1 ] ifFalse: [ 0 ]) ]
			ifFalse: [ 0 ]
	]
]

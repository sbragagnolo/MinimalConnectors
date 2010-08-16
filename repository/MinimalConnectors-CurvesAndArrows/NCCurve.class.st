Class {
	#name : #NCCurve,
	#superclass : #Object,
	#instVars : [
		'contours',
		'bounds',
		'scale',
		'offset'
	],
	#category : #'MinimalConnectors-CurvesAndArrows'
}

{ #category : #'arrow forms' }
NCCurve class >> appleWithBite [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> basicArrow1 [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> basicArrow2 [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> doubleArrow [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> epsilonFork [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> filledCircle [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> fred [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> heavyDoubleArrow [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> junctionDot [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> noArrow [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> numeroDos [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> numeroUno [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> openArrow [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> openCircleWithPlus [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> openCircleWithSquareDot [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> openCircleWithX [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> openDiamond [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> pi [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> pointingHand [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> quadDiamond [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> roundFork [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> roundTrident [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> starInCircle [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> test2 [
	self subclassResponsibility
]

{ #category : #'arrow forms' }
NCCurve class >> thinDoubleArrow [
	self subclassResponsibility
]

{ #category : #'instance creation' }
NCCurve class >> withContours: anArray [
	"anArray is expected to have lists of points already scaled to fit in a unit box"
	^self new withContours: anArray
]

{ #category : #'arrow forms' }
NCCurve class >> zap [
	self subclassResponsibility
]

{ #category : #drawing }
NCCurve >> asFormWithExtent: extent depth: depth bgColor: bgColor fill: fillColor borderWidth: bw borderColor: bc [ 
	| canvas |
	canvas := BalloonCanvas extent: extent depth: depth.
	self drawOn: canvas
		in:  (Rectangle origin: 0@0 corner: extent)
		fill: fillColor
		borderWidth: bw
		borderColor: bc. 
	^canvas form
]

{ #category : #'accessing contours' }
NCCurve >> bezierSegments [
	^Array streamContents: [ :s | self bezierSegmentsDo: [ :seg | s nextPut: seg ]]
]

{ #category : #'accessing contours' }
NCCurve >> bezierSegmentsDo: aBlock [
	| seg |
	contours do: [ :c |
		1 to: c size by: 3 do: [ :i |
			seg := Bezier2Segment from: (c at: i) to: (c at: i + 2) via: (c at: i+1).
			aBlock value: seg ]]
]

{ #category : #'accessing contours' }
NCCurve >> bezierSegmentsTransformedBy: aTransform do: aBlock [
	| seg |
	contours do: [ :c |
		1 to: c size by: 3 do: [ :i |
			seg := Bezier2Segment from: (c at: i) to: (c at: i + 2) via: (c at: i+1).
			aBlock value: seg ]]
]

{ #category : #'accessing contours' }
NCCurve >> bezierSegmentsTransformedFor: aRectangle rotation: rotation do: aBlock [
	| transform seg c |
	transform := self transformForRect: aRectangle rotation: rotation.
	contours do: [ :ct |
		c := transform localPointsToGlobal: ct.
		1 to: c size by: 3 do: [ :i |
			seg := Bezier2Segment from: (c at: i) to: (c at: i + 2) via: (c at: i+1).
			aBlock value: seg ]]

]

{ #category : #'accessing contours' }
NCCurve >> boundingBox [
	"return my actual bounding box"
	| rect |
	rect := Rectangle encompassing: (Array streamContents: [ :s |
		self bezierSegmentsDo: [ :seg | seg lineSegmentsDo: [ :p1 :p2 | s nextPut: p1; nextPut: p2 ]]]).
	^rect
]

{ #category : #accessing }
NCCurve >> bounds [
	^bounds
]

{ #category : #accessing }
NCCurve >> bounds: aRectangle [
	self updateBounds.
	self scale: (self scale * ((aRectangle width / (bounds width max: 1)) @ (aRectangle height / (bounds height max: 1))))
]

{ #category : #'accessing contours' }
NCCurve >> contourPoints [
	"Answer my contours flattened as a series of points."
	^self contourPointsCollect: [ :ea | ea ].
]

{ #category : #'accessing contours' }
NCCurve >> contourPointsCollect: aBlock [ 
	^ Array
		streamContents: [:s | self contours
				do: [:c | c
						do: [:p | s
								nextPut: (aBlock value: p)]]]
]

{ #category : #'accessing contours' }
NCCurve >> contourPointsDo: aBlock [ 
	self contours do: [:c | c do: aBlock]
]

{ #category : #'accessing contours' }
NCCurve >> contourPointsTransformedBy: aTransform [
	^self contourPointsCollect: [ :p | aTransform transformPoint: p ].
]

{ #category : #accessing }
NCCurve >> contours [
	^contours
]

{ #category : #accessing }
NCCurve >> contours: anObject [
	contours := anObject
]

{ #category : #'accessing contours' }
NCCurve >> contoursTransformedFor: aRectangle rotation: rotation [
	| transform |
	transform := self transformForRect: aRectangle rotation: rotation.
	^contours collect: [ :c | transform localPointsToGlobal: c ]
]

{ #category : #'as yet unclassified' }
NCCurve >> curveInfoNearest: aPoint [ 
	"Answer the index of the segment nearest aPoint, along with the closest point, its distance, and the parametric value. "

	| closestPoint minDist minT segmentIndex i |
	closestPoint := minDist := nil.
	i := 0.
	self bezierSegmentsDo:  
			[:seg |
			i := i + 1. 
			seg lineSegmentsWithParametricValueDo: 
					[:p1 :p2 :t1 :t2 | 
					| curvePoint dist |
					curvePoint := aPoint nearestPointOnLineFrom: p1 to: p2.
					dist := curvePoint dist: aPoint.
					(closestPoint isNil or: [dist < minDist]) 
						ifTrue: 
							[closestPoint := curvePoint.
							minDist := dist.
							segmentIndex := i.
							minT := (p1 = p2) ifTrue: [ t1 ] ifFalse: [ t1 interpolateTo: t2 at: (curvePoint dist: p1) / (p1 dist: p2)] ]]].
	^{ closestPoint. segmentIndex. minDist. minT }
]

{ #category : #accessing }
NCCurve >> defaultScale: floatOrPoint [
	"scale me as indicated, then call my current scale the default"
	self scale: floatOrPoint; setAsDefaultScale.
]

{ #category : #drawing }
NCCurve >> drawOn: aCanvas fgColor: fgColor [ 
	| canvas |
	canvas := aCanvas asBalloonCanvas.
	canvas aaLevel: 4.
	canvas 
		drawGeneralBezierShape: self contours
		color: nil
		borderWidth: 1
		borderColor: fgColor.

]

{ #category : #drawing }
NCCurve >> drawOn: aCanvas in: aRectangle bgColor: bgColor fill: fillColor borderWidth: bw borderColor: bc [ 
	self drawOn: aCanvas in: aRectangle rotatedBy: 0.0 fill: fillColor borderWidth: bw borderColor: bc 
]

{ #category : #drawing }
NCCurve >> drawOn: aCanvas in: aRectangle fill: fillColor borderWidth: bw borderColor: bc [ 
	self drawOn: aCanvas in: aRectangle rotatedBy: 0.0 fill: fillColor borderWidth: bw borderColor: bc 
]

{ #category : #drawing }
NCCurve >> drawOn: aCanvas in: aRectangle rotatedBy: rotation fill: fillColor borderWidth: bw borderColor: bc [ 
	aCanvas
		drawGeneralBezierShape: (self contoursTransformedFor: aRectangle rotation: rotation)
		color: fillColor
		borderWidth: bw
		borderColor: bc
]

{ #category : #accessing }
NCCurve >> extent [
	^self bounds extent
]

{ #category : #accessing }
NCCurve >> extent: aPoint [ 
	self scale: self scale * (aPoint asFloatPoint / self bounds extent)
]

{ #category : #accessing }
NCCurve >> fixEndContours [
	self subclassResponsibility
]

{ #category : #accessing }
NCCurve >> offset [
	^offset ifNil: [ offset := 0.0 @ 0.0]
]

{ #category : #accessing }
NCCurve >> offset: aPoint [ 
	|countoursPlusDelta  newOffset delta |
	newOffset := aPoint asPoint asFloatPoint.
	delta := newOffset - self offset.
	countoursPlusDelta := self contours collect: [:eachArray | eachArray collect:[:each| each +  delta ] ]. 
	self contours: countoursPlusDelta.
	offset  := newOffset.
	self updateBounds
]

{ #category : #accessing }
NCCurve >> originalFirstContour [
	self subclassResponsibility
]

{ #category : #accessing }
NCCurve >> scale [
	^scale ifNil: [ scale := 1.0@1.0 ]
]

{ #category : #accessing }
NCCurve >> scale: aFloatOrPoint [ 
	| newScale ratio newOffset newCountours |
	newScale := (aFloatOrPoint asPoint asFloatPoint) max: 0.001 @ 0.001.
	newScale = scale ifTrue: [^self].
	ratio := newScale / scale.
	newOffset := self offset * ratio.
	newCountours := self contours collect: [:eachArray | eachArray collect: [:p | (p - self offset) * ratio + newOffset]]..
	self contours: newCountours.  
	scale := newScale.
	offset := newOffset.
	self updateBounds
]

{ #category : #accessing }
NCCurve >> setAsDefaultScale [
	"Call my current scale the default"
	scale := 1.0 @ 1.0
]

{ #category : #printing }
NCCurve >> storeOn: aStream [ 
	aStream
		nextPutAll: '((';
		nextPutAll: self class name;
		nextPutAll: ' withContours: ((Array new: ';
		print: self contours size;
		nextPutAll: ')'.
	self contours withIndexDo: 
			[:c :ci | 
			aStream
				cr;
				nextPutAll: 'at: ';
				print: ci;
				nextPutAll: ' put: '.
			(c collect: [:p | (p - self offset) / self scale roundTo: 0.001]) 
				storeOn: aStream.
			aStream nextPut: $;].
	aStream
		nextPutAll: ' yourself))';
		cr.
	aStream
		nextPutAll: 'scale: ';
		print: (self scale roundTo: 0.01);
		nextPutAll: ';';
		cr.
	aStream
		nextPutAll: 'offset: ';
		print: (self offset roundTo: 0.001);
		nextPutAll: ';';
		cr.
	aStream
		nextPutAll: 'yourself)';
		cr
]

{ #category : #drawing }
NCCurve >> transformForRect: outsideRect rotation: angle [ 
	| requiredScale newRect |
	newRect := self bounds scaleAndTranslateToFitInside: outsideRect.
	requiredScale := newRect extent asFloatPoint / self bounds extent.
	^((((MatrixTransform2x3 withOffset: outsideRect center) 
		composedWithLocal: (MatrixTransform2x3 withRotation: angle)) 
			composedWithLocal: (MatrixTransform2x3 withOffset: outsideRect extent / -2)) 
			composedWithLocal: (MatrixTransform2x3 withScale: requiredScale asPoint)) 
			composedWithLocal: (MatrixTransform2x3 
					withOffset: self bounds origin negated)
]

{ #category : #accessing }
NCCurve >> updateBounds [
	| boundsRect |
	boundsRect := self boundingBox.

	boundsRect width isZero 
		ifTrue: [boundsRect := boundsRect expandBy: (self scale x / 20.0) @ 0.0].
	boundsRect height isZero 
		ifTrue: [boundsRect := boundsRect expandBy: 0.0 @ (self scale y / 20.0)].

	bounds := boundsRect
]

{ #category : #'initialize-release' }
NCCurve >> withContours: anArray [
	scale := 1.0 @ 1.0.
	offset := 0.0 @ 0.0.
	self contours: (anArray collect: [:a | a collect: [:p | p asFloatPoint]]).
	self updateBounds
]

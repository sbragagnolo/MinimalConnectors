Class {
	#name : #Connection,
	#superclass : #ShapeMorph,
	#instVars : [
		'lineWidth',
		'smoothCurve',
		'vertices',
		'segments',
		'contours',
		'arrows',
		'arrowForms',
		'arrowScales',
		'arrowJoints',
		'connectionPoints',
		'type',
		'borderDashSpec',
		'connectionFactory'
	],
	#classVars : [
		'ArrowGlyphs'
	],
	#category : #'MinimalConnectors-Connections'
}

{ #category : #arrows }
Connection class >> arrowDictionary [
	^ArrowGlyphs ifNil: [
		ArrowGlyphs := Dictionary new.
		self initializeArrowDictionary ].
]

{ #category : #'arrow forms' }
Connection class >> basicArrow [
	^ NCLineArrowGlyph  basicArrow1  
]

{ #category : #arrows }
Connection class >> clearArrowDictionary [
	ArrowGlyphs ifNil: [ ^ArrowGlyphs := Dictionary new ].
	ArrowGlyphs keysAndValuesRemove: [ :k :v | true ];
		changed: #arrowsChanged.

]

{ #category : #'arrow forms' }
Connection class >> defaultArrow [
	^NCLineArrowGlyph noArrow
]

{ #category : #'instance creation' }
Connection class >> from: startConnectionPoint to: stopConnectionPoint [ 
	^self new from: startConnectionPoint to: stopConnectionPoint

]

{ #category : #'class initialization' }
Connection class >> initialize [
	self initializeArrowDictionary.
]

{ #category : #arrows }
Connection class >> initializeArrowDictionary [
	
	ArrowGlyphs ifNil: [ ArrowGlyphs := Dictionary new ].

	(self class organization listAtCategoryNamed: 'arrow forms') do: [ :sym |
		ArrowGlyphs at: sym put: (self perform: sym) ].

	(NCLineArrowGlyph class organization  listAtCategoryNamed: 'arrow forms') do: [ :sym |
		ArrowGlyphs at: sym put: (NCLineArrowGlyph perform: sym) ].
	
	ArrowGlyphs changed: #arrowsChanged.

	^ArrowGlyphs

]

{ #category : #arrows }
Connection class >> nameForArrowGlyph: anArrow [
	self arrowDictionary keysAndValuesDo: [ :key :value |
		anArrow originalFirstContour = value originalFirstContour
			ifTrue: [ ^key ].
	].
	^#unknown
]

{ #category : #'instance creation-UML' }
Connection class >> newAssociation [
	^self new
		name: 'Association'
]

{ #category : #'instance creation' }
Connection class >> newCurvyArrow [
	^ self new
		beSmoothCurve;
		name: 'Curvy ConnectorArrow';
		arrowNames: #(#noArrow #basicArrow )
]

{ #category : #'instance creation' }
Connection class >> newCurvyConnector [
	^ self new
		beSmoothCurve;
		name: 'Curvy Connector';
		arrowNames: #(#noArrow #noArrow )
]

{ #category : #'instance creation-UML' }
Connection class >> newDirectionalAssociation [
	^(self new)
		name: 'Association';
		arrowNames: #(noArrow umlArrow)
]

{ #category : #'instance creation-UML' }
Connection class >> newGeneralizationRelationship [

	^(self new) 
		arrowNames: #(noArrow openArrow);
		name: 'Generalization'
]

{ #category : #'instance creation-UML' }
Connection class >> newHierarchyAssociation [
	^(self new)
		name: 'Association';
		arrowNames: #(noArrow umlArrow)
]

{ #category : #'instance creation-UML' }
Connection class >> newImplementationRelationship [
	^self newGeneralizationRelationship
		dashedLine: true;
		name: 'Implements'
]

{ #category : #'instance creation-UML' }
Connection class >> newInheritanceAssociation [
	^(self new)
		name: 'Inheritance';
		arrowNames: #(noArrow umlArrow)
]

{ #category : #'instance creation-UML' }
Connection class >> newNoteConnector [
	^self new
		dashedLine: true;
		lineWidth: 1;
		name: 'Note Connector';
		connectToNearestPointToCenter.
]

{ #category : #'instance creation-UML' }
Connection class >> newStateTransition [
	^self new
		arrowNames: #(noArrow basicArrow);
		name: 'Transition'
]

{ #category : #'instance creation' }
Connection class >> newWithArrow [
	^ self new
		name: 'Arrow';
		arrowNames: #(#noArrow #basicArrow )
]

{ #category : #'arrow forms' }
Connection class >> noArrow [
	^NCLineArrowGlyph noArrow
]

{ #category : #'arrow forms' }
Connection class >> openArrow [
	^ NCLineArrowGlyph openArrow.
]

{ #category : #testing }
Connection class >> showSamples [
	"
	self showSamples
	"
	| pum line offset verts |
	pum := PasteUpMorph new bounds: (0@0 corner: 560@900).
	pum openInWorld.
	0 to: 10 do: [ :lw |
		0 to: 3 do: [ :bw |
			{true. false} do: [ :sc |
				offset := ((bw * 100) + 20) @ ((lw * 80) + 20).
				sc ifTrue: [ offset := offset + (0@ 40) ].
				verts := { offset . offset + (40@20). offset + (80@0) }.
				line := self vertices: verts
					lineWidth: (lw/4) + 0.25
					lineColor: Color blue
					borderStyle: (BorderStyle simple width:bw;color: Color black ).
				sc ifTrue: [ line beSmoothCurve ].
				pum addMorph: line
			]
		]
	]
		
]

{ #category : #'arrow forms' }
Connection class >> umlArrow [
	^ NCLineArrowGlyph umlArrow 
]

{ #category : #'instance creation' }
Connection class >> vertices: verts color: c borderStyle: aBorderStyle [ 
	^ self new vertices: verts color: c borderStyle: aBorderStyle 
]

{ #category : #'instance creation' }
Connection class >> vertices: verts lineWidth: w lineColor: c borderStyle: aBorderStyle [ 
	^ self new vertices: verts lineWidth: w lineColor: c borderStyle: aBorderStyle 
]

{ #category : #drawing }
Connection >> areasRemainingToFill: aRectangle [
	^ { aRectangle }
]

{ #category : #arrows }
Connection >> arrowContours [
	^{ contours fourth. contours second }
]

{ #category : #arrows }
Connection >> arrowForms [
	arrowForms ifNotNil: [ ^arrowForms ].
	arrowForms := self arrowContours withIndexCollect: [ :ac :aci | | form rect ext offset ji |
		rect := (Rectangle encompassing: ac) rounded.
		ext := rect extent max: 4@4.
		form := Form extent: rect extent depth: 1.
		ji := (arrows at: aci) joinIndex.
		((BalloonCanvas on: form) asShadowDrawingCanvas: Color black)
			transformBy: (MatrixTransform2x3 withOffset: rect origin negated)
			during: [ :canvas |
				canvas aaLevel: 4; deferred: true.
				canvas 
					drawGeneralBezierShape: { { ac at: ji. ac at: ji. ac first }. ac}
					color: Color black
					borderWidth: 1
					borderColor: Color black.
				canvas flush.
			].
		form offset: rect origin
	].
	^arrowForms
]

{ #category : #arrows }
Connection >> arrowJoints [
	^arrowJoints ifNil: [ arrowJoints := { vertices first. vertices last } ].
]

{ #category : #arrows }
Connection >> arrowNames: anArray [
	"anArray has the keys into my arrow dictionary for the desired arrows"
	self arrows: (anArray collect: [ :ea | self class arrowDictionary at: ea ifAbsent: [ nil ]])
]

{ #category : #arrows }
Connection >> arrowScales [
	"Answer the arrow scales relative to my linewidth"
	^arrowScales ifNil: [ { 1.0@1.0. 1.0@1.0 }].
]

{ #category : #arrows }
Connection >> arrowScales: aScalarOrArray [ 
	"Change the arrow scales relative to my linewidth"
	
	arrowScales := (aScalarOrArray isCollection
		ifFalse: [ Array new: 2 withAll: aScalarOrArray ]
		ifTrue: [ Array withAll: aScalarOrArray ]) replaceAll: 0.0 with: 0.00001.
	self arrows: self arrows.
]

{ #category : #arrows }
Connection >> arrowVertices [
	"Answer my vertices, but with the first and last point from arrowJoints"
	| retval |
	retval := vertices collect: [ :v | v asFloatPoint ].
	retval at: 1 put: self arrowJoints first.
	retval at: retval size put: self arrowJoints second.
	^retval
]

{ #category : #arrows }
Connection >> arrows [
	^arrows ifNil: [ arrows := self arrows: {nil. nil} ].
]

{ #category : #arrows }
Connection >> arrows: anArray [
	"Given a pair of NCLineArrowGlyph instances at any scale,
	scale them proportionally to my line width and save copies."
	| newArrows |
	newArrows := (anArray with: self arrowScales collect: [ :ea :scale | | arrow min |
		arrow := (ea ifNil: [ self class defaultArrow ]) veryDeepCopy.
		min := 2.0@2.0 / (arrow bounds extent  / arrow scale).
		arrow scale: ((scale asPoint * self fullLineWidth) max: min); yourself ]).
	arrowForms ifNotNilDo: [ :fs |
		fs do: [ :f | f ifNotNil: [ self invalidRect: (f offset extent: f extent) ] ]].
	arrows := newArrows.
	arrowForms := nil.
	self computeBounds.
	^arrows
]

{ #category : #'geometry testing' }
Connection >> arrowsContainPoint: aPoint [
	"Answer an Array of two Booleans that indicate whether the given point is inside either arrow"
	^self arrowForms collect: [:f | (f pixelValueAt: aPoint - f offset) > 0 ].

]

{ #category : #accessing }
Connection >> beSmoothCurve [
	self isCurve ifFalse: [
		smoothCurve := true.
		self computeBounds]
]

{ #category : #appearance }
Connection >> beSmoothCurve: aBoolean [
	aBoolean
		ifTrue: [ self beSmoothCurve ]
		ifFalse: [ self beStraightSegments ]

]

{ #category : #accessing }
Connection >> beStraightSegments [

	self isCurve ifTrue: [
		smoothCurve := false.
		self computeBounds]
]

{ #category : #'geometry-curves' }
Connection >> bezierPoints [
	"Answer nVertices*3 points that are the control points for my bezier curves."

	| pts i |
	pts := Array new: self segments size * 3.
	i := 1.
	self bezierSegmentsDo: 
			[:seg | 
			pts
				at: i put: seg start;
				at: i + 1 put: seg via;
				at: i + 2 put: seg end.
			i := i + 3].
	^pts
]

{ #category : #'geometry-curves' }
Connection >> bezierSegmentsDo: segmentBlock [ 
	"Emit a sequence of LineSegment subinstances into segmentBlock"
	self segmentsDo: [ :s | segmentBlock value: s asBezier2Segment ]
]

{ #category : #testing }
Connection >> canDrawBorder: aBorderStyle [
	^aBorderStyle style == #simple
]

{ #category : #'visual properties' }
Connection >> canHaveFillStyles [
	"Return true if the receiver can have general fill styles; not just colors.
	This method is for gradually converting old morphs."
	^true
]

{ #category : #accessing }
Connection >> close [ 
	connectionPoints do:[:each| each dettachFrom: self ].
	self delete.
]

{ #category : #'geometry testing' }
Connection >> closestPointTo: aPoint [
	| curveInfo |
	curveInfo := self curveInfoNearest: aPoint.
	^curveInfo closestPoint.
]

{ #category : #'geometry testing' }
Connection >> closestSegmentTo: aPoint [
	"Answer the starting index of my (big) segment nearest to aPoint"
	^(self curveInfoNearest: aPoint) closestBigSegment
]

{ #category : #geometry }
Connection >> computeBounds [
	| oldFullBounds oldBounds delta |
	vertices ifNil: [^self].
	oldFullBounds := (fullBounds ifNil: [bounds]) copy.
	contours := Array new: 4 withAll: #().
	self updateArrowContours.
	segments := self computeSegments.
	segments do: [:ea | ea roundTo: 0.001].
	arrowForms := nil.
	self computeContours.
	oldBounds := bounds.
	bounds := self curveBounds truncated.
	self arrowForms 
		do: [:af | bounds := bounds quickMerge: (af offset extent: af extent)].

	"since we are directly updating bounds,
	see if any ordinary submorphs exist and move them accordingly"
	submorphs isEmpty 
		ifFalse: 
			[(oldBounds notNil 
				and: [(delta := bounds origin - oldBounds origin) ~= (0 @ 0)]) 
					ifTrue: [self submorphsDo: [:each | each position: each position + delta]]].
	self invalidRect: oldFullBounds.
	self layoutChanged.
	self changed
]

{ #category : #'geometry-curves' }
Connection >> computeContours [
	| sides csize |
	(vertices size = 2 and: [vertices first = vertices second]) 
		ifTrue: [^contours := #()].
	true "(self lineWidth > 2 or: [self isCurve]) "
		ifTrue: [sides := self outsidePoints	"sideA, sideB reversed"]
		ifFalse: 
			[| bpts |
			bpts := self bezierPoints.
			sides := { 
						bpts.
						bpts reversed}].
	contours
		at: 1 put: sides first;
		at: 3 put: sides second.
	csize := contours first size.
	(contours at: 3)
		at: csize put: contours fourth first;
		at: 1 put: (contours second at: arrows second joinIndex).
	(contours at: 1)
		at: 1 put: (contours fourth at: arrows first joinIndex);
		at: csize put: contours second first.
	contours := contours collect: [ :ctr | ctr collect: [ :pt | pt roundTo: 0.001 ]].
	^contours
]

{ #category : #'geometry-curves' }
Connection >> computeSegments [
	| segs v3 l1 l2 m1 m2 lastUsed end arrowVertices |
	arrowVertices := self arrowVertices.
	arrowVertices size = 2 
		ifTrue: 
			[^{ LineSegment 
					from: arrowVertices first
					to: arrowVertices last }].

	smoothCurve ifFalse: [
		segs := Array new: arrowVertices size - 1.
		arrowVertices overlappingPairsWithIndexDo:  [ :v1 :v2 :i |
			segs at: i put: (LineSegment from: v1 to: v2)
		].
		^segs
	].

	segs := OrderedCollection new.
	lastUsed := arrowVertices first.
	2 to: arrowVertices size - 1 do:  [:i | | v2 symmetry |
			v2 := (arrowVertices at: i).
			v3 := (arrowVertices at: i + 1).
			l1 := lastUsed dist: v2.
			l2 := v2 dist: v3.
			symmetry := l1 - l2.
			symmetry < 0
				ifTrue: 
					[m1 := (lastUsed + v2) / 2.0.
					end := v2 interpolateTo: v3 at: l1 / l2 * 0.5.
					lastUsed ~= m1 
						ifTrue: 
							[segs add: (LineSegment 
										from: lastUsed
										to: m1)].
					segs add: (Bezier2Segment 
								from: m1
								to: end
								via: v2).
					lastUsed := end]
		ifFalse: [ m2 := (v2 + v3) / 2.0.
					end := v2 interpolateTo: lastUsed at: l2 / l1 * 0.5.
					lastUsed ~= end 
						ifTrue: 
							[segs add: (LineSegment 
										from: lastUsed
										to: end)].
					segs add: (Bezier2Segment 
								from: end
								to: m2
								via: v2).
					lastUsed := m2]
		].
	lastUsed ~= v3 
		ifTrue: 
			[segs add: (LineSegment 
						from: lastUsed
						to: v3)].
	^segs asArray 
]

{ #category : #editing }
Connection >> connectionFactory [
	^connectionFactory ifNil:[connectionFactory := ConnectionFactory new]
]

{ #category : #accessing }
Connection >> connectionFactory: anObject [
	^ connectionFactory := anObject
]

{ #category : #connecting }
Connection >> connectionPoints: aCollection [ 
	connectionPoints at: 1 put: aCollection first .
	connectionPoints at:2 put: aCollection second  .
]

{ #category : #'geometry testing' }
Connection >> containsPoint: aPoint [
	(super containsPoint: aPoint) ifFalse: [^ false].
	(self hasProperty: #errorOnDraw) ifTrue: [^true].
	
	(self arrowForms anySatisfy: [:f |
		 "(f pixelValueAt: aPoint - f offset) > 0"
		(Rectangle origin: f offset extent: f extent) containsPoint: aPoint
	 ])
		ifTrue: [^true ].

	self lineSegmentsDo:
		[:p1 :p2 |
		(aPoint onLineFrom: p1 to: p2 within: (10 max: (self fullLineWidth + 4) / 2))
				ifTrue: [^ true]].
			
	^ false
]

{ #category : #'geometry-curves' }
Connection >> contourPoints [
	"Answer my contours flattened as a series of points."

	^Array streamContents: [ :s |
		self contours do: [ :c | s nextPutAll: c ]]
]

{ #category : #'geometry-curves' }
Connection >> contours [
	contours ifNotNil: [^contours].
	(vertices size = 2 and: [vertices first = vertices second]) 
		ifTrue: [^contours := #()].
	self error: 'should be set'.
]

{ #category : #accessing }
Connection >> couldHaveRoundedCorners [
	^ false
]

{ #category : #geometry }
Connection >> curveBounds [

	^(Rectangle encompassing: self contourPoints)
		expandBy: (self borderWidth + 4.0)
]

{ #category : #editing }
Connection >> curveHandleClass [ 
	^self connectionFactory curveHandleClass 
]

{ #category : #'geometry testing' }
Connection >> curveInfoNearest: aPoint [ 
	"Answer the index of the segment nearest aPoint, along with the closest point, its distance, and the parametric value. "

	| closestPoint minDist minT segmentIndex |
	closestPoint := minDist := nil.
	self segments withIndexDo: 
			[:seg :i | 
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
	^NCLineCurveInfo new 
		line: self
		targetPoint: aPoint
		segmentIndex: segmentIndex
		closestPoint: closestPoint
		minDist: minDist
		minT: minT
]

{ #category : #editing }
Connection >> curveSegmentAt: n [ 
	^(self vertices at: n) + (self vertices at: (n + 1 min: vertices size)) / 2
]

{ #category : #editing }
Connection >> curveSegmentAt: n put: aPoint [
	| delta newVerts |
	(n between: 2 and: vertices size - 1) ifFalse: [ ^false ].
	delta := (self curveSegmentAt: n) - aPoint.
	newVerts := vertices copyFrom: n to: n + 1.
	delta := aPoint - newVerts average.
	newVerts := newVerts + delta.
	self setVertices: (vertices copyReplaceFrom: n to: n + 1 with: newVerts).
	^true

]

{ #category : #accessing }
Connection >> curveVertexAt: n [
	"Answer the point on the visible curve corresponding to the given vertex."
	| index seg |
	index := (n min: vertices size) max: 1.
	(smoothCurve not  or: [ index = 1 or: [ (index = vertices size) ]]) ifTrue: [ ^vertices at: index ].
	seg := (self segments select: [ :ea | ea isBezier2Segment ]) at: index - 1
		ifAbsent: [ ^vertices first ].
	^seg valueAt: (seg start dist: seg via) / seg length
]

{ #category : #editing }
Connection >> curveVertexAt: index put: aPoint [
	"Set the point on the visible curve corresponding to the given vertex."
	| seg error actual attempts |
	(index between: 1 and: vertices size) ifFalse: [ ^false ].
	(smoothCurve not  or: [ index = 1 or: [ (index = vertices size) ]])
		ifTrue: [ self verticesAt: index put: aPoint. ^true ].
	attempts := 0.
	[attempts < 10] whileTrue: [
		seg := (self segments select: [ :ea | ea isBezier2Segment ]) at: index - 1 ifAbsent: [ ^false ].
		actual := seg valueAt: (seg start dist: seg via) / seg length.
		error := aPoint - actual.
		error r < 1 ifTrue: [ ^true ].
		self verticesAt: index put: (vertices at: index) + error.
		attempts := attempts + 1.
	].
	^false
]

{ #category : #appearance }
Connection >> dashedBorder: dashed [
	borderDashSpec := dashed 
]

{ #category : #appearance }
Connection >> dashedLine: aBoolean [
	| dashed |
	aBoolean ifTrue: [ dashed := { self lineWidth * 4 . self lineWidth * 3 . Color transparent . 0} ].
	self dashedBorder: dashed.	
	
]

{ #category : #arrows }
Connection >> defaultArrow [
	^self connectionFactory defaultArrow
]

{ #category : #initialization }
Connection >> defaultBackgroundColor [
	^ Color black 
]

{ #category : #'visual properties' }
Connection >> defaultBitmapFillForm [
	^Imports default imports
		at: 'checker' ifAbsent: [ super defaultBitmapFillForm ]

]

{ #category : #appearance }
Connection >> doesBevels [
	^false
]

{ #category : #drawing }
Connection >> drawDashedBorderOn: aCanvas usingEnds: anArray [ 
	"Display my border on the canvas. NOTE: mostly copied from  
	drawBorderOn:"
	| bevel topLeftColor bottomRightColor bigClipRect lineColor segmentOffset |

	bevel := false.
	"Border colors for bevelled effects depend on CW ordering of  
	vertices"
	lineColor  == #raised
		ifTrue: [topLeftColor := color lighter.
			bottomRightColor := color darker.
			bevel := true].
	lineColor  == #inset
		ifTrue: [topLeftColor := owner colorForInsets darker.
			bottomRightColor := owner colorForInsets lighter.
			bevel := true].
	bigClipRect := aCanvas clipRect expandBy: self borderWidth + 1 // 2.
	segmentOffset := (borderDashSpec fourth) asFloat.
	self
		lineSegmentsDo: [:p1 :p2 | | p2i p1i | 
			
			p1i := p1 asIntegerPoint.
			p2i := p2 asIntegerPoint.
			lineColor := Color black.
					 aCanvas
								line: p1
								to: p2
								width: lineWidth 
								color: lineColor
								dashLength: borderDashSpec first
								secondColor: borderDashSpec third
								secondDashLength: borderDashSpec second
								startingOffset: segmentOffset]
]

{ #category : #drawing }
Connection >> drawOn: aCanvas [ 
	| ballonCanvas isShadow |
	ballonCanvas := aCanvas asBalloonCanvas.
	ballonCanvas
		aaLevel: 4;
		deferred: true.
	isShadow := aCanvas isShadowDrawing .
	smoothCurve 
		ifTrue: 
				[self 
					drawSmoothCurveOnAACanvas: ballonCanvas
					canvas: aCanvas
					isShadow: isShadow]
		ifFalse: 
				[self 
					drawSegmentedCurveOnAACanvas: ballonCanvas
					canvas: aCanvas
					isShadow: isShadow].
	ballonCanvas flush.
		
]

{ #category : #drawing }
Connection >> drawSegmentedCurveOnAACanvas: aaCanvas canvas: aCanvas isShadow: isShadow [ 
	| c bw bc |
	c := isShadow ifTrue: [aCanvas shadowColor] ifFalse: [self fillStyle].
	bw := self borderWidth.
	bc := isShadow ifTrue: [aCanvas shadowColor] ifFalse: [self borderColor].
	bw > (self lineWidth / 2) 
		ifTrue: 
			[c := nil.
			bw := (self lineWidth / 2) max: 1 ].
	self contours.
	(contours anySatisfy: [ :ctr | ctr isEmpty ]) ifTrue: [ ^self ].
	borderDashSpec ifNil:[aaCanvas 
		drawPolygon: contours first , contours third
		fillStyle: c
		borderWidth: bw
		borderColor: bc.]
	ifNotNil:[ self drawDashedBorderOn: aCanvas usingEnds: self vertices ].
	aaCanvas 
		drawGeneralBezierShape: { 
				contours second.
				{ 
					contours third first.
					contours third first.
					contours first last}.
				contours fourth.
				{ 
					contours first first.
					contours first first.
					contours third last}}
		color: c
		borderWidth: bw
		borderColor: bc.

	
]

{ #category : #drawing }
Connection >> drawSmoothCurveOnAACanvas: aaCanvas canvas: aCanvas isShadow: isShadow [ 
	aaCanvas 
		drawGeneralBezierShape: self contours
		color: (isShadow ifTrue: [aCanvas shadowColor] ifFalse: [self fillStyle])
		borderWidth: self borderWidth
		borderColor: (isShadow 
				ifTrue: [aCanvas shadowColor]
				ifFalse: [self borderColor])

]

{ #category : #geometry }
Connection >> extent: newExtent [ 
	"Not really advisable, but we can preserve most of the geometry if we don't
	shrink things too small."
	| safeExtent center |
	self changed.
	center := self referencePosition.
	safeExtent := newExtent max: 20@20.
	self setVertices: (vertices collect:
		[:p | p - center * (safeExtent asFloatPoint / (bounds extent max: 1@1)) + center])
]

{ #category : #accessing }
Connection >> firstVertex [
	^vertices first
]

{ #category : #connecting }
Connection >> from: origin to: destination [ 

	self vertices: {origin position . destination position}.
	origin attachTailOf: self .
	destination attachHeadOf: self. 
	self connectionPoints: {origin . destination }.
	self updateView.
]

{ #category : #geometry }
Connection >> fullBounds [
	^fullBounds ifNil: [
		self computeBounds.
		fullBounds := self outerBounds ].
]

{ #category : #arrows }
Connection >> fullLineWidth [
	| bw bc |
	bw := 0.
	bc := self borderColor. 
	bc isTransparent not ifTrue: [ bw := self borderWidth].
	^self lineWidth + (2 * bw) + 2
]

{ #category : #arrows }
Connection >> hasArrows [
	^(self arrows includes: nil) not
]

{ #category : #updating }
Connection >> hasMouseFocus [
	^ self activeHand mouseFocus = self 
]

{ #category : #accessing }
Connection >> headConnectionPoint [ 
	^ connectionPoints second 
	
]

{ #category : #'as yet unclassified' }
Connection >> headConnectionPointCenter [
	^self headConnectionPoint center 
]

{ #category : #'rotate scale' }
Connection >> heading: newHeading [
	"Set the receiver's heading (in eToy terms).
	Note that polygons never use flex shells."
	self rotationDegrees: newHeading.
]

{ #category : #'gaucho-created' }
Connection >> iconsSpecsOnClick [
	^ {'move'}
]

{ #category : #initialization }
Connection >> initialize [
	connectionPoints := Array new:2.
	smoothCurve := false.
	submorphs := #().
	bounds := 0@0 extent: 0@0.
	self vertices: (Array 
				with: 5 @ 0
				with: 200 @ 100
				with: 0 @ 200)
			lineWidth: 2
			lineColor: self defaultBackgroundColor  
			borderStyle: self defaultBorderStyle  .
	super initialize.
	self makeNoArrows.

]

{ #category : #geometry }
Connection >> innerBounds [
	^self bounds
]

{ #category : #editing }
Connection >> insertVertexAfterEndAt: position [
	"insert another vertex, before first"

	self setVertices: (self vertices copyWith: position) asArray.

]

{ #category : #editing }
Connection >> insertVertexBeforeStartAt: position [
	"insert another vertex, before first"

	self setVertices: ({ position }, self vertices) asArray.

]

{ #category : #editing }
Connection >> interiorCurveSegmentAt: n put: aPoint [
	^self curveSegmentAt: n put: aPoint

]

{ #category : #editing }
Connection >> interiorCurveVertexAt: index put: aPoint [
	(index = 1 or: [ index = vertices size ]) ifTrue: [ ^true ].
	^self curveVertexAt: index put: aPoint
]

{ #category : #'geometry testing' }
Connection >> intersectionsWith: aRectangle [
	"Answer a Set of points where the given Rectangle intersects with me.
	Ignores arrowForms."

	| retval |
	retval := IdentitySet new: 4.
	(self bounds intersects: aRectangle) ifFalse: [^ retval].

	self segmentsDo: [ :seg |
		aRectangle lineSegmentsDo: [ :rp1 :rp2 |
			retval addAll: (seg intersectionsWithLineFrom: rp1 to: rp2) ] ].

	^retval

]

{ #category : #accessing }
Connection >> isCurve [
	^smoothCurve ifNil: [ smoothCurve := false ]
]

{ #category : #accessing }
Connection >> lastVertex [
	^vertices last
]

{ #category : #'visual properties' }
Connection >> lineColor [

	^self fillStyle
]

{ #category : #'visual properties' }
Connection >> lineColor: newColor [
	self fillStyle: newColor

]

{ #category : #'geometry-curves' }
Connection >> lineSegments [
	| segs |
	segs := OrderedCollection new.
	self lineSegmentsDo: [ :p1 :p2 | segs add: (LineSegment from: p1 to: p2) ].
	^segs
]

{ #category : #'geometry-curves' }
Connection >> lineSegmentsDo: aBlock [
	self segmentsDo: [ :seg | seg lineSegmentsDo: aBlock ]
]

{ #category : #accessing }
Connection >> lineWidth [
	^lineWidth
]

{ #category : #accessing }
Connection >> lineWidth: aNumber [ 
	| ratio oldWidth |
	oldWidth := self fullLineWidth.
	lineWidth := aNumber.
	ratio := self fullLineWidth / oldWidth.
	self arrows do: [:a | a scale: (a scale * ratio) asPoint].
	self computeBounds
]

{ #category : #accessing }
Connection >> lostMouseFocus [
	| fillStyle |
	fillStyle  := self backgroundColor .
	self fillStyle:  fillStyle.

]

{ #category : #arrows }
Connection >> makeBackArrow [
	self arrowNames: #(basicArrow noArrow)
]

{ #category : #arrows }
Connection >> makeBothArrows [
	self arrowNames: #( basicArrow basicArrow)
]

{ #category : #arrows }
Connection >> makeForwardArrow [
	self arrowNames: #( noArrow basicArrow)
]

{ #category : #arrows }
Connection >> makeNoArrows [
	self arrowNames: #( noArrow noArrow)
]

{ #category : #geometry }
Connection >> midpoint [
	"Answer the midpoint along my segments"
	| middle |
	middle := 0.
	self lineSegmentsDo: [ :a :b | middle := middle + (a dist: b) ].
	middle < 2 ifTrue: [ ^ self center ].
	middle := middle / 2.
	self lineSegmentsDo: [ :a :b | | dist |
		dist := (a dist: b).
		middle < dist
			ifTrue: [ ^(a + ((b - a) * (middle / dist))) asIntegerPoint ].
		middle := middle - dist.
	].
	self error: 'can''t happen'
]

{ #category : #private }
Connection >> nextDuplicateVertexIndex [
	vertices
		doWithIndex: [:vert :index | ((index between: 2 and: vertices size - 1)
					and: [| epsilon v1 v2 | 
						v1 := vertices at: index - 1.
						v2 := vertices at: index + 1.
						epsilon := ((v1 x - v2 x) abs max: (v1 y - v2 y) abs)
									// 32 max: 1.
						vert
							onLineFrom: v1
							to: v2
							within: epsilon])
				ifTrue: [^ index]].
	^ 0
]

{ #category : #geometry }
Connection >> nextToFirstPoint [
	^vertices second
]

{ #category : #geometry }
Connection >> nextToLastPoint [
	^vertices at: vertices size - 1
]

{ #category : #accessing }
Connection >> oldBorderWidth: anInteger [ 
	| ratio newWidth oldWidth borderColor borderWidth |
	oldWidth := self fullLineWidth.
	anInteger > 0 ifTrue: [borderColor ifNil: [borderColor := Color black]].
	newWidth := ((anInteger max: 0) min: self lineWidth / 2) asInteger.
	borderWidth := newWidth.
	ratio := self fullLineWidth / oldWidth.
	self arrows do: [:a | a scale: (a scale * ratio) asPoint].
	self computeBounds
]

{ #category : #geometry }
Connection >> outerBounds [
	^self curveBounds
]

{ #category : #'geometry-curves' }
Connection >> outsideBezierPoints [
	"Answer the nVertices + 1 *6 points that are the boundary points for two sets of bezier curves that define my outer bounds."

	| npts a b halfWidth normal ptsA ptsB tan1 tan2 angle1 angle2 halfAngle midAngle r delta |
	npts := self segments size * 3.
	ptsA := Array new: npts.
	ptsB := Array new: npts.
	a := 1.
	b := npts.
	halfWidth := self lineWidth * 0.5.
	self segmentsDo: 
			[:seg | 
			tan1 ifNil: 
					[tan1 := seg tangentAtStart.
					tan1 isZero ifTrue: [tan1 := 0.0 @ 1.0]].
			angle1 := tan1 negated theta.
			tan2 := seg tangentAtEnd.
			tan2 isZero ifTrue: [tan2 := 0.0 @ 1.0].
			angle2 := tan2 theta.

			"from end"
			normal := tan1 normal * halfWidth.
			ptsA at: a put: seg start - normal.
			ptsB at: b put: seg start + normal.
			a := a + 1.
			b := b - 1.
			seg isBezier2Segment 
				ifTrue: 
					["via"

					halfAngle := (angle1 - angle2) / 2.0.
					halfAngle abs < 4.0e-5 ifTrue: [halfAngle := 4.0e-5].
					midAngle := angle2 + halfAngle.
					r := halfWidth / halfAngle sin.
					r := r min: halfWidth * 6.0 max: halfWidth * -6.0.
					delta := (r * midAngle cos) @ (r * midAngle sin).
					ptsA at: a put: seg via - delta.
					ptsB at: b put: seg via + delta.
					a := a + 1.
					b := b - 1].

			"to end"
			normal := tan2 normal * halfWidth.
			ptsA at: a put: seg end - normal.
			ptsB at: b put: seg end + normal.
			a := a + 1.
			b := b - 1.
			seg isBezier2Segment 
				ifFalse: 
					[ptsA at: a put: seg end - normal.
					ptsB at: b put: seg end + normal.
					a := a + 1.
					b := b - 1].
			tan1 := tan2].
	segments last isBezier2Segment 
		ifFalse: 
			[| csize |
			csize := ptsA size.
			ptsA at: csize - 1 put: (ptsA at: csize - 2).
			ptsB at: 2 put: (ptsB at: 3)].
	^{ 
		ptsA.
		ptsB}
]

{ #category : #'geometry-curves' }
Connection >> outsidePoints [
	"Answer the nVertices *2 points that are the boundary points for two sets of lines that define my outer bounds."

	| npts a b halfWidth normal ptsA ptsB tan1 tan2 angle1 angle2 halfAngle midAngle r delta arrowVertices |
	smoothCurve ifTrue: [^self outsideBezierPoints].
	arrowVertices := self arrowVertices.
	npts := arrowVertices size.
	ptsA := Array new: npts.
	ptsB := Array new: npts.
	a := 1.
	b := npts.
	halfWidth := self lineWidth * 0.5.
	2 to: arrowVertices size
		do: 
			[:i | 
			| v1 v2 v3 |
			v1 := arrowVertices at: i - 1.
			v2 := arrowVertices at: i.
			tan1 := v2 - v1.
			tan1 isZero 
				ifTrue: 
					[tan1 := i + 1 > arrowVertices size 
								ifTrue: [v2 - (arrowVertices at: i - 1)]
								ifFalse: [(arrowVertices at: i + 1) - v1]].

			tan1 isZero ifTrue: [ tan1 := 0.0 @ 1.0 ].

			angle1 := tan1 theta.

			"from end"
			a = 1 
				ifTrue: 
					[normal := tan1 normal * halfWidth.
					ptsA at: a put: v1 - normal.
					ptsB at: b put: v1 + normal.
					a := a + 1.
					b := b - 1].
			b = 1 
				ifTrue: 
					["to end"

					normal := tan1 normal * halfWidth.
					ptsA at: a put: v2 - normal.
					ptsB at: b put: v2 + normal.
					a := a + 1.
					b := b - 1]
				ifFalse: 
					[v3 := arrowVertices at: i + 1.
					tan2 := v2 - v3.
					angle2 := tan2 theta.

					"via"
					halfAngle := (angle1 - angle2) / 2.0.
					halfAngle abs < 0.004 ifTrue: [halfAngle := 0.004].
					midAngle := angle2 + halfAngle.
					r := halfWidth / halfAngle sin.
					r := r min: halfWidth * 6 max: halfWidth * -6.
					delta := (r * midAngle cos) @ (r * midAngle sin).
					ptsA at: a put: v2 + delta.
					ptsB at: b put: v2 - delta.
					a := a + 1.
					b := b - 1]].
	^{ 
		ptsA.
		ptsB}
]

{ #category : #private }
Connection >> privateMoveBy: delta [
	super privateMoveBy: delta.
	(self valueOfProperty: #referencePosition) ifNotNilDo:
		[:oldPos | self setProperty: #referencePosition toValue: oldPos + delta].
	self setVertices: (vertices collect: [:p | p + delta]).

]

{ #category : #geometry }
Connection >> reduceVertices [
	"Reduces the vertices size, when 3 vertices are on the same line with a 
	little epsilon. Based on code by Steffen Mueller"
	| dup |
	[ (dup := self nextDuplicateVertexIndex) > 0 ] whileTrue: [
		self setVertices: (vertices copyWithoutIndex: dup)
	].
	^vertices size.
]

{ #category : #'rotate scale' }
Connection >> referencePosition [ 
	"Return the current reference position of the receiver"
	^ self valueOfProperty: #referencePosition ifAbsent: [ self midpoint ]

]

{ #category : #geometry }
Connection >> removeShortEndSegmentsStepping: stepBlock [
	| v1 v2 n minLength |
	minLength := 30.
	
	(n := self vertices size) > 2 ifTrue: [
		stepBlock value.
		v1 := self vertexAt: 1.
		v2 := self vertexAt: 2.
		(v1 dist: v2) < minLength ifTrue: [ self removeVertex: v2 ].
	].
	(n := self vertices size) > 2 ifTrue: [
		stepBlock value.
		v1 := self vertexAt: n.
		v2 := self vertexAt: n-1.
		(v1 dist: v2) < minLength ifTrue: [ self removeVertex: v2 ].
	].
	self vertices size > 2 ifTrue: [ self reduceVertices ].
	stepBlock value.

]

{ #category : #editing }
Connection >> removeVertex: aVertex [
	^self setVertices: (self vertices copyWithout: aVertex)
]

{ #category : #'rotate scale' }
Connection >> rotationCenter [
	"Return the rotation center of the receiver. The rotation center defines the relative offset inside the receiver's bounds for locating the reference position."
	| refPos |
	refPos := self valueOfProperty: #referencePosition
		ifAbsent: [^ 0.5@0.5].
	^ (refPos - self bounds origin) / self bounds extent asFloatPoint
]

{ #category : #'rotate scale' }
Connection >> rotationCenter: aPointOrNil [
	"Set the new rotation center of the receiver. The rotation center defines the relative offset inside the receiver's bounds for locating the reference position."
	| box |
	aPointOrNil isNil
		ifTrue: [self removeProperty: #referencePosition]
		ifFalse: [box := self bounds.
				self setProperty: #referencePosition
					toValue: box origin + (aPointOrNil * box extent)]

]

{ #category : #'rotate scale' }
Connection >> rotationDegrees [

	^ self forwardDirection
]

{ #category : #'rotate scale' }
Connection >> rotationDegrees: degrees [ 
	| flex center |
	center := self referencePosition.
	flex := (MorphicTransform offset: center negated)
			withAngle: (degrees - self forwardDirection) degreesToRadians.
	self setVertices: (vertices collect: [:v | (flex transform: v) - flex offset]).
	self forwardDirection: degrees.


]

{ #category : #'rotate scale' }
Connection >> scale [
	^self valueOfProperty: #scaleFactor ifAbsent: [ 1.0 ]

]

{ #category : #'rotate scale' }
Connection >> scale: scaleFactor [ 
	| flex center ratio |
	ratio := self scaleFactor / scaleFactor.
	self lineWidth: self lineWidth / ratio.
	self borderWidth: self borderWidth / ratio.
	center := self referencePosition.
	flex := (MorphicTransform offset: center negated)
				withScale: ratio.
	self
		setVertices: (vertices
				collect: [:v | (flex transform: v)
						- flex offset]).
	super scale: scaleFactor.
]

{ #category : #accessing }
Connection >> segments [
	^segments ifNil: 
			[segments := self computeSegments segments do: [:ea | ea roundTo: 0.001]]
]

{ #category : #'geometry-curves' }
Connection >> segmentsDo: segmentBlock [ 
	"Emit a sequence of LineSegment subinstances into segmentBlock"

	self segments do: segmentBlock
]

{ #category : #editing }
Connection >> setVertices: newVertices [

	| proposedVertices |
	vertices = newVertices ifTrue: [ ^self ].

	proposedVertices := Array streamContents: [ :s |
		s nextPut: newVertices first asFloatPoint.
		newVertices overlappingPairsDo: [ :v1 :v2 |
			(v1 dist: v2) >= 2 ifTrue: [ s nextPut: v2 asFloatPoint ] ] ].
	
	proposedVertices := newVertices.
	
	proposedVertices size < 2 ifTrue: [ self error  ].

	proposedVertices size = 2 ifTrue: [
		(newVertices first dist: newVertices last) < 2 ifTrue: [
			proposedVertices := { newVertices first. newVertices first + (2@2) }] ].
	vertices = proposedVertices ifTrue: [ ^self ].
	vertices := proposedVertices.
	self computeBounds
]

{ #category : #editing }
Connection >> straighten [
	self setVertices: { vertices first . vertices last }
]

{ #category : #accessing }
Connection >> tailConnectionPoint [ 
	^ connectionPoints first  
	
]

{ #category : #accessing }
Connection >> tailConnectionPointCenter [
	^ self tailConnectionPoint center
	
]

{ #category : #connecting }
Connection >> to: destination [ 
	self from: self tailConnectionPoint  to: destination 
]

{ #category : #accessing }
Connection >> toggleSmoothing [

	smoothCurve := smoothCurve not.
	self computeBounds
]

{ #category : #accessing }
Connection >> totalLength [
	"Answer the full length of my segments. Can take a long time if I'm curved."
	^self segments detectSum: [ :seg | seg length ]
]

{ #category : #'rotate scale' }
Connection >> transformedBy: aTransform [
	self setVertices: (self vertices collect:[:v| aTransform localPointToGlobal: v])
]

{ #category : #accessing }
Connection >> unrotatedWidth [
	^self lineWidth
]

{ #category : #arrows }
Connection >> updateArrowContours [
	"Open the arrows for my line width.
	Set contours[2] and contours[4] with arrow contours.
	Put the arrow join points into arrowJoints."

	| transform lw |
	lw := (smoothCurve not and: [self lineWidth <= 0]) 
				ifTrue: [0]
				ifFalse: [self lineWidth].
	self arrows first openForLineWidth: lw.
	arrows second openForLineWidth: lw.
	transform := (MatrixTransform2x3 
				withAngle: (vertices second - vertices first) negated theta 
						radiansToDegrees + 90.0) 
					offset: vertices first.
	contours at: 4 put: (arrows first contourPointsTransformedBy: transform).
	self arrowJoints at: 1
		put: (transform transformPoint: arrows first joinPoint).
	transform := (MatrixTransform2x3 
				withAngle: (vertices last - vertices nextToLast) theta radiansToDegrees 
						+ 90.0) 
					offset: vertices last.
	contours at: 2 put: (arrows second contourPointsTransformedBy: transform).
	self arrowJoints at: 2
		put: (transform transformPoint: arrows second joinPoint)
]

{ #category : #'gaucho-created' }
Connection >> updateHeadVertex [
	self verticesAt: vertices size put: self headConnectionPointCenter .

]

{ #category : #'gaucho-created' }
Connection >> updateTailVertex [
	self verticesAt: 1 put: self tailConnectionPointCenter 
]

{ #category : #updating }
Connection >> updateView [ 
	self
		updateTailVertex ;
		updateHeadVertex;
		changed
]

{ #category : #accessing }
Connection >> vertexAt: n [
	^vertices at: (n min: vertices size).
]

{ #category : #drawing }
Connection >> vertexPairsDo: aBlock [ 
	"Emit pairs of start/end points into aBlock"
	vertices overlappingPairsDo: aBlock
]

{ #category : #accessing }
Connection >> vertices [
	^ vertices
]

{ #category : #accessing }
Connection >> vertices: anArray [ 
	self setVertices: anArray .
]

{ #category : #initialization }
Connection >> vertices: verts color: aColor borderStyle: aBorderStyle [ 
	lineWidth := aBorderStyle width .
	self setVertices: verts.
	self fillStyle: aColor.
	self borderStyle: aBorderStyle 
]

{ #category : #initialization }
Connection >> vertices: verts lineWidth: w lineColor: aColor borderStyle: aBorderStyle [ 
	lineWidth := w .
	self setVertices: verts.
	self fillStyle: aColor .
	self borderStyle: aBorderStyle 

]

{ #category : #editing }
Connection >> verticesAt: n put: newPoint [
	| index |
	index := (n min: vertices size) max: 1.
	self setVertices: (vertices copy at: index put: newPoint; yourself).

]

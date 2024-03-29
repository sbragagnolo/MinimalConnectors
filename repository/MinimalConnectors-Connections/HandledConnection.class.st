Class {
	#name : #HandledConnection,
	#superclass : #Connection,
	#instVars : [
		'handles'
	],
	#category : #'MinimalConnectors-Connections'
}

{ #category : #editing }
HandledConnection >> addHandles [
	self addAllMorphs: self handles
]

{ #category : #editing }
HandledConnection >> click: event [ 
	| clickedPosition clickedHandle endPointHandles headHandle tailHandle handleSpec handle epsilon |
	event hand mouseFocus ~= self ifTrue:[ ^ self ].
	clickedPosition := event position.
	endPointHandles := self endPointHandles .
	headHandle := endPointHandles second.
	tailHandle := endPointHandles first .
	epsilon := 13.
	( tailHandle notNil and:[ ( vertices first dist: clickedPosition) < epsilon ] ) ifTrue:[ self error  ].
	( headHandle notNil and:[ (vertices second dist: clickedPosition) < epsilon ] ) ifTrue:[
		handle := GMConnectionHandle fromSpec: headHandle  .
		handle connection: self.
		self pampas addMorph: handle.
		handle center: vertices second.
		handle mouseDown: event  ].
	
	

]

{ #category : #'event handling' }
HandledConnection >> dragHandleStarted: aConnectionHandle [ 
	self fillStyle: Color lightGray .
	
]

{ #category : #'event handling' }
HandledConnection >> dragHandleStoped: aGMConnectionHandle [ 
	| error |
	self flag:'solo tenemos herencia por ahora...por eso lo hardcodeo'.
	aGMConnectionHandle delete.
	aGMConnectionHandle isConnected ifTrue:[
		error := false.
		[ self tailConnectionPoint expanderShape changeSuperclassTo: aGMConnectionHandle connectionPoint expanderShape ] on: Error do:[:err| error := true. err pass   ].
		error not ifTrue:[ 	self to: aGMConnectionHandle connectionPoint] ].
	self fillStyle: self backgroundColor .
	
]

{ #category : #accessing }
HandledConnection >> endPointHandles [
	^ self valueOfProperty: #endPointHandles ifAbsentPut:[ #(nil nil)].
]

{ #category : #accessing }
HandledConnection >> endPointHandles: twoHandlesSpecs [
	self setProperty:#endPointHandles toValue: twoHandlesSpecs .
	
]

{ #category : #editing }
HandledConnection >> handleForEvent: anEvent [ 
	"Answer a NCCurveHandleMorph that can be used to adjust me at the 
	given point."
	^self handleForPosition: anEvent position addAllowed: anEvent shiftPressed
]

{ #category : #editing }
HandledConnection >> handleForPosition: pos addAllowed: canAddVertex [ 
	"Answer a NCCurveHandleMorph that can be used to adjust me at the 
	given point."

	| v s curveInfo |
	curveInfo := self curveInfoNearest: pos.
	v := curveInfo vertexWithinProportion: 0.15
				andDistance: (40 max: self lineWidth / 2 + self borderWidth + 2).
	s := curveInfo closestBigSegment.
	v isZero 
		ifTrue: 
			[(canAddVertex or: [s = 1 or: [s = (vertices size - 1)]]) 
				ifTrue: 
					["Make a new vertex to edit"

					v := s + 1.
					self setVertices: (self vertices 
								copyReplaceFrom: v
								to: v - 1
								with: (Array with: pos))]
				ifFalse: 
					[^self curveHandleClass new 
						target: self
						arguments: { 
								s}
						getPointSelector: #curveSegmentAt:
						setPointSelector: #curveSegmentAt:put:]].
	^self curveHandleClass new 
		target: self
		arguments: { 
				v}
		getPointSelector: #curveVertexAt:
		setPointSelector: #curveVertexAt:put:
]

{ #category : #arrows }
HandledConnection >> handles [
	"Answer a collection of NCCurveHandleMorphs that can be used to adjust my vertices"
	| handles |
	handles := submorphs select: [ :ea | ea isCurveHandle ].
	handles size = vertices size ifTrue: [ ^handles ].

	^(1 to: vertices size) collect: [ :v |
		NCCurveHandleMorph new 
		target: self
		arguments: {  v}
		getPointSelector: #curveVertexAt:
		setPointSelector: #curveVertexAt:put:
		]
]

{ #category : #'as yet unclassified' }
HandledConnection >> initialize [
	super initialize.
	self connectionFactory: HandledConnectionFactory new.
]

{ #category : #initialization }
HandledConnection >> initializeInteraction [ 
	self addInteraction .
	self eventHandler addWindowKeyboardInteraction   .
]

{ #category : #editing }
HandledConnection >> interiorHandleForEvent: anEvent [ 
	"Answer a NCCurveHandleMorph that can be used to adjust me at the 
	given point."
	^self interiorHandleForPosition: anEvent position addAllowed: anEvent shiftPressed
]

{ #category : #editing }
HandledConnection >> interiorHandleForPosition: pos addAllowed: canAddVertex [ 
	| handle sel |
	handle := self handleForPosition: pos addAllowed: canAddVertex.
	sel := handle setPointSelector.
	handle setPointSelector: ('interiorC', (sel allButFirst)) asSymbol.
	^handle

]

{ #category : #editing }
HandledConnection >> removeHandles [
	| handles |
	handles := submorphs select: [ :ea | ea isCurveHandle ].
	self removeAllMorphsIn:  handles.
]

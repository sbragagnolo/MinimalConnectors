Class {
	#name : #SingleConnectionPointMorph,
	#superclass : #BorderedMorph,
	#instVars : [
		'outConnections',
		'inConnections'
	],
	#category : #'MinimalConnectors-Connections'
}

{ #category : #private }
SingleConnectionPointMorph >> attachHeadOf: aConnector [ 
	(inConnections includes: aConnector) ifFalse:[ inConnections add: aConnector ].
]

{ #category : #private }
SingleConnectionPointMorph >> attachTailOf: aConnector [
	(outConnections includes: aConnector) ifFalse:[outConnections add: aConnector ].
]

{ #category : #accessing }
SingleConnectionPointMorph >> close [ 
	inConnections copy do:#close.
	outConnections copy do:#close.

]

{ #category : #accessing }
SingleConnectionPointMorph >> connectTo: anotherConnectionPoint [
	| connector |
	connector := self connectionClass from: self to: anotherConnectionPoint.
	^ connector 
]

{ #category : #accessing }
SingleConnectionPointMorph >> connection [
"This point will always have only one connection, refactors are still pending"
	^ self connections anyOne
]

{ #category : #private }
SingleConnectionPointMorph >> connectionClass [
	^self factory connectionClass
]

{ #category : #private }
SingleConnectionPointMorph >> connectionIndexOf: aConnection [
	^(self connections includes: aConnection) 
		ifTrue:[(self connections indexOf: aConnection) -1]
]

{ #category : #accessing }
SingleConnectionPointMorph >> connections [
	^ inConnections , outConnections 
]

{ #category : #accessing }
SingleConnectionPointMorph >> connectionsSize [
	^self connections size
]

{ #category : #initialization }
SingleConnectionPointMorph >> defaultBorderColor [
	^Color transparent 
]

{ #category : #'visual properties' }
SingleConnectionPointMorph >> defaultColor [
	^Color transparent  
]

{ #category : #private }
SingleConnectionPointMorph >> delta [
	^"owner delta"10
]

{ #category : #accessing }
SingleConnectionPointMorph >> dettachFrom: aConnector [ 
	|formerOwner|
	inConnections remove: aConnector ifAbsent:[ ].
	outConnections remove: aConnector ifAbsent:[].
	formerOwner := owner.
	"owner removeMorph: self."
	"formerOwner owner updateLayout."
]

{ #category : #support }
SingleConnectionPointMorph >> factory [
	^UMLFactory new
]

{ #category : #testing }
SingleConnectionPointMorph >> hasConnections [
	^ ( inConnections isEmpty and:[ outConnections isEmpty ] ) not
]

{ #category : #accessing }
SingleConnectionPointMorph >> inConnections [
	^ inConnections 
]

{ #category : #initialization }
SingleConnectionPointMorph >> initialBounds [
	^ 0@0 extent: 5@5.
]

{ #category : #initialization }
SingleConnectionPointMorph >> initialize [ 
	super initialize .
	inConnections := OrderedCollection new.
	outConnections := OrderedCollection new.
	self bounds: self initialBounds.
	
]

{ #category : #accessing }
SingleConnectionPointMorph >> oppositeConnectionPoint [
	^self connection connectionPoints detect:[:cp | cp ~= self]
]

{ #category : #accessing }
SingleConnectionPointMorph >> outConnections [
	^ outConnections 
]

{ #category : #updating }
SingleConnectionPointMorph >> updateConnections [ 
	"inConnections do:[:each| each updateHeadVertex ].
	outConnections do:[:each| each updateTailVertex ]."
	self connections do:[:conn | conn  updateView; updateLabel]
	 
]

{ #category : #updating }
SingleConnectionPointMorph >> updateConnectionsLabel [
	self connections do:[:conn | conn  updateLabel.]
]

{ #category : #updating }
SingleConnectionPointMorph >> updateFillStyle [ 
	self fillStyle: Color transparent 
	

]

{ #category : #updating }
SingleConnectionPointMorph >> updateView [ 
	self
		updateFillStyle ;
		updateConnections.

]

{ #category : #accessing }
SingleConnectionPointMorph >> visible: aBoolean [ 
	super visible: aBoolean .
	outConnections do:[:each| each visible: aBoolean ].
	inConnections do:[:each| each visible: aBoolean  ].

]

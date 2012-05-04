Class {
	#name : #SingleConnectionPoint,
	#superclass : #Morph,
	#instVars : [
		'outConnections',
		'inConnections'
	],
	#category : #'MinimalConnectors-Connections'
}

{ #category : #'as yet unclassified' }
SingleConnectionPoint >> attachHeadOf: aConnector [ 
	(inConnections includes: aConnector) ifFalse:[ inConnections add: aConnector ].
]

{ #category : #'as yet unclassified' }
SingleConnectionPoint >> attachTailOf: aConnector [
	(outConnections includes: aConnector) ifFalse:[outConnections add: aConnector ].
]

{ #category : #accessing }
SingleConnectionPoint >> borderColor [
	^Color transparent 
]

{ #category : #accessing }
SingleConnectionPoint >> close [ 
	inConnections copy do:#close.
	outConnections copy do:#close.

]

{ #category : #accessing }
SingleConnectionPoint >> connectTo: anotherConnectionPoint [
	| connector |
	connector := self connectionClass from: self to: anotherConnectionPoint.
	^ connector 
]

{ #category : #accessing }
SingleConnectionPoint >> connection [
"This point will always have only one connection, refactors are still pending"
	^ self connections anyOne
]

{ #category : #'as yet unclassified' }
SingleConnectionPoint >> connectionClass [
	^self factory connectionClass
]

{ #category : #'as yet unclassified' }
SingleConnectionPoint >> connectionIndexOf: aConnection [
	^(self connections includes: aConnection) 
		ifTrue:[(self connections indexOf: aConnection) -1]
]

{ #category : #accessing }
SingleConnectionPoint >> connections [
	^ inConnections , outConnections 
]

{ #category : #accessing }
SingleConnectionPoint >> connectionsSize [
	^self connections size
]

{ #category : #defaults }
SingleConnectionPoint >> defaultBorderStyle [ 
	^ BorderStyle simple width: 1 ; color: self borderColor  .
]

{ #category : #accessing }
SingleConnectionPoint >> delta [
	^"owner delta"10
]

{ #category : #'as yet unclassified' }
SingleConnectionPoint >> dettachFrom: aConnector [ 
	|formerOwner|
	inConnections remove: aConnector ifAbsent:[ ].
	outConnections remove: aConnector ifAbsent:[].
	formerOwner := owner.
	"owner removeMorph: self."
	"formerOwner owner updateLayout."
]

{ #category : #support }
SingleConnectionPoint >> factory [
	^UMLFactory new
]

{ #category : #'visual properties' }
SingleConnectionPoint >> fillStyle [
	^Color transparent  
]

{ #category : #testing }
SingleConnectionPoint >> hasConnections [
	^ ( inConnections isEmpty and:[ outConnections isEmpty ] ) not
]

{ #category : #accessing }
SingleConnectionPoint >> inConnections [
	^ inConnections 
]

{ #category : #accessing }
SingleConnectionPoint >> initialBounds [
	^ 0@0 extent: 5@5.
]

{ #category : #initialization }
SingleConnectionPoint >> initialize [ 
	super initialize .
	inConnections := OrderedCollection new.
	outConnections := OrderedCollection new.
	self bounds: self initialBounds.
	
]

{ #category : #'as yet unclassified' }
SingleConnectionPoint >> oppositeConnectionPoint [
	^self connection connectionPoints detect:[:cp | cp ~= self]
]

{ #category : #accessing }
SingleConnectionPoint >> outConnections [
	^ outConnections 
]

{ #category : #'as yet unclassified' }
SingleConnectionPoint >> updateConnections [ 
	"inConnections do:[:each| each updateHeadVertex ].
	outConnections do:[:each| each updateTailVertex ]."
	self connections do:[:conn | conn  updateView; updateLabel]
	 
]

{ #category : #updating }
SingleConnectionPoint >> updateConnectionsLabel [
	self connections do:[:conn | conn  updateLabel.]
]

{ #category : #'as yet unclassified' }
SingleConnectionPoint >> updateFillStyle [ 
	self fillStyle: Color transparent 
	

]

{ #category : #updating }
SingleConnectionPoint >> updateView [ 
	self
		updateFillStyle ;
		updateConnections.

]

{ #category : #'as yet unclassified' }
SingleConnectionPoint >> visible: aBoolean [ 
	super visible: aBoolean .
	outConnections do:[:each| each visible: aBoolean ].
	inConnections do:[:each| each visible: aBoolean  ].

]

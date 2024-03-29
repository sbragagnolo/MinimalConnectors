Class {
	#name : #DiagramWhiteboard,
	#superclass : #Morph,
	#instVars : [
		'model',
		'diagramNodes'
	],
	#category : #'MinimalConnectors-Connections'
}

{ #category : #accessing }
DiagramWhiteboard >> allConnectedMorphs [
	^self diagramNodeMorphs
]

{ #category : #accessing }
DiagramWhiteboard >> allConnections [
	^self connections
]

{ #category : #positioning }
DiagramWhiteboard >> availablePositions [
	^ (self positionedDiagramNodes 
		ifEmpty: [ Set with: "self center" 50@50 ] 
		ifNotEmpty: [self positionedDiagramNodes	inject: OrderedCollection new into:[:points :node | points union: (self neighborsFor: node position) ]
			])
			 select:[:point | self diagramNodes allSatisfy: [:node | node position ~= point]]
]

{ #category : #'as yet unclassified' }
DiagramWhiteboard >> connections [
	^self submorphs inject: OrderedCollection new into:[:rels :box | rels union: box connections ].
]

{ #category : #'as yet unclassified' }
DiagramWhiteboard >> diagram [
	^self model
]

{ #category : #accessing }
DiagramWhiteboard >> diagramNodeMorphFor: aDiagramNodeDescription [
	^diagramNodes at: aDiagramNodeDescription ifAbsentPut: [aDiagramNodeDescription view]
]

{ #category : #accessing }
DiagramWhiteboard >> diagramNodeMorphs [
	^ self diagramNodes collect:[:boxDesc | (self diagramNodeMorphFor: boxDesc) "diagramNode: boxDesc"  ]
]

{ #category : #accessing }
DiagramWhiteboard >> diagramNodes [
	^self model diagramNodes
]

{ #category : #accessing }
DiagramWhiteboard >> displayString [
	^self name
]

{ #category : #'as yet unclassified' }
DiagramWhiteboard >> initialize [
	super initialize.
	self fillStyle: Color white.
	self dropEnabled: true.
	self extent: 500@500.
	self clipSubmorphs: false.
]

{ #category : #'as yet unclassified' }
DiagramWhiteboard >> model [ 
	^model 
]

{ #category : #'as yet unclassified' }
DiagramWhiteboard >> model: anObject [
	model := anObject.
	model ifNotNil: [
		self diagram removeDependent: self.].
	anObject ifNotNil: [
		self diagram addDependent: self. ].
	diagramNodes := Dictionary new.


]

{ #category : #positioning }
DiagramWhiteboard >> neighborsFor: aPoint [ 
|delta|
delta := 150.

	^ (Array with: aPoint + (delta @ 0)
		with: aPoint + (0 @ delta)
		with: aPoint - (delta @ 0)
		with: aPoint - (0 @ delta)) select:[:point | self containsPoint: point + self position]

]

{ #category : #'as yet unclassified' }
DiagramWhiteboard >> positionDiagramNodes [
|bannedPositions|
bannedPositions := Set new.
	self diagramNodes do:[:node |
		node position ifNil:[
			self positionNode: node.
"			[((self positionedDiagramNodes reject:[:n | n = node]) anySatisfy: [:n| n view intersects: node view bounds])] whileTrue:
				[bannedPositions add: node position.
						self positionNode: node]"]]
]

{ #category : #positioning }
DiagramWhiteboard >> positionNode: aNode [
	aNode position: self availablePositions anyOne.
]

{ #category : #positioning }
DiagramWhiteboard >> positionedDiagramNodes [
	^self diagramNodes select:[:node | node position notNil]
]

{ #category : #'as yet unclassified' }
DiagramWhiteboard >> update [
	self removeAllMorphs.
	diagramNodes := Dictionary new.
	self positionDiagramNodes.
	self diagramNodeMorphs" do: [:classBoxMorph | classBoxMorph updateRelationships  ]".
	diagramNodes keysAndValuesDo: [:classBoxDescription :classBoxMorph | 
		(classBoxDescription relations" difference: classBoxMorph connections") do:[:relation | 
			relation view fitIntoDiagram:self ]].

	self addAllMorphs: (self diagramNodeMorphs difference: submorphs ). 
	self diagramNodeMorphs do: #adjustPosition.
	
	self diagramNodeMorphs do: [:classBoxMorph | classBoxMorph updateBounds  ].
	self bounds: self fullBounds.
	self position: 0@0.
	self connections do: #updateView.
	self connections do: #updateLabel.
	"owner ifNil:[self bounds: self fullBounds] ifNotNil:[self bounds: owner bounds].
"
	
]

{ #category : #'as yet unclassified' }
DiagramWhiteboard >> update: aParameter [
	(aParameter == #view) 
		ifTrue:[self update.].

]

{ #category : #'as yet unclassified' }
DiagramWhiteboard >> updateDescriptionCode [ 
	self model update: #descriptionCode.
]

{ #category : #'as yet unclassified' }
DiagramWhiteboard >> updateRelationships [
		
		self diagramNodeMorphs do: #resetBoundings.
		self connections do:[:rel | rel fitIntoDiagram: self].
		self diagramNodeMorphs do: #updateBounds.
]

Class {
	#name : #ConnectableShapesDocumentation,
	#superclass : #CategoryDiagramsHolder,
	#category : #'MinimalConnectors-ConnectableShapes'
}

{ #category : #diagrams }
ConnectableShapesDocumentation >> blah [
	| d |
	d := ClassDiagram new name: 'blah'.
	^ d
]

{ #category : #diagrams }
ConnectableShapesDocumentation >> lala [
	| d |
	d := ClassDiagram new name: 'Lala'.
	^ d
]

Class {
	#name : #ShapeMorph,
	#superclass : #Morph,
	#instVars : [
		'target'
	],
	#category : #'MinimalConnectors-ConnectableShapes'
}

{ #category : #'as yet unclassified' }
ShapeMorph >> defaultBackgroundColor [
	^ Color white
]

{ #category : #'as yet unclassified' }
ShapeMorph >> defaultBorderStyle [
	| bs |
	bs := BorderStyle simple.
	bs
		color: Color black;
		width: 1.
	^ bs	
]

{ #category : #accessing }
ShapeMorph >> target [
	^ target
]

{ #category : #accessing }
ShapeMorph >> target: aModelOrView [
	target := aModelOrView 
]

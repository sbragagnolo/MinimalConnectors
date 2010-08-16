Class {
	#name : #VerticalConnectableBorder,
	#superclass : #ConnectableBorder,
	#category : #'MinimalConnectors-ConnectableShapes'
}

{ #category : #'as yet unclassified' }
VerticalConnectableBorder >> updateLayout [
	self height: owner height.
	
]

{ #category : #'as yet unclassified' }
VerticalConnectableBorder >> updateView [
	self comeToFront.
	self cellInset: (self height / (self submorphs size + 1)).
	self sortSubmorphsBy: [:s1 :s2 | s1 oppositeConnectionPoint top > s2 oppositeConnectionPoint top ]
]

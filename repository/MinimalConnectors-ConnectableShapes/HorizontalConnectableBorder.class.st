Class {
	#name : #HorizontalConnectableBorder,
	#superclass : #ConnectableBorder,
	#category : #'MinimalConnectors-ConnectableShapes'
}

{ #category : #'as yet unclassified' }
HorizontalConnectableBorder >> updateLayout [
	self width: owner width.
]

{ #category : #'as yet unclassified' }
HorizontalConnectableBorder >> updateView [ 
	self comeToFront.
	self cellInset: (self width / (self submorphs size + 1)).
	self sortSubmorphsBy: [:s1 :s2 | s1 oppositeConnectionPoint left > s2 oppositeConnectionPoint left ]
]

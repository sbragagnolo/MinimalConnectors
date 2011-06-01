Class {
	#name : #VerticalConnectableBorderMorph,
	#superclass : #ConnectableBorderMorph,
	#category : #'MinimalConnectors-ConnectableShapes'
}

{ #category : #'as yet unclassified' }
VerticalConnectableBorderMorph >> initialize [ 
	super initialize.
	self 
		color: Color transparent;
		borderColor: Color transparent;
		width: 1;
		layoutPolicy: TableLayout new;
		layoutInset: 0;
		listDirection: #topToBottom;
		wrapCentering: #center;
		cellPositioning: #center;
		listCentering: #center;
		hResizing: #rigid;
		vResizing: #spaceFill
]

{ #category : #'as yet unclassified' }
VerticalConnectableBorderMorph >> updateLayout [
	self height: owner height.
	
]

{ #category : #'as yet unclassified' }
VerticalConnectableBorderMorph >> updateView [	
	self sortSubmorphsBy: [:s1 :s2 | s1 oppositeConnectionPoint top > s2 oppositeConnectionPoint top ].
	self updateConnections.
]

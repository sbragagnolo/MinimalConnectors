Class {
	#name : #HorizontalConnectableBorderMorph,
	#superclass : #ConnectableBorderMorph,
	#category : #'MinimalConnectors-ConnectableShapes'
}

{ #category : #'as yet unclassified' }
HorizontalConnectableBorderMorph >> initialize [ 
	super initialize.
	self 
		color: Color transparent;
		borderColor: Color transparent;
		layoutPolicy: TableLayout new;
		layoutInset: 0;
		listDirection: #leftToRight;
		wrapCentering: #center;
		cellPositioning: #center;
		listCentering: #center;
		hResizing: #spaceFill;
		vResizing: #rigid
]

{ #category : #'as yet unclassified' }
HorizontalConnectableBorderMorph >> updateLayout [
	self width: owner width.
]

{ #category : #'as yet unclassified' }
HorizontalConnectableBorderMorph >> updateView [ 
"self haltIf:[submorphs size >= 2]."
		
	
		self sortSubmorphsBy: [:s1 :s2 | s1 oppositeConnectionPoint left > s2 oppositeConnectionPoint left ].

		self updateConnections.
]

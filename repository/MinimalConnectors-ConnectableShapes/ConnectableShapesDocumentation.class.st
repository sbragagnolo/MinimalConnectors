Class {
	#name : #ConnectableShapesDocumentation,
	#superclass : #CategoryDiagramsHolder,
	#category : #'MinimalConnectors-ConnectableShapes'
}

{ #category : #diagrams }
ConnectableShapesDocumentation >> connectableShapes [
	| d diagramNodeMorph connectableBorder connectableBoundingBox connectableBoundingCircle connectableBounds tConnectableShape |
	diagramNodeMorph := ClassBox named: 'DiagramNodeMorph'.
	diagramNodeMorph instanceVariables: #('container' 'diagramNode' 'dragEventHandler' ).
	diagramNodeMorph instanceMethods: #('connectTo:using:' 'update:' 'connections' 'mouseUp:' 'connectTo:' 'relations' 'handlesMouseDown:' 'diagramNode:' 'adjustPosition' 'connectableBounds' 'step' 'initialize' 'updateLayout' 'wantsToBeDroppedInto:' 'mouseDown:' 'justDroppedInto:event:' 'mouseMove:' ).
	"Positioning"
	diagramNodeMorph position: 195 @ 16.
	connectableBorder := ClassBox named: 'ConnectableBorder'.
	connectableBorder instanceMethods: #('updateConnectionsLabel' 'connectionPoints' 'sortSubmorphsBy:' 'updateLayout' ).
	"Positioning"
	connectableBorder position: 999 @ 278.
	connectableBoundingBox := ClassBox named: 'ConnectableBoundingBox'.
	connectableBoundingBox instanceVariables: #('borders' ).
	connectableBoundingBox instanceMethods: #('connections' 'borders' 'updateConnectionsLabel' 'connectionPoints' 'newVerticalBorder' 'newHorizontalBorder' 'newBorder' 'connectionNear:' 'addConnectionPoint:thatConnectsTo:' ).
	"Positioning"
	connectableBoundingBox position: 677 @ 250.
	connectableBoundingCircle := ClassBox named: 'ConnectableBoundingCircle'.
	connectableBoundingCircle instanceVariables: #('topPoint' 'bottomPoint' 'leftPoint' 'rightPoint' ).
	connectableBoundingCircle instanceMethods: #('connections' 'connectionNear:' 'addConnectionPoint:thatConnectsTo:' ).
	"Positioning"
	connectableBoundingCircle position: 433 @ 279.
	connectableBounds := InterfaceBox named: 'ConnectableBounds'.
	connectableBounds instanceMethods: #('connections' 'addConnectionPoint:thatConnectsTo:' 'connectionNear:' ).
	"Positioning"
	connectableBounds position: 629 @ 67.
	tConnectableShape := TraitBox named: 'TConnectableShape'.
	tConnectableShape instanceMethods: #('connectTo:using:' 'connections' 'connectTo:' 'handlesMouseDown:' 'connectableBounds' ).
	"Positioning"
	tConnectableShape position: 6 @ 161.
	"Relationships"
	diagramNodeMorph hasA: connectableBounds labeledAs: 'connectableBounds'.
	"Relationships"
	connectableBoundingBox implements: connectableBounds.
	"Relationships"
	connectableBoundingCircle implements: connectableBounds.
	d := (ClassDiagram new name: 'Connectable Shapes') addDiagramNode: diagramNodeMorph;
				 addDiagramNode: connectableBorder;
				 addDiagramNode: connectableBoundingBox;
				 addDiagramNode: connectableBoundingCircle;
				 addDiagramNode: connectableBounds;
				 addDiagramNode: tConnectableShape.
	^ d
]

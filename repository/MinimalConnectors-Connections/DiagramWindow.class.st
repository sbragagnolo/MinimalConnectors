Class {
	#name : #DiagramWindow,
	#superclass : #SystemWindow,
	#category : #'MinimalConnectors-Connections'
}

{ #category : #'as yet unclassified' }
DiagramWindow >> createView [ 
	|  scrollPane diagram|

scrollPane := ScrollPane new.
diagram := DiagramWhiteboard new . 
diagram extent: 1000@2000.
diagram clipSubmorphs: false.
diagram model: model.
diagram update.
scrollPane scroller addMorph: diagram.
diagram position: 0@0.
self addMorph: scrollPane frame: (0@0 corner: 1@01).
]

{ #category : #'as yet unclassified' }
DiagramWindow >> openOn: aModel [
	self model: aModel; createView; openAsIs; maximize 
]

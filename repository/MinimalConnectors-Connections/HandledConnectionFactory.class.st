Class {
	#name : #HandledConnectionFactory,
	#superclass : #ConnectionFactory,
	#category : #'MinimalConnectors-Connections'
}

{ #category : #'as yet unclassified' }
HandledConnectionFactory >> curveHandleClass [ 
	^NCCurveHandleMorph
]

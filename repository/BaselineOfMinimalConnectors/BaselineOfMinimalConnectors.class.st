Class {
	#name : #BaselineOfMinimalConnectors,
	#superclass : #BaselineOf,
	#category : #BaselineOfMinimalConnectors
}

{ #category : #baselines }
BaselineOfMinimalConnectors >> baseline: spec [
	<bsaaeline>
	spec
		for: #common
		do: [ spec
				package: 'MinimalConnectors-ConnectableShapes';
				package: 'MinimalConnectors-CurvesAndArrows';
				package: 'MinimalConnectors-Connections'
					with: [ spec requires: 'MinimalConnectors-ConnectableShapes' ];
				group: 'default' with: #('Core');
				group: 'Core'
					with:
					#('MinimalConnectors-CurvesAndArrows' 'MinimalConnectors-Connections' 'MinimalConnectors-ConnectableShapes') ]
]

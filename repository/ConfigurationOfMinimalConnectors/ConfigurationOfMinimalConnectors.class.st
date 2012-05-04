Class {
	#name : #ConfigurationOfMinimalConnectors,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : #ConfigurationOfMinimalConnectors
}

{ #category : #private }
ConfigurationOfMinimalConnectors class >> bootstrapPackage: aString from: aPath [ 
	| repository version |
	repository := MCHttpRepository
				location: aPath
				user: ''
				password: ''.
	repository
		versionReaderForFileNamed: aString , '.mcz'
		do: [:reader | 
			version := reader version.
			version load.
			version workingCopy repositoryGroup addRepository: repository]
]

{ #category : #private }
ConfigurationOfMinimalConnectors class >> ensureMetacello [
	"Bootstrap Gofer (if necessary), bootstrap ConfigurationOfMetacello (using old Gofer API), then load the latest 
	version of Metacello itself."

	Smalltalk at: #MetacelloProject ifAbsent: [
		Smalltalk at: #Gofer ifAbsent: [
			"Current version of Gofer from which to bootstrap - as of 1.0-beta.21"
			self bootstrapPackage: 'Gofer-Core-lr.115' from: 'http://seaside.gemstone.com/ss/metacello' ].
		Smalltalk at: #Gofer ifPresent: [:goferClass | | gofer |
			gofer := goferClass new
				url: 'http://seaside.gemstone.com/ss/metacello';
				yourself.
			[ gofer addPackage: 'ConfigurationOfMetacello' ] on: Warning do: [:ex | ex resume ].
			gofer load ].
		"load 'default' group of Metacello"
		(Smalltalk at: #ConfigurationOfMetacello) perform: #load ]
]

{ #category : #'metacello tool support' }
ConfigurationOfMinimalConnectors class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #'metacello tool support' }
ConfigurationOfMinimalConnectors class >> lastMetacelloVersionLoad [
	"Answer the last version loaded and the list of packages loaded for that version."

	LastVersionLoad == nil ifTrue: [ LastVersionLoad := nil -> 'default' ].
	^LastVersionLoad
]

{ #category : #loading }
ConfigurationOfMinimalConnectors class >> load [
	"self load"

	^self project latestVersion load
]

{ #category : #'metacello tool support' }
ConfigurationOfMinimalConnectors class >> metacelloVersion: versionString loads: anArrayOrString [
	"Stash the last version loaded and the list of packages loaded for that version. The list
	 of packages will be used by the tools when doing 'Load Package Version'"

	LastVersionLoad := versionString -> anArrayOrString
]

{ #category : #accessing }
ConfigurationOfMinimalConnectors class >> project [

	^self new project
]

{ #category : #'unloading Metacello' }
ConfigurationOfMinimalConnectors class >> unloadMetacello [

	Smalltalk at: #ConfigurationOfMetacello ifPresent: [:cls | cls unloadMetacello ]
]

{ #category : #baselines }
ConfigurationOfMinimalConnectors >> baseline01: spec [ 
	<version: '0.1-baseline'>
	
	spec for: #common do: [
		spec blessing: #baseline.
		spec repository: 'http://www.squeaksource.com/MinimalConnectors'.	
		spec 
			package: 'MinimalConnectors-ConnectableShapes';
			package: 'MinimalConnectors-CurvesAndArrows';
			package: 'MinimalConnectors-Connections' with:[spec requires: 'MinimalConnectors-ConnectableShapes'];

			group: 'default' with: #('Core');
			group: 'Core' with: #('MinimalConnectors-CurvesAndArrows' 'MinimalConnectors-Connections' 'MinimalConnectors-ConnectableShapes').
		].
]

{ #category : #accessing }
ConfigurationOfMinimalConnectors >> project [

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		self class ensureMetacello.
		"Construct Metacello project"
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self.
		project := constructor project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #nil }
ConfigurationOfMinimalConnectors >> stable: spec [  
	<symbolicVersion: #stable>
	
	spec for: #'pharo1.2.x' version: '0.6'.
	spec for: #'pharo1.3.x' version: '0.6'.
	spec for: #'pharo1.4.x' version: '0.7'.
]

{ #category : #versions }
ConfigurationOfMinimalConnectors >> version01: spec [
	<version: '0.1' imports: #('0.1-baseline')>
	spec
		for: #common
		do: [ 
			spec
				blessing: #release;
				package: 'MinimalConnectors-ConnectableShapes' with:'MinimalConnectors-ConnectableShapes-carlaGriggio.3';
				package: 'MinimalConnectors-CurvesAndArrows' with: 'MinimalConnectors-CurvesAndArrows-carlaGriggio.7';
				package: 'MinimalConnectors-Connections' with: 'MinimalConnectors-Connections-carlaGriggio.2']
]

{ #category : #versions }
ConfigurationOfMinimalConnectors >> version02: spec [
	<version: '0.2' imports: #('0.1-baseline')>
	spec
		for: #common
		do: [ 
			spec
				blessing: #release;
				package: 'MinimalConnectors-ConnectableShapes' with:'MinimalConnectors-ConnectableShapes-carlaGriggio.5';
				package: 'MinimalConnectors-CurvesAndArrows' with: 'MinimalConnectors-CurvesAndArrows-carlaGriggio.7';
				package: 'MinimalConnectors-Connections' with: 'MinimalConnectors-Connections-carlaGriggio.2']
]

{ #category : #versions }
ConfigurationOfMinimalConnectors >> version03: spec [
	<version: '0.3' imports: #('0.1-baseline')>
	spec
		for: #common
		do: [ 
			spec
				blessing: #release;
				package: 'MinimalConnectors-ConnectableShapes' with:'MinimalConnectors-ConnectableShapes-carlaGriggio.7';
				package: 'MinimalConnectors-CurvesAndArrows' with: 'MinimalConnectors-CurvesAndArrows-carlaGriggio.8';
				package: 'MinimalConnectors-Connections' with: 'MinimalConnectors-Connections-carlaGriggio.3']
]

{ #category : #versions }
ConfigurationOfMinimalConnectors >> version04: spec [
	<version: '0.4' imports: #('0.1-baseline')>
	spec
		for: #common
		do: [ 
			spec
				blessing: #release;
				package: 'MinimalConnectors-ConnectableShapes' with:'MinimalConnectors-ConnectableShapes-carlaGriggio.13';
				package: 'MinimalConnectors-CurvesAndArrows' with: 'MinimalConnectors-CurvesAndArrows-carlaGriggio.8';
				package: 'MinimalConnectors-Connections' with: 'MinimalConnectors-Connections-carlaGriggio.7']
]

{ #category : #versions }
ConfigurationOfMinimalConnectors >> version05: spec [
	<version: '0.5' imports: #('0.1-baseline')>
	spec
		for: #common
		do: [ 
			spec
				blessing: #release;
				package: 'MinimalConnectors-ConnectableShapes' with:'MinimalConnectors-ConnectableShapes-carlaGriggio.14';
				package: 'MinimalConnectors-CurvesAndArrows' with: 'MinimalConnectors-CurvesAndArrows-carlaGriggio.8';
				package: 'MinimalConnectors-Connections' with: 'MinimalConnectors-Connections-carlaGriggio.8']
]

{ #category : #versions }
ConfigurationOfMinimalConnectors >> version06: spec [
	<version: '0.6' imports: #('0.1-baseline')>
	spec
		for: #common
		do: [ 
			spec
				blessing: #release;
				package: 'MinimalConnectors-ConnectableShapes' with:'MinimalConnectors-ConnectableShapes-carlaGriggio.18';
				package: 'MinimalConnectors-CurvesAndArrows' with: 'MinimalConnectors-CurvesAndArrows-carlaGriggio.8';
				package: 'MinimalConnectors-Connections' with: 'MinimalConnectors-Connections-carlaGriggio.8']
]

{ #category : #versions }
ConfigurationOfMinimalConnectors >> version07: spec [
	<version: '0.7' imports: #('0.1-baseline')>
	spec
		for: #common
		do: [ 
			spec
				blessing: #release;
				package: 'MinimalConnectors-ConnectableShapes' with:'MinimalConnectors-ConnectableShapes-carlaGriggio.20';
				package: 'MinimalConnectors-CurvesAndArrows' with: 'MinimalConnectors-CurvesAndArrows-carlaGriggio.9';
				package: 'MinimalConnectors-Connections' with: 'MinimalConnectors-Connections-carlaGriggio.8']
]

"
I represent a specific light source.
"
Class {
	#name : #WDLightSource,
	#superclass : #Object,
	#instVars : [
		'intensity'
	],
	#category : #'WodenSceneGraph-Core-Lighting'
}

{ #category : #testing }
WDLightSource class >> isAbstract [
	^ self == WDLightSource
]

{ #category : #converting }
WDLightSource >> asLightStateWithTransform: renderingTransform [
	self subclassResponsibility
]

{ #category : #converting }
WDLightSource >> asSceneElement [
	^ self asSceneNode
]

{ #category : #converting }
WDLightSource >> asSceneNode [
	^ WDSceneNode new
		lights: { self };
		yourself
]

{ #category : #initialization }
WDLightSource >> initialize [
	super initialize.
	intensity := Vector3 ones.
]

{ #category : #accessing }
WDLightSource >> intensity [

	^ intensity
]

{ #category : #accessing }
WDLightSource >> intensity: aVector3 [
	intensity := aVector3 asVector3.
]

"
I am an OSWindow that is used for displaying a woden scene.
"
Class {
	#name : #WDSceneOSWindow,
	#superclass : #WDAbstractRenderingSceneStateOSWindow,
	#instVars : [
		'scene',
		'camera'
	],
	#category : #'WodenSceneGraph-OSWindow'
}

{ #category : #accessing }
WDSceneOSWindow >> camera [

	^ camera
]

{ #category : #accessing }
WDSceneOSWindow >> camera: anObject [

	camera := anObject
]

{ #category : #initialization }
WDSceneOSWindow >> initialize [
	super initialize.
	self camera: WDCamera new.
]

{ #category : #accessing }
WDSceneOSWindow >> leftEyeRenderingSceneState [
	| displayExtent aspectRatio |
	scene ifNil: [ ^ nil ].
	camera ifNil: [ ^ nil ].
	displayExtent := self displayExtent.
	aspectRatio := displayExtent x asFloat / displayExtent y.
	^ (camera asCameraStateWithFrustumTangents: (vrSystem leftEyeFrustumTangentsWithFovY: camera asCameraFovY aspect: aspectRatio) eyeTransform: vrSystem leftEyeTransform)
		ifNotNil: [ :cameraState | scene asRenderingSceneWithCameraState: cameraState ]
]

{ #category : #accessing }
WDSceneOSWindow >> renderingSceneState [
	| displayExtent aspectRatio |
	scene ifNil: [ ^ nil ].
	camera ifNil: [ ^ nil ].
	displayExtent := self displayExtent.
	aspectRatio := displayExtent x asFloat / displayExtent y.
	^ (camera asCameraStateWithAspectRatio: aspectRatio) ifNotNil: [ :cameraState | scene asRenderingSceneWithCameraState: cameraState ]
]

{ #category : #accessing }
WDSceneOSWindow >> rightEyeRenderingSceneState [
	| displayExtent aspectRatio |
	scene ifNil: [ ^ nil ].
	camera ifNil: [ ^ nil ].
	displayExtent := self displayExtent.
	aspectRatio := displayExtent x asFloat / displayExtent y.
	^ (camera asCameraStateWithFrustumTangents: (vrSystem rightEyeFrustumTangentsWithFovY: camera asCameraFovY aspect: aspectRatio) eyeTransform: vrSystem rightEyeTransform)
		ifNotNil: [ :cameraState | scene asRenderingSceneWithCameraState: cameraState ]
]

{ #category : #accessing }
WDSceneOSWindow >> scene [

	^ scene
]

{ #category : #accessing }
WDSceneOSWindow >> scene: anObject [

	scene := anObject
]

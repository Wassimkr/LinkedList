Class {
	#name : #Node,
	#superclass : #Object,
	#instVars : [
		'value',
		'nextLink'
	],
	#category : #LinkedList
}

{ #category : #evaluating }
Node >> nextLink [ 
	^ nextLink 
]

{ #category : #evaluating }
Node >> nextLink: aNextLink [
	super initialize.
	nextLink := aNextLink 
]

{ #category : #evaluating }
Node >> value [ 
	^ value
]

{ #category : #evaluating }
Node >> value: newValue [
	super initialize.
	value := newValue 
]

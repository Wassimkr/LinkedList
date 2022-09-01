Class {
	#name : #BasicLinkedList,
	#superclass : #Object,
	#instVars : [
		'head',
		'tail'
	],
	#category : #LinkedList
}

{ #category : #adding }
BasicLinkedList >> add: aNode [
	tail ifNotNil: [ tail nextLink: aNode ].
	head ifNil: [ head := aNode ].
	tail := aNode.
	^ aNode
]

{ #category : #adding }
BasicLinkedList >> asArray [ 	
	| array val|
	
	array := OrderedCollection new.
	val := head.
	
	[ val isNotNil ] whileTrue: [ 
											array add: val value.
											val := val nextLink. 
										 ].
	
	^ array
]

{ #category : #adding }
BasicLinkedList >> first [ 
	^ head value
]

{ #category : #adding }
BasicLinkedList >> last [ 
	^ tail value
]

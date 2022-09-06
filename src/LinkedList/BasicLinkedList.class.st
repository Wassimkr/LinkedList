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
	^ self addLast: aNode
]

{ #category : #adding }
BasicLinkedList >> add: aLinkOrObject after: otherLink [

	^ self add: aLinkOrObject afterLink: otherLink
]

{ #category : #adding }
BasicLinkedList >> add: aLinkOrObject afterLink: otherLink [

	"Add otherLink  after link in the list. Answer aLink."

	| savedLink aLink |
	tail == otherLink ifTrue: [^ self addLast: aLinkOrObject].
	savedLink := otherLink nextLink.
	aLink := aLinkOrObject asLink.
	otherLink nextLink: aLink.
	aLink nextLink:  savedLink.
	^aLink.
]

{ #category : #adding }
BasicLinkedList >> add: aNode beforeLink: otherNode [

	| node |
	head == otherNode ifTrue: [ ^ self addFirst: aNode ].
	node := head.
	[ node isNil ] whileFalse: [ [ node nextLink == otherNode ] ifTrue: [ 
												aNode nextLink: node nextLink.
												node nextLink: aNode.
												^ aNode
										  ] 
										]
]

{ #category : #adding }
BasicLinkedList >> addFirst: aNode [

	head ifNil: [ head := aNode ].
	aNode nextLink: head.
	head := aNode.
	^ aNode
]

{ #category : #adding }
BasicLinkedList >> addLast: aNode [
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

{ #category : #accessing }
BasicLinkedList >> first [ 	
	^ head value
]

{ #category : #accessing }
BasicLinkedList >> last [
	^ tail value
]

Class {
	#name : #TestBasicLinkedList,
	#superclass : #TestCase,
	#instVars : [
		'head',
		'tail'
	],
	#category : #LinkedList
}

{ #category : #tests }
TestBasicLinkedList >> testAddIsOk [
	| list node1 node2 node3 |
	
	node1 := Node new.
	node1 value: 2.
	
	node2 := Node new.
	node2 value: 4.
	
	node3 := Node new.
	node3 value: 6.
	
	list := BasicLinkedList new.
	list add: node1.
	list add: node2.
	list add: node3.
	
	self assert: (list asArray) size equals: 3.
	self assert: (list first) value equals: 2.
	self assert: (list last) value equals: 6
]

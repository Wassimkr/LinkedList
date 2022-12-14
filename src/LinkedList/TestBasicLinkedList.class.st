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
TestBasicLinkedList >> testAddAfter [
	| list node1 node2 |
	
	node1 := Node new.
	node1 value: 2.
	
	node2 := Node new.
	node2 value: 4.
	
	list := BasicLinkedList new.
	list addLast: node1.
	list add: node2 after: node1.
	
	self assert: (list last) value equals: 4
]

{ #category : #tests }
TestBasicLinkedList >> testAddAfterLink [
	| list node1 node2 |
	
	node1 := Node new.
	node1 value: 2.
	
	node2 := Node new.
	node2 value: 4.
	
	list := BasicLinkedList new.
	list addLast: node1.
	list add: node2 afterLink: node1.
	
	self assert: (list last) value equals: 4
]

{ #category : #tests }
TestBasicLinkedList >> testAddBeforeLink [
	| list node1 node2 |
	
	node1 := Node new.
	node1 value: 2.
	
	node2 := Node new.
	node2 value: 4.
	
	list := BasicLinkedList new.
	list addLast: node1.
	list add: node2 beforeLink: node1.
	
	self assert: (list first) value equals: 4
]

{ #category : #tests }
TestBasicLinkedList >> testAddFirstIsOk [
	| list node1 node2 node3 |
	
	node1 := Node new.
	node1 value: 2.
	
	node2 := Node new.
	node2 value: 4.
	
	node3 := Node new.
	node3 value: 6.
	
	list := BasicLinkedList new.
	list addLast: node1.
	list addLast: node2.
	list addFirst: node3.
	
	self assert: (list first) value equals: 6
]

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

{ #category : #tests }
TestBasicLinkedList >> testAddLastIsOk [
	| list node1 node2 node3 |
	
	node1 := Node new.
	node1 value: 2.
	
	node2 := Node new.
	node2 value: 4.
	
	node3 := Node new.
	node3 value: 6.
	
	list := BasicLinkedList new.
	list addLast: node1.
	list addLast: node2.
	list addLast: node3.
	
	self assert: (list asArray) size equals: 3.
	self assert: (list first) value equals: 2.
	self assert: (list last) value equals: 6
]

{ #category : #tests }
TestBasicLinkedList >> testAtIsOk [
	| list node1 node2 |
	
	node1 := Node new.
	node1 value: 2.
	
	node2 := Node new.
	node2 value: 4.
	
	list := BasicLinkedList new.
	list addLast: node1.
	list addLast: node2.
	
	self assert: (list at: 2) value equals: 4
]

{ #category : #tests }
TestBasicLinkedList >> testAtPutLinkIsOk [
	| list node1 node2 node3 |
	
	node1 := Node new.
	node1 value: 2.
	
	node2 := Node new.
	node2 value: 4.
	
	node3 := Node new.
	node3 value: 6.
	
	list := BasicLinkedList new.
	list at: 1 putLink: node1.
	list at: 2 putLink: node2.
	list at: 3 putLink: node3.
	
	self assert: list size equals: 3.
	self assert: (list first) value equals: 2.
	self assert: (list last) value equals: 6
]

{ #category : #tests }
TestBasicLinkedList >> testRemoveAllIsOk [
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
	
	list removeAll.
	
	self assert: list size equals: 0
	

]

{ #category : #tests }
TestBasicLinkedList >> testRemoveFirstIsOk [
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
	
	list removeFirst.
	
	self assert: (list first) value equals: 4
	

]

{ #category : #tests }
TestBasicLinkedList >> testRemoveLastIsOk [
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
	
	list removeLast.
	
	self assert: (list asArray) size equals: 2.
	self assert: (list last) value equals: 4
	

]

{ #category : #tests }
TestBasicLinkedList >> testSizeIsOk [
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
	
	self assert: list size equals: 3
	

]

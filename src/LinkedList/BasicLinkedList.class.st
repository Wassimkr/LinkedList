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
BasicLinkedList >> add: aNode after: otherNode [

	^ self add: aNode afterLink: otherNode
]

{ #category : #adding }
BasicLinkedList >> add: aNode afterLink: otherNode [

	"Add otherLink  after link in the list. Answer aLink."

	| node1 node2 |
	tail == otherNode ifTrue: [^ self add: aNode].
	node1 := otherNode nextLink.
	node2 := aNode asLink.
	otherNode nextLink: node2.
	node2 nextLink:  node1.
	^ node2
]

{ #category : #adding }
BasicLinkedList >> add: aNode before: otherNode [

	^ self add: aNode beforeLink: otherNode
]

{ #category : #adding }
BasicLinkedList >> add: aNode beforeLink: otherNode [

	| node |
	head == otherNode ifTrue: [ ^ self addFirst: aNode ].
	node := head.
	[ node isNil ] whileFalse: [  node nextLink == otherNode  ifTrue: [ 
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
BasicLinkedList >> at: index [
	
	| i node |
	i := 1.
	node := head.
	
	index == 1
		ifTrue: [ ^ head value ]
		ifFalse: [ 
				[ i == index ] 
					whileFalse:  [ 
							i := i + 1.
							node := node nextLink.
						 ].
				^ node value.
			 ]
						
				
]

{ #category : #accessing }
BasicLinkedList >> at: index putLink: aNode [ 
	
	| i node listSize|
	
	i := 1.
	listSize := (self size) + 1.
	node := head.
	
	head == tail
		ifTrue: [ ^ self addLast: aNode ]
		ifFalse: [ 
						index == listSize
							ifTrue: [ ^ self addLast: aNode ]
							ifFalse: [ 
									[ i == index  ]
										whileFalse: [ 
											i := i + 1.
											node := node nextLink
						 				].
					
									^ self add: aNode beforeLink: node.
			 				].
								 ]
						
				
]

{ #category : #accessing }
BasicLinkedList >> first [ 	
	^ head value
]

{ #category : #accessing }
BasicLinkedList >> last [
	^ tail value
]

{ #category : #removing }
BasicLinkedList >> removeAll [
	head := nil.
	tail := nil
]

{ #category : #removing }
BasicLinkedList >> removeFirst [ 
	
	| node |
	node := head.
	head == tail
		ifTrue: [ head := nil ]
		ifFalse: [ head := node nextLink. node := nil ].
	^ self.
]

{ #category : #removing }
BasicLinkedList >> removeLast [ 
	
	| node |
	node := head.
	head == tail
		ifTrue: [ head := nil ]
		ifFalse: [ [ node nextLink == tail ] 
						whileFalse: [ 
								node := node nextLink.
							 ].
						tail := node.
						node nextLink: nil
					].
	^ self.
]

{ #category : #accessing }
BasicLinkedList >> size [ 
	
	| index node |
	index := 1.
	
	node := head.
	
	head isNil 
		ifTrue: [ ^ 0 ]
		ifFalse: [ 
				[ node == tail ]
					whileFalse: [ 
						index := index + 1.
						node := node nextLink.
			 		].
					^ index
			 	]
	
	
	
]

"
`Counter` is a simple concrete class that supports incrementing and decrementing.
It's API is
- `decrement` and `increment`
- `count`
It's creation message is `startAt:`
"
Class {
	#name : #Counter,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#category : #MyCounter
}

{ #category : #accessing }
Counter >> count [
	^ count
]

{ #category : #accessing }
Counter >> count: value [
	 count := value
]

Class {
	#name : #CounterTest,
	#superclass : #TestCase,
	#category : #MyCounter
}

{ #category : #tests }
CounterTest >> testAlternateCreationMethod [
	self assert: ((Counter startingAt: 19) increment ; count) equals: 20
]

{ #category : #tests }
CounterTest >> testCountIsSetAndRead [
	| c |
	c := Counter new.
	c count: 7.
	self assert: c count equals: 7
]

{ #category : #tests }
CounterTest >> testCounterStartingAt5 [
	self assert: (Counter startingAt: 5) count equals: 5
]

{ #category : #tests }
CounterTest >> testInitialize [
	self assert: (Counter new count) equals: 0
]

{ #category : #tests }
CounterTest >> testPrintOn [
	self assert:
		((Counter startingAt: 20) increment ; printString)
	equals: 
		'a Counter with value: 21'
]

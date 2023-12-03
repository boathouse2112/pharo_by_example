Class {
	#name : #LOGame,
	#superclass : #BorderedMorph,
	#instVars : [
		'cells'
	],
	#category : #'PBE-LightsOut'
}

{ #category : #accessing }
LOGame >> cellsPerSide [
	"The number of cells along each side of the game board"
	^ 10
]

{ #category : #initialization }
LOGame >> initialize [
	"Initialize the game board"
	
	| sampleCell width height n |
	super initialize.
	n := self cellsPerSide.
	sampleCell := LOCell new.
	width := sampleCell width.
	height := sampleCell height.
	self bounds: (500 @ 500 extent: (width * n) @ (height * n) + (2 * self borderWidth)).
	cells := Array2D 
		new: n
		tabulate: [ :i :j | self newCellAt: i at: j ]
]

{ #category : #logic }
LOGame >> newCellAt: i at: j [
	"Create a cell for position (i, j), and add it to my on-screen representation at the appropriate screen position.
	Answer the new cell."

	| c origin |
	c := LOCell new.
	origin := self innerBounds origin.
	self addMorph: c.
	c position: ((i - 1) * c width) @ ((j - 1) * c height) + origin.
	c mouseAction: [ self toggleNeighborsAt: i at: j ].
	^ c
]

{ #category : #logic }
LOGame >> toggleNeighborsAt: i at: j [
	"Toggle cells surrounding the cell (i, j)"
	
	i > 1
		ifTrue: [ (cells at: i - 1 at: j) toggleState ].
	i < self cellsPerSide 
		ifTrue: [ (cells at: i + 1 at: j) toggleState ].
	j > 1
		ifTrue: [ (cells at: i at: j - 1) toggleState ].
	j < self cellsPerSide
		ifTrue: [ (cells at: i at: j + 1) toggleState ].
]

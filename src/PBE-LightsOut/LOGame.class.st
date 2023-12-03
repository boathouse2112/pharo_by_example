Class {
	#name : #LOGame,
	#superclass : #BorderedMorph,
	#instVars : [
		'cells'
	],
	#category : #'PBE-LightsOut'
}

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

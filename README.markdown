Game of Life for the iPhone
===========================

New to objective-c and the iPhone SDK, I thought I'd use [Conway's Game of Life](http://en.wikipedia.org/wiki/Conway's_Game_of_Life) to learn some aspects of the language and the SDK. Conway's Game of Life is a [cellular automaton](http://en.wikipedia.org/wiki/Cellular_automaton) that requires almost no user input, so it's a good thing to start with. 

## And now a message from our sponsors... ##

Got your attention there... 

Since I'm new to objective-c, I tried to use some concepts in places where they're not really needed. This is mostly a learning experience. Some classes are unnecessary and some design decisions were purely for fun. For example, I'm using a one dimensional NSMutableArray for the grid of cells, so I'm forced to create an abstract [matrix](http://en.wikipedia.org/wiki/Matrix_\(mathematics\)) for the grid: from a (x,y) coordinate I can calculate an index, but the calculation is not so straightforward when you go the other way round. 

I'm no mathematician, so I couldn't come up with any elegant way for calculating the [Moore Neighbourhood](http://en.wikipedia.org/wiki/Moore_neighborhood) of a cell (index) in a one-dimensional array projected on a 2-dimensional plane. Most algorithms take for granted the existence of 2-coordinate point in a matrix. So, getting the neighbours for the cell _n_ in a 1-dimensional array given the grid properties *r=5;c=5*... The following is a 5x5 grid in a 1D array:
  `[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]`
Given cell *n=8*, it's Moore neighbourhood is easier calculated as a function of 2D array than of a 1D array. The NW neighbour could be `n-c-1=2`, but when `n=10` (there is no NW neighbour), the same equation would give us an index that's not a neighbour. 
Anyway, picking out edge cases (numbers in first / last rows, or first / last columns) seemed a bit hacky and inelegant. *That* was the fun in using a 1D array for the grid.

## History ##
* First step was getting the model up and running (more or less) without the engine (no tick functionality). 
* Implemented some methods for the GameOfLife class that I thought would come in handy, but that are not being used anywhere later on... good for learning though. 
* Tried to use Objective-C @property / @synthesize to get the hang of it, I'm still not sure if I should. 
* User Interface: wasn't so easy to manually draw rectangles. I would have thought that drawing a grid was simple... I'll try UITableView in the future, I'm using UIView with subviews for now. 
* Future: 
  * Check the TODO
  
### License ###
This Software is licensed under the [GPL-v3](http://www.gnu.org/licenses/gpl-3.0.txt). We're all trying to learn here, so it's best we share :-)

See the LICENSE file for the full text of the license.
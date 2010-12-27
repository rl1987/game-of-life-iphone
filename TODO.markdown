TODO
====

* The most important part: tidy up code. 
  * Get rid of needless classes.
  * Abstract some parts of the code into their own classes for neatness.
  * Drawing code needs to be tidy.

* System: Model / Engine
  * It would be nice to have a Grid / Board class and keep track of Life's history, or log ticks.
  * Separate the data/grid states with cellular data from the game engine itself.
  
* UI
  * Tidy up the User Interface: 2 views (touch gestures to switch).
    * ViewPort 1: The GRID with life (zoomable).
    * ViewPort 2: Statistics, consisting of... 
      * Generation records: longest lived patterns
      * Number of still life objects, oscillators, spaceships, etc.
      * Most common patterns of a list of patterns (some still life, some oscillators)
  * Flow
    * Implement Play / Pause, apart from ticks. 
    * Once a game is playing, user should not be able to interfere with evolution (disable user input)
  * Touch Gestures:
    * Double tap to play / pause.
    * Single tap to toggle cell – Only before starting the game, and maybe when paused.
    
* Settings
  * Create settings view, for the following settings: 
    * Speed
    * Toggle user input after game has started, a.k.a. God mode.
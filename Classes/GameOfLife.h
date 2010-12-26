//
//  GameOfLife.h
//  CGOL
//
//  Created by Vince Martínez on 26/12/2010.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface GameOfLife : NSObject {
    int columns, rows;
    double count;
    NSMutableArray * cells;
}

@property(readonly) int rows, columns, total;

@property (nonatomic, retain) NSMutableArray * cells;

- (GameOfLife *) initWithRows:(int)numRows andColumns:(int)numColumns;

- (void) iterate;

// Get cell at position
- (Cell *) atRow:(int)row andColumn:(int)column;
- (Cell *) atIndex:(int)index;

// Checking for life
- (BOOL) isAliveAtRow:(int)row andColumn:(int)column;
- (BOOL) isAliveAtIndex:(int)index;

// Creating life
- (void) createLifeAtRow:(int)row andColumn:(int)column;
- (void) createLifeAtIndex:(int)index;

// Killing cells... 
- (void) killCellAtRow:(int)row andColumn:(int)column;
- (void) killCellAtIndex:(int)index;

// Clear entire grid
- (void) clearGrid;

// Neighbours
- (int) totalNeighboursAliveAtRow:(int)row andColumn:(int)column;
- (int) totalNeighboursAliveAtIndex:(int)index;


@end

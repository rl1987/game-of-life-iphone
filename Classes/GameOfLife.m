//
//  GameOfLife.m
//  CGOL
//
//  Created by Vince Martínez on 26/12/2010.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import "GameOfLife.h"


@implementation GameOfLife

@synthesize cells;
@synthesize rows; 
@synthesize columns;
@synthesize total;

#pragma mark Initialization
- (GameOfLife *) init{
    return [self initWithRows:5 andColumns:5];
}

- (GameOfLife *) initWithRows:(int)numRows andColumns:(int)numColumns{
    self = [super init];
    columns = numColumns;
    rows = numRows;
    total = numRows * numColumns;
    for(int idx = 0; idx < total; idx++){
        Cell * cell = [[Cell alloc] initWithValue:FALSE];
        [cells addObject:cell];
    }
    return self;
}
#pragma mark Grid Operations

- (Cell *) atRow:(int)row andColumn:(int)column{
    return [self atIndex:((row * columns) + column)];
}
- (Cell *) atIndex:(int)index{
    // Out of bounds shouldn't be handled like this, I think.
    // NSMutableArray / NSArray should return NSError, which 
    // should be handled.
    if (index < 0 || index > (rows*columns)) return nil;
    return [cells objectAtIndex:index];
}

- (void) tick{
    NSMutableArray * newCells = [cells copy];
    
    int index = 0;
    for(Cell * cell in newCells){
        int neighbors_alive = [self totalNeighboursAliveAtIndex:index];
        /* 
         1. less than 2 neighbors, you die
         2. More than 3 neighbors, you die
         */
        if([cell isAlive]){
            if(neighbors_alive < 2 || neighbors_alive > 3){
                
            }
        }
        if(neighbors_alive < 2 || neighbors_alive > 3){
            
        }
        index++;
    }
}

// Checking for life
- (BOOL) isAliveAtRow:(int)row andColumn:(int)column{
    int index = self.rows + column;
    return [self isAliveAtIndex:index];
}
- (BOOL) isAliveAtIndex:(int)index{
    return [[cells objectAtIndex:index] isAlive];
}

// Creating life
- (void) createLifeAtRow:(int)row andColumn:(int)column{
    [[self atRow:row andColumn:column] setValue:TRUE];
}
- (void) createLifeAtIndex:(int)index{
    [[self atIndex:index] setValue:TRUE];
}

// Killing cells... 
- (void) killCellAtRow:(int)row andColumn:(int)column{
    [[self atRow:row andColumn:column] setValue:FALSE];
}
- (void) killCellAtIndex:(int)index{
    [[self atIndex:index]setValue:FALSE];
}


- (void) clearGrid{
    for ( Cell * _cell in cells){
        _cell.value = FALSE;
    }
}

- (void) toggleAtRow:(int)row andColumn:(int)column{
    [[self atRow:row andColumn:column] toggleValue];
}

// Neighbours
- (int) totalNeighboursAliveAtRow:(int)row andColumn:(int)column{
    return [self totalNeighboursAliveAtIndex:(row*columns)+column ];
}
- (int) totalNeighboursAliveAtIndex:(int)index{
    return 0;
}

@end

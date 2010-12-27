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
    cells = [[NSMutableArray alloc] init];
    for(int idx = 0; idx < total; idx++){
        Cell * cell = [[Cell alloc] initWithValue:false];
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
    if (index < 0 || index >= (rows*columns)){
        return nil;
        NSLog(@"ERROR: nil returned in atIndex:%d", index);
    }
    return [cells objectAtIndex:index];
}

- (void) tick{
    NSMutableArray * newCells = [[NSMutableArray alloc] init];
    
    int row = 0;
    int col = 0;
    int index = 0;
    for(Cell * cell in cells){
        row = (int) floor(index / columns);
        col = index % columns;
        int neighbors_alive = [self totalNeighboursAliveAtRow:row andColumn:col];
        if([cell isAlive]){
            if(neighbors_alive < 2 || neighbors_alive > 3)
                [newCells addObject: [[Cell alloc] initWithValue:FALSE]];
            else
                [newCells addObject: [[Cell alloc] initWithValue:TRUE]];
        }
        else{ 
            if(neighbors_alive == 3)
                [newCells addObject: [[Cell alloc] initWithValue:TRUE]];
            else
                [newCells addObject: [[Cell alloc] initWithValue: [cell value]]];
        }
        index++;
    }
    
    [cells release];
    cells = [newCells copy];
    [newCells release];
}

// Checking for life
- (BOOL) isAliveAtRow:(int)row andColumn:(int)column{
    return [[self atRow:row andColumn:column] isAlive];
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

// Moore Neighborhood (range 1)
#pragma mark Moore Neighborhood
- (int) totalNeighboursAliveAtRow:(int)row andColumn:(int)column{
    
    int totalNeighbours = 0;
    
    // NW
    if( row > 0 && column > 0 )
        if( [[self atRow:(row-1) andColumn:(column-1)] isAlive])
            totalNeighbours++;
    // N
    if( row > 0 && [[self atRow:(row-1) andColumn:column] isAlive])
            totalNeighbours++;
    // NE
    if( row > 0 && column+1 < columns && [[self atRow:(row-1) andColumn:column+1] isAlive])
        totalNeighbours++;
    // W
    if( column > 0 )
        if( [[self atRow:(row) andColumn:(column-1)] isAlive])
            totalNeighbours++;
    // E
    if( column+1 < columns )
        if( [[self atRow:(row) andColumn:(column+1)] isAlive])
            totalNeighbours++;
    // SW
    if( row+1 < rows && column > 0 )
        if( [[self atRow:(row+1) andColumn:(column-1)] isAlive])
            totalNeighbours++;
    // S
    if( row+1 < rows)
        if( [[self atRow:(row+1) andColumn:(column)] isAlive])
            totalNeighbours++;
    // se
    if( row+1 < rows && column+1 < columns )
        if( [[self atRow:(row+1) andColumn:(column+1)] isAlive])
            totalNeighbours++;
    
    
    return totalNeighbours;
}

- (int) totalNeighboursAliveAtIndex:(int)index{
    return 0;
}
- (int) totalNeighborsForIndex:(int)index andGrid:(NSArray *)array{
    return 0;
}

@end

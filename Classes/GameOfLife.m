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

#pragma mark Initialization
- (Grid *) init{
    columns = 10;
    rows = 20;
    return [self initWithRows:rows andColumns:columns];
}

- (Grid *) initWithRows:(int)numRows andColumns:(int)numColumns{
    self = [super init];
    count = numRows * numColumns;
    
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

- (void) iterate{
    return;
}

// Checking for life
- (BOOL) isAliveAtRow:(int)row andColumn:(int)column{
    return false;
}
- (BOOL) isAliveAtIndex:(int)index{
    return [[cells objectAtIndex:index] isAlive];
}

// Creating life
- (void) createLifeAtRow:(int)row andColumn:(int)column{
    
}
- (void) createLifeAtIndex:(int)index{
    
}

// Killing cells... 
- (void) killCellAtRow:(int)row andColumn:(int)column{
    
}
- (void) killCellAtIndex:(int)index{
    
}


- (void) clearGrid{
}

// Neighbours
- (int) totalNeighboursAliveAtRow:(int)row andColumn:(int)column{
    return [self totalNeighboursAliveAtIndex:(row*columns)+column ];
}
- (int) totalNeighboursAliveAtIndex:(int)index{
    return 0;
}

@end

//
//  Cell.m
//  CGOL
//
//  Created by Vince Martínez on 26/12/2010.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"


@implementation Cell

@synthesize value;

- (Cell *) init {
    return [self initWithValue:FALSE];
}

- (Cell *) initWithValue:(BOOL)val{
    if ((self = [super init])) {
        value = val;
    }
    return self;
}

- (BOOL) isAlive{
    return value;
}

- (void) toggleValue{
    NSLog(@"CELL toggleValue");
    value = !value;
}

@end

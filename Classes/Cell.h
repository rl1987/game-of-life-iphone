//
//  Cell.h
//  CGOL
//
//  Created by Vince Martínez on 26/12/2010.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    BOOL value;
}
@property(readwrite) BOOL value;

- (id) initWithValue:(BOOL)val;
- (BOOL) isAlive;
- (void) toggleValue;

@end

//
//  Cell.h
//  CGOL
//
//  Created by Vince Martínez on 26/12/2010.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    bool value;
}
- (id) initWithValue:(BOOL)val;
- (BOOL) isAlive;

@end

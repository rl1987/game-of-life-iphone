//
//  CGOLViewController.h
//  CGOL
//
//  Created by Vince Martínez on 26/12/2010.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameOfLife.h"

@interface CGOLViewController : UIViewController {
    GameOfLife * grid;
    IBOutlet UIView * gridView;
    IBOutlet UITextView * textView;
}
- (IBAction)startPressed:(UIButton *)sender;

- (IBAction)tickPressed:(UIButton *)sender;
- (IBAction)clearPressed:(UIButton *)sender;


- (void) loadGame;
- (void) drawLife;

//- (void) drawLifeViewAtX:(int)x andY:(int)y;

//
//- (UIView *) lifeViewAtLocationX:(int)x andLocationY:(int)y;
//
//- (int) getBoardXLocationFromView:(UIView *)view;
//- (int) getBoardYLocationFromView:(UIView *)view;
//
//- (void) makeViewAlive:(UIView *)view;
//- (void) makeViewDead:(UIView *)view;
//
//- (void) makeViewAliveAtX:(int)x andY:(int)y;
//- (void) makeViewDeadAtX:(int)x andY:(int)y;

- (void) tick;
@end

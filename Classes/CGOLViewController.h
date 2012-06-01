//
//  CGOLViewController.h
//  CGOL
//
//  Created by Vince Martínez on 26/12/2010.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameOfLife.h"
#import "Cell.h"

@interface CGOLViewController : UIViewController {
    GameOfLife * grid;
    IBOutlet UIView * gridView;
    IBOutlet UITextView * textView;
    NSMutableArray * cellGrid;
}

@property (nonatomic,retain) NSTimer *timer;
@property (nonatomic,assign) BOOL running;

- (IBAction)startPressed:(UIButton *)sender;

- (IBAction)tickPressed:(UIButton *)sender;
- (IBAction)clearPressed:(UIButton *)sender;


- (void)loadGame;
- (void)initializeCellGrid;
- (void)createGrid;
- (void)drawGrid;
- (void)populateGridView;

//- (void) drawLifeViewAtX:(int)x andY:(int)y;

//
- (UIView *) cellViewAtRow:(int)r andColumn:(int)c;

- (int) getCellRow:(UIView *)cell;
- (int) getCellColumn:(UIView *)cell;

- (void) makeBlockAlive:(UIView *)view;
- (void) makeBlockDead:(UIView *)view;
- (void) updateBlockAtRow:(int)r andColumn:(int)c;
- (void) createLifeInRow:(int)r andColumn:(int)c;
- (void) killLifeInRow:(int)r andColumn:(int)c;
- (void) toggleViewState:(UITapGestureRecognizer *)tapGesture;

- (void) tick;
@end

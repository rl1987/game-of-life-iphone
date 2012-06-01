//
//  CGOLViewController.m
//  CGOL
//
//  Created by Vince Martínez on 26/12/2010.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import "CGOLViewController.h"

@implementation CGOLViewController

@synthesize timer = _timer;
@synthesize running = _running;
@synthesize startButton;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
    grid = [[GameOfLife alloc] initWithRows:20 andColumns:20];
    gridView.backgroundColor = [UIColor blackColor];
    [self initializeCellGrid];
    [self populateGridView];
    
    self.running = NO;
    
    [super viewDidLoad];

}

- (void)dealloc {
    [startButton release];
    [super dealloc];
}

#pragma mark Interface – User Input

- (IBAction)tickPressed:(UIButton *)sender{
    int height = gridView.bounds.size.height;
    int width = gridView.bounds.size.width;
    float columns = width / 20;
    NSString * str = 
    [[NSString alloc] initWithFormat:@"width: %d, height: %d, columns: %.f", 
     width, height, columns];
    [textView setText:str];
    [self tick];
    
}

- (IBAction)clearPressed:(UIButton *)sender{
    [textView setText:@""];
    
    if (self.running) {
        self.running = NO;
        
        [self.timer invalidate];
        [self.timer release];
        self.timer = nil;
        
        //[(UIBarButtonItem *)[self.view viewWithTag:1] setTitle:@"START"];
        self.startButton.title = @"START";
    }
    
    [grid clearGrid];
    [self drawGrid];
}

#define TICK_INTERVAL 1.0

- (IBAction)startPressed:(UIBarButtonItem *)sender{
    if(!grid){
        [self loadGame];
    }
    
    if (!self.running)
    {
        sender.title = @"STOP";
        
        if (!self.timer)
            self.timer = [[NSTimer alloc] initWithFireDate:[NSDate date] 
                                                  interval:TICK_INTERVAL 
                                                    target:self 
                                                  selector:@selector(timerFired:) 
                                                  userInfo:nil 
                                                   repeats:YES];
        
        [[NSRunLoop mainRunLoop] addTimer:self.timer 
                                  forMode:NSDefaultRunLoopMode];
        
        self.running = YES;
    } else {
        sender.title  = @"START";
        
        [self.timer invalidate];
        [self.timer release];
        self.timer = nil;
        
        self.running = NO;
    }
}

#pragma mark Private methods

- (void)timerFired:(NSTimer *)timer
{
    [self tick];
}

- (void) loadGame{
    NSLog(@"Loading game:");
}

- (void) tick{
    [grid tick];
    [self drawGrid];
}
- (void)drawGrid{
    int _row = 0;
    int _column = 0;
    for(NSArray * row in cellGrid){
        _column = 0;
        for( UIView *item in row){

            [self updateBlockAtRow:_row andColumn:_column];
            _column++;
        }
        _row++;
    }
}

- (void)createGrid{
    if(!cellGrid){
        [self initializeCellGrid];
    }
    for(int _row = 0; _row <= [grid rows]; _row++){
        NSMutableArray *gridRow = [[NSMutableArray alloc] init];
        for(int _column = 0; _column <= [grid columns]; _column++){
            CGRect _block = CGRectMake((_column*15)+1, (_row*15)+1, 14, 14);
            UIView *view = [[UIView alloc] initWithFrame:_block];
            
            // Add tap gesture to toggle alive / dead
            [view addGestureRecognizer: [[UITapGestureRecognizer alloc]
                                         initWithTarget:self action:@selector(toggleViewState:)]];
            
            if([grid isAliveAtRow:_row andColumn:_column]){
                [self makeBlockAlive:view];
            }
            else{
                [self makeBlockDead:view];
            }
            [gridRow addObject:view];
        }
        
        [cellGrid addObject:gridRow];
        
    }
}

- (void)initializeCellGrid{
    [cellGrid release];
    cellGrid = [[NSMutableArray alloc] init];
    [self createGrid];
}

- (void)populateGridView{
    if ([[gridView subviews] count] > 0 ){
        NSLog(@"Subviews exist: %d", [[gridView subviews]count]);
    }
    for (int y = 0; y < [grid rows]; y++) {
		for (int x = 0; x < [grid columns]; x++) {
			[gridView addSubview:[self cellViewAtRow:y andColumn:x]];
        }
	}
}

- (UIView *) cellViewAtRow:(int)r andColumn:(int)c{
    return [[cellGrid objectAtIndex:r] objectAtIndex:c];
}

- (void) updateBlockAtRow:(int)r andColumn:(int)c{
    UIView * block = [[cellGrid objectAtIndex:r] objectAtIndex:c];
    if(!block) return;
    
    if([grid isAliveAtRow:r andColumn:c]){
        [self makeBlockAlive: block];
    }
    else {
        [self makeBlockDead:block];
    }

}

- (int) getCellRow:(UIView *)cell{
    double row = round(cell.frame.origin.y/15);
	return row;
}
- (int) getCellColumn:(UIView *)cell{
    double column = round(cell.frame.origin.x/15);
    return column;
}



- (void) makeBlockAlive:(UIView *)view{
    view.backgroundColor = [UIColor colorWithRed:0.945 green:0.945 blue:0.945 alpha:1];
}
- (void) makeBlockDead:(UIView *)view{
    view.backgroundColor = [UIColor colorWithRed:0.133 green:0.133 blue:0.133 alpha:1];
}

- (void) createLifeInRow:(int)r andColumn:(int)c{
    [grid createLifeAtRow:r andColumn:c];
}
- (void) killLifeInRow:(int)r andColumn:(int)c{
    
}

- (void) toggleViewState:(UITapGestureRecognizer *)tapGesture{
    /*
     * Toggle this value in the grid and repaint it. 
     */
    
    if (self.running)
        return;
    
    UIView *view = tapGesture.view;
    int row = [self getCellRow:view];
    int column = [self getCellColumn:view];
    [grid toggleAtRow:row andColumn:column];
    [self updateBlockAtRow:row andColumn:column];
}
- (void)viewDidUnload {
    [self setStartButton:nil];
    [super viewDidUnload];
}
@end

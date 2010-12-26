//
//  CGOLViewController.m
//  CGOL
//
//  Created by Vince Martínez on 26/12/2010.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import "CGOLViewController.h"

@implementation CGOLViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

#pragma mark Interface – User Input

- (IBAction)tickPressed:(UIButton *)sender{
    NSLog(@"Tick pressed");
    [textView setText:@"Tick!"];
}

- (IBAction)clearPressed:(UIButton *)sender{
    NSLog(@"Clear pressed");
    [textView setText:@""];
}

- (IBAction)startPressed:(UIButton *)sender{
    if(!grid){
        NSLog(@"Starting game...");
        [self loadGame];
    }
    else NSLog(@"Game already started...");    
}

#pragma mark Private methods

- (void) loadGame{
    NSLog(@"Loading game:");
    if(!grid){
        grid = [[GameOfLife alloc] initWithRows:10 andColumns:10];
        NSLog(@"Grid initialized.\n Rows: %d\n Columns: %d\n Total: %d\n", grid.rows, grid.columns, grid.total);
    }
    
    // Initialize the grid
    gridView.backgroundColor = [UIColor blackColor];
}

- (void) tick{}
- (void) drawLife{}


@end

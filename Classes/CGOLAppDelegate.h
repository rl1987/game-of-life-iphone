//
//  CGOLAppDelegate.h
//  CGOL
//
//  Created by Vince Martínez on 26/12/2010.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CGOLViewController;

@interface CGOLAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CGOLViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CGOLViewController *viewController;

@end

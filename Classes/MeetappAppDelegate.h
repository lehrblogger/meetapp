//
//  MeetappAppDelegate.h
//  Meetapp
//
//  Created by Steven Lehrburger on 3/23/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

// http://jefferator.blogspot.com/2009/01/iphone-programming-tutorial-creating.html
// was useful for initial setup

#import <UIKit/UIKit.h>
#import "MADataManager.h"

@interface MeetappAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	UITabBarController *tabBarController;
	MADataManager *dataManager;
}

@property (nonatomic, retain) UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MADataManager *dataManager;

@end


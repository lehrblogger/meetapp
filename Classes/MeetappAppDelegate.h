//
//  MeetappAppDelegate.h
//  Meetapp
//
//  Created by Steven Lehrburger on 3/23/09.
//  Copyright 2009 Steven Lehrburger All rights reserved.
//

// http://jefferator.blogspot.com/2009/01/iphone-programming-tutorial-creating.html
// was useful for initial setup

#import <UIKit/UIKit.h>
#import "MADataManager.h"

@interface MeetappAppDelegate : NSObject <UIApplicationDelegate> {
	UITabBarController *tabBarController;

}

- (void)createToolbarItems;

@property (nonatomic, retain) UITabBarController *tabBarController;

@property (nonatomic, retain) UIBarButtonItem *refreshButtonItem;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicatorItem;

@end


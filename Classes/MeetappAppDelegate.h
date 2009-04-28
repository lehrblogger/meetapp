//
//  MeetappAppDelegate.h
//  Meetapp
//
//  Created by Steven Lehrburger on 4/27/09.
//  Copyright Steven Lehrburger 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MADataManager.h"

@interface MeetappAppDelegate : NSObject <UIApplicationDelegate> {
    
	UIWindow *window;
	UINavigationController *navigationController;
	UIToolbar *toolbar;
	
	MADataManager *dataManager;
	UIBarButtonItem *refreshButtonItem;
	UIActivityIndicatorView *activityIndicatorItem;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, retain) UIToolbar* toolbar;

@property (nonatomic, retain) MADataManager *dataManager;
@property (nonatomic, retain) UIBarButtonItem *refreshButtonItem;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicatorItem;

@end


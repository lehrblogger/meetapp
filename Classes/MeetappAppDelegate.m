//
//  MeetappAppDelegate.m
//  Meetapp
//
//  Created by Steven Lehrburger on 4/27/09.
//  Copyright Steven Lehrburger 2009. All rights reserved.
//

#import "MeetappAppDelegate.h"
#import "MAEventTableViewController.h"
#import "MAToolbarController.h"

@implementation MeetappAppDelegate

@synthesize window;
@synthesize navigationController, toolbar;
@synthesize dataManager, refreshButtonItem, activityIndicatorItem;

- (void)applicationDidFinishLaunching:(UIApplication *)application {	
	NSInteger myId = 6376832;
	NSString *myKey = @"5636775624194f22c6362e39225c51";
	dataManager = [[MADataManager alloc] initWithMemberIdAndKey:myId key:myKey ];
	//[self startLoadingData];
	
	//http://blog.jayway.com/2009/03/22/uitoolbars-in-iphone-os-2x/
	MAEventTableViewController *eventTableViewController = [[MAEventTableViewController alloc] init];	
	UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:eventTableViewController];
	MAToolbarController* toolbarController = [[MAToolbarController alloc] initWithContentViewControllerAndDataManager:navController manager:dataManager];
	[window addSubview:toolbarController.view];
	[dataManager setTableViewController:eventTableViewController];

	/*
	
	// create the toolbar at the bottom
	CGRect toolbarRect = CGRectMake(0, screenRect.size.height - toolbarHeight + statusBarHeight, screenRect.size.width, toolbarHeight);
	UIToolbar *aToolbar = [[UIToolbar alloc] initWithFrame:toolbarRect];
	aToolbar.barStyle = UIBarStyleBlackOpaque;
	self.toolbar = aToolbar;
	[aToolbar release];
	[self createToolbarItems];
	[navigationController addSubview:toolbar];
	*/
	
	// Configure and show the window
	[window makeKeyAndVisible];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}

- (void)dealloc {
	[navigationController release];
	[toolbar release];
	[dataManager release];
	[window release];
	[super dealloc];
}

@end

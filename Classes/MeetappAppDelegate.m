//
//  MeetappAppDelegate.m
//  Meetapp
//
//  Created by Steven Lehrburger on 3/23/09.
//  Copyright 2009 Steven Lehrburger. All rights reserved.
//

#import "MeetappAppDelegate.h"
#import "OrganizeTableViewController.h"
#import "AttendTableViewController.h"
#import "SettingsViewController.h"

@implementation MeetappAppDelegate

@synthesize window, tabBarController, toolbar, dataManager;

- (void)applicationDidFinishLaunching:(UIApplication *)application { 
	NSInteger myId = 6376832;
	NSString *myKey = @"5636775624194f22c6362e39225c51";
	http://api.meetup.com/groups.json/?member_id=6376832
	dataManager = [[MADataManager alloc] initWithMemberIdAndKey:myId key:myKey ];
	[dataManager updateAllData];
	
	// this helps in debugging, so that you know "exactly" where your views are placed;
	// if you see "red", you are looking at the bare window, otherwise use black
	window.backgroundColor = [UIColor redColor];
	
	//set up a nav controller for each window (rather than a local one for all windows as in the blog WHY??)
	UINavigationController *organizeNavigationController;
	UINavigationController *attendNavigationController;
	UINavigationController *settingsNavigationController;

	
	// set up the window
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[window setBackgroundColor:[UIColor blackColor]];
	
	// make the status bar black to match everything
	[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
	
	NSInteger toolbarHeight = 40;	
	NSInteger statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;

	
	// create the toolbar at the bottom
	CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
	CGRect toolbarRect = CGRectMake(0, screenRect.size.height - toolbarHeight + statusBarHeight, screenRect.size.width, toolbarHeight);
	UIToolbar *aToolbar = [[UIToolbar alloc] initWithFrame:toolbarRect];
	aToolbar.barStyle = UIBarStyleBlackOpaque;
	self.toolbar = aToolbar;
	[aToolbar release];
	[self createToolbarItems];
	[window addSubview:toolbar];
	
	// create tab bar controller and array to hold the view controllers
	UITabBarController *aTabBarController = [[UITabBarController alloc] init];
	CGRect tabBarRect = CGRectMake(0, statusBarHeight, screenRect.size.width, screenRect.size.height - toolbarHeight);
	aTabBarController.view.frame = tabBarRect;
	self.tabBarController = aTabBarController;
	[aTabBarController release];
	
	NSMutableArray *localControllersArray = [[NSMutableArray alloc] initWithCapacity:3];

	
	// setup the first view controller (Root view controller)
	OrganizeTableViewController *organizeTableViewController;
	AttendTableViewController *attendTableViewController;	SettingsViewController *settingsViewController;
	organizeTableViewController = [[OrganizeTableViewController alloc] initWithTabBarAndDataManager:dataManager];
	attendTableViewController = [[AttendTableViewController alloc] initWithTabBarAndDataManager:dataManager];
	settingsViewController = [[SettingsViewController alloc] initWithTabBar];

	
	// create the nav controller and add the root view controller as its first view
	organizeNavigationController = [[UINavigationController alloc] initWithRootViewController:organizeTableViewController];
	attendNavigationController = [[UINavigationController alloc] initWithRootViewController:attendTableViewController];
	settingsNavigationController = [[UINavigationController alloc] initWithRootViewController:settingsViewController];
	
	// make them all black
	organizeNavigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
	attendNavigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
	settingsNavigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
	
	// add the new nav controller (with the root view controller inside it) to the array of controllers
	[localControllersArray addObject:organizeNavigationController];
	[localControllersArray addObject:attendNavigationController];
	[localControllersArray addObject:settingsNavigationController];

	// release since we are done with this for now
	[organizeNavigationController release];
	[attendNavigationController release];
	[settingsNavigationController release];
	
	[organizeTableViewController release];
	[attendTableViewController release];
	[settingsViewController release];
	
	
	// load up our tab bar controller with the view controllers
	tabBarController.viewControllers = localControllersArray;
	
	// release the array because the tab bar controller now has it
	[localControllersArray release];
	
	// add the tabBarController as a subview in the window
	[window addSubview:tabBarController.view];
	
	// need this last line to display the window (and tab bar controller)
	[window makeKeyAndVisible];
}


- (void)dealloc {
	[toolbar release];
	[dataManager release];
	[tabBarController release];
	[window release];
	[super dealloc];
}

- (void)createToolbarItems
{	
	// create the system-defined "OK or Done" button
	UIBarButtonItem *systemItem = [[UIBarButtonItem alloc]
																 initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
																 target:self action:@selector(action:)];

	// flex item used to separate the left groups items and right grouped items
	UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
																																						target:nil
																																						action:nil];
	
	
	// create a bordered style button with custom title	
	NSInteger toolbarHeight = 40;	
	NSInteger statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
	
	
	CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
	CGRect updateLabelRect = CGRectMake(200, screenRect.size.height - toolbarHeight + statusBarHeight, screenRect.size.width - 200, toolbarHeight);
	UILabel *updateLabel = [[UILabel alloc] initWithFrame:updateLabelRect];
	updateLabel.backgroundColor = [UIColor clearColor];
	updateLabel.opaque = NO;
	updateLabel.textColor = [UIColor whiteColor];
	updateLabel.highlightedTextColor = [UIColor whiteColor];
	updateLabel.text = @"last updated on";
	UIBarButtonItem *lastUpdateItem = [[UIBarButtonItem alloc] init];
	lastUpdateItem.customView = updateLabel;
	
	NSArray *items = [NSArray arrayWithObjects: systemItem, flexItem, lastUpdateItem, nil];
	[toolbar setItems:items animated:NO];
	
	[systemItem release];
	[flexItem release];
	[updateLabel release];
	[lastUpdateItem release];
}


@end

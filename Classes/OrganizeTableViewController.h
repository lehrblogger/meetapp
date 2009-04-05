//
//  OrganizeTableViewController.h
//  Meetapp
//
//  Created by Steven Lehrburger on 3/23/09.
//  Copyright 2009 Steven Lehrburger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MADataManager.h"


@interface OrganizeTableViewController : UITableViewController {
	MADataManager *dataManager;
	NSMutableArray *organizeEventsArray;
}

@property(retain) MADataManager *dataManager;
@property(retain)	NSMutableArray *organizeEventsArray;

-(id) initWithTabBarAndDataManager:(MADataManager*)aDataManager;

@end

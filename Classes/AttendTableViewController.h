//
//  AttendTableViewController.h
//  Meetapp
//
//  Created by Steven Lehrburger on 3/23/09.
//  Copyright 2009 Steven Lehrburger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MADataManager.h"


@interface AttendTableViewController : UITableViewController {
	MADataManager *dataManager;
	NSMutableArray *attendEventsArray;
}

@property(retain) MADataManager *dataManager;
@property(retain)	NSMutableArray *attendEventsArray;

-(id) initWithTabBarAndDataManager:(MADataManager*)aDataManager;

@end

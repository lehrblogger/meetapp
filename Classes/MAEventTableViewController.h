//
//  AttendTableViewController.h
//  Meetapp
//
//  Created by Steven Lehrburger on 3/23/09.
//  Copyright 2009 Steven Lehrburger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAEventTableViewController : UITableViewController {
	NSMutableArray *eventsArray;
}

@property(retain)	NSMutableArray *eventsArray;

- (void)reloadTableData:(NSMutableArray*)events;

@end

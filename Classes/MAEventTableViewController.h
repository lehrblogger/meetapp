//
//  AttendTableViewController.h
//  Meetapp
//
//  Created by Steven Lehrburger on 3/23/09.
//  Copyright 2009 Steven Lehrburger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAEventTableViewController : UITableViewController {
	NSString *memberId;
	NSMutableArray *attendEventsArray;
	NSMutableArray *organizeEventsArray;
}

@property (retain) NSString *memberId;
@property (retain) NSMutableArray *attendEventsArray;
@property (retain) NSMutableArray *organizeEventsArray;

- (id) initWithMemberId:(NSString*)aMemberId;
- (void) reloadTableData:(NSMutableArray*)events;
- (void)recreateFilteredArrays:(NSMutableArray*)events;

@end

//
//  AttendTableViewController.h
//  Meetapp
//
//  Created by Steven Lehrburger on 3/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AttendTableViewController : UITableViewController {
	NSMutableArray *attendEventsArray;
}

@property (nonatomic, retain) NSMutableArray *attendEventsArray;

-(id)initWithTabBar;

@end

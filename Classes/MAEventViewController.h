//
//  AttendEventViewController.h
//  Meetapp
//
//  Created by Steven Lehrburger on 3/26/09.
//  Copyright 2009 Steven Lehrburger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAEventData.h"

@interface MAEventViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	MAEventData *eventData;
	IBOutlet UITableView *tableView;
	NSDateFormatter *dateFormatter;
	NSIndexPath *selectedIndexPath;
}

@property (nonatomic, retain) MAEventData *eventData;

- (id)initWithNibNameAndEventData:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil event:(MAEventData*)aEventData;

@end

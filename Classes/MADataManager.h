//
//  MADataManager.h
//  Meetapp
//
//  Created by Steven Lehrburger on 4/5/09.
//  Copyright 2009 Steven Lehrburger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCURLConnection.h"
#import "MAEventTableViewController.h"

@interface MADataManager : NSObject <LCURLConnectionDelegate> {
	NSString *memberId;
	NSString *apiKey;
	
	NSMutableArray *groupList;
	NSMutableArray *eventList;
	
	NSDate *lastUpdated;
	MAEventTableViewController *eventTableViewController;
}

@property(retain) NSString *memberId;
@property(retain) NSString *apiKey;

@property(retain) NSMutableArray *groupList;
@property(retain) NSMutableArray *eventList;

@property(retain) NSDate *lastUpdated;
@property(retain) MAEventTableViewController *eventTableViewController;

- (id) initWithMemberIdAndKey:(NSString*)aMemberId key:(NSString*)aKey;
- (void) updateAllData;
- (void) finishGroupListUpdate:(NSMutableArray*)aGroupDataArray;
- (void) finishEventListUpdate:(NSMutableArray*)aEventDataArray;
- (void) beginGroupListUpdate;
- (void) beginEventListUpdate:(NSInteger)aGroupId;
- (NSString*) getLastUpdatedString;
- (void) setTableViewController:(MAEventTableViewController*)eventTableViewController;

@end

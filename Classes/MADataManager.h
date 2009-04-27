//
//  MADataManager.h
//  Meetapp
//
//  Created by Steven Lehrburger on 4/5/09.
//  Copyright 2009 Steven Lehrburger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCURLConnection.h"


@interface MADataManager : NSObject <LCURLConnectionDelegate> {
	NSInteger memberId;
	NSString *key;
	
	NSMutableArray *groupList;
	NSMutableArray *eventList;
	
	NSMutableArray *organizeEventsArray;
	NSMutableArray *attendEventsArray;
	
	NSDate *lastUpdated;
}

@property(assign) NSInteger memberId;
@property(retain) NSString *key;
@property(retain) NSMutableArray *groupList;
@property(retain) NSMutableArray *eventList;

@property(retain) NSMutableArray *organizeEventsArray;
@property(retain) NSMutableArray *attendEventsArray;
@property(retain) NSDate *lastUpdated;

- (id) initWithMemberIdAndKey:(NSInteger)aMemberId key:(NSString*)aKey;
- (void) updateAllData;
- (void) finishGroupListUpdate:(NSMutableArray*)aGroupDataArray;
- (void) finishEventListUpdate:(NSMutableArray*)aEventDataArray;
- (void) beginGroupListUpdate;
- (void) beginEventListUpdate:(NSInteger)aGroupId;

- (NSString*) getLastUpdatedString;

@end

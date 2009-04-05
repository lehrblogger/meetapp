//
//  MADataManager.h
//  Meetapp
//
//  Created by Steven Lehrburger on 4/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MADataManager : NSObject {
	NSInteger memberId;
	NSString *key;
	
	NSMutableArray *groupList;
	NSMutableData *jsonGroupData;
	NSMutableArray *groupDataArray;
	
	NSMutableArray *organizeEventsArray;
	NSMutableArray *attendEventsArray;
	
	NSDate *lastUpdated;
}

@property(assign) NSInteger memberId;
@property(retain) NSString *key;
@property(retain) NSMutableArray *groupList;
@property(retain) NSMutableData *jsonGroupData;
@property(retain) NSMutableArray *groupDataArray;
@property(retain) NSMutableArray *organizeEventsArray;
@property(retain) NSMutableArray *attendEventsArray;
@property(retain) NSDate *lastUpdated;

- (id) initWithMemberIdAndKey:(NSInteger)aMemberId key:(NSString*)aKey;
- (void) beginAllDataUpdate;
- (void) finishAllDataUpdate;
- (void) groupListUpdate;


@end

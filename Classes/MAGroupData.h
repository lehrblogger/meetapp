//
//  MAEventData.h
//  Meetapp
//
//  Created by Steven Lehrburger on 3/30/09, based on work by David Nolen.
//  Copyright 2009 Steven Lehrburger. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MAGroupData : NSObject// <NSCoding>
{
	NSInteger groupId;
	NSString *groupName;
	NSURL *groupURL;
	NSDate *updated;
	NSInteger numMembers;
	NSDate *created;
	NSURL *photoURL;
	NSString *description;
	NSNumber *lat;
	NSNumber *lon;
	NSString *country;
	NSString *city;
	NSString *state;
	NSInteger zip;
	NSURL *organizerprofileURL;
	NSInteger daysLeft;
}


@property(nonatomic, assign) NSInteger groupId;
@property(nonatomic, copy) NSString *groupName;
@property(nonatomic, copy) NSURL *groupURL;
@property(nonatomic, copy) NSDate *updated;
@property(nonatomic, assign)NSInteger numMembers;
@property(nonatomic, copy) NSDate *created;
@property(nonatomic, copy) NSURL *photoURL;
@property(nonatomic, copy) NSString *description;
@property(nonatomic, copy) NSNumber *lat;
@property(nonatomic, copy) NSNumber *lon;
@property(nonatomic, copy) NSString *country;
@property(nonatomic, copy) NSString *city;
@property(nonatomic, copy) NSString *state;
@property(nonatomic, assign)NSInteger zip;
@property(nonatomic, copy) NSURL *organizerprofileURL;
@property(nonatomic, assign)NSInteger daysLeft;

- (id) initWithDictionary:(NSDictionary*)aGroupData;
- (NSString*) getName;
- (NSString*) getOrganizerProfileURL;


@end

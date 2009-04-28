//
//  MAEventData.h
//  Meetapp
//
//  Created by Steven Lehrburger on 3/30/09, based on work by David Nolen.
//  Copyright 2009 Steven Lehrburger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAGroupData.h"


@interface MAEventData : NSObject// <NSCoding>
{
	MAGroupData *group;
	
	NSString *groupName;
	NSString *eventName;
	NSString *description;
	NSInteger eventId;
	NSDate *time;
	NSDate *updated;
	NSURL *eventURL;
	NSURL *photoURL;
	//NSArray *questions":[],
	
	NSNumber *fee;
	NSString *feeDesc;
	NSString *feeCurrency;
	NSString *isMeetup;
	NSString *myRsvp;
	NSInteger rsvpCount;
	NSInteger attendeeCount;
	
	NSString *venueName;
	NSNumber *venueLat;
	NSNumber *venueLon;
	NSNumber *lat;
	NSNumber *lon;
}

@property(nonatomic, retain) MAGroupData *group;

@property(nonatomic, copy) NSString *groupName;
@property(nonatomic, copy) NSString *eventName;
@property(nonatomic, copy) NSString *description;
@property(nonatomic, assign) NSInteger eventId;
@property(nonatomic, copy) NSDate *time;
@property(nonatomic, copy) NSDate *updated;
@property(nonatomic, copy) NSURL *eventURL;
@property(nonatomic, copy) NSURL *photoURL;
//NSArray *questions":[],

@property(nonatomic, copy) NSNumber *fee;
@property(nonatomic, copy) NSString *feeDesc;
@property(nonatomic, copy) NSString *feeCurrency;
@property(nonatomic, copy) NSString *isMeetup;
@property(nonatomic, copy) NSString *myRsvp;
@property(nonatomic, assign) NSInteger rsvpCount;
@property(nonatomic, assign) NSInteger attendeeCount;

@property(nonatomic, copy) NSString *venueName;
@property(nonatomic, copy) NSNumber *venueLat;
@property(nonatomic, copy) NSNumber *venueLon;
@property(nonatomic, copy) NSNumber *lat;
@property(nonatomic, copy) NSNumber *lon;
/*
- (id) initWithGroupName:(NSString *)aGroupName
								eventName:(NSString *)aEventName
              description:(NSString *)aDescription
                  eventId:(NSInteger)aEventId
                     time:(NSDate *)aTime
                  updated:(NSDate *)aUpdated
                 eventURL:(NSURL *)aEventURL
                 photoURL:(NSURL *)aPhotoURL
                      fee:(NSNumber *)aFee
                  feeDesc:(NSString *)aFeeDesc
	      		  feeCurrency:(NSString *)aFeeCurrency
                 isMeetup:(NSString *)aIsMeetup
                   myRsvp:(NSString *)aMyRsvp
			        	rsvpCount:(NSInteger)aRsvpCount
            attendeeCount:(NSInteger)aAttendeeCount
	 		          venueName:(NSString *)aVenueName
			           venueLat:(NSNumber *)aVenueLat
	  		         venueLon:(NSNumber *)aVenueLon
                      lat:(NSNumber *)aLat
                      lon:(NSNumber *)aLon;
*/
- (id) initWithDictionary:(NSDictionary *)aEventData group:(MAGroupData *)aGroup;
- (MAGroupData*) getGroup;

@end

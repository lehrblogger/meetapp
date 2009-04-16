//
//  MAEventData.m
//  Meetapp
//
//  Created by Steven Lehrburger on 3/30/09, based on work by David Nolen.
//  Copyright 2009 Steven Lehrburger. All rights reserved.
//

#import "MAEventData.h"

@implementation MAEventData

@synthesize groupName, eventName, desc, eventId, time, updated, eventURL, photoURL, fee, feeDesc, feeCurrency, isMeetup, myRsvp, rsvpCount, attendeeCount, venueName, venueLat, venueLon, lat, lon;
/*
- (id) initWithGroupName:(NSString *)aGroupName
							  eventName:(NSString *)aEventName
              desc:(NSString *)aDescription
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
				          	  lon:(NSNumber *)aLon  {
  self = [super init];
  if (self != nil) 
  {
		self.groupName = aGroupName;
		self.eventName = aEventName;
		self.desc = aDescription;
		self.eventId = aEventId;
		self.time = aTime;
		self.updated = aUpdated;
		self.eventURL = aEventURL;
		self.photoURL = aPhotoURL;
		self.fee = aFee;
		self.feeDesc = aFeeDesc;
		self.feeCurrency = aFeeCurrency;
		self.isMeetup = aIsMeetup;
		self.myRsvp = aMyRsvp;
		self.rsvpCount = aRsvpCount;
		self.attendeeCount = aAttendeeCount;
		self.venueName = aVenueName;
		self.venueLat = aVenueLat;
		self.venueLon = aVenueLon;
		self.lat = aLat;
		self.lon = aLon;
	}
  return self;
}
*/
- (id) initWithDictionary:(NSDictionary *)aEventData {
	self = [super init];
  if (self != nil) 
  {
		self.groupName = [aEventData objectForKey:@"group_name"];
		self.eventName = [aEventData objectForKey:@"name"];
		self.desc = [aEventData objectForKey:@"description"];
		self.eventId = [[aEventData objectForKey:@"id"] integerValue];
		self.time = [NSDate dateWithString:[aEventData objectForKey:@"time"]];
		self.updated = [NSDate dateWithString:[aEventData objectForKey:@"updated"]];
		self.eventURL = [NSURL URLWithString:[aEventData objectForKey:@"event_url"]];
		self.photoURL = [NSURL URLWithString:[aEventData objectForKey:@"photo_url"]];
		self.fee = [NSNumber numberWithFloat: [[aEventData objectForKey:@"fee"] floatValue]];
		self.feeDesc = [aEventData objectForKey:@"feedesc"];
		self.feeCurrency = [aEventData objectForKey:@"feecurrency"];
		self.isMeetup = [aEventData objectForKey:@"ismeetup"];
		self.myRsvp = [aEventData objectForKey:@"myrsvp"];
		self.rsvpCount = [[aEventData objectForKey:@"rsvpcount"] integerValue];
		self.attendeeCount = [[aEventData objectForKey:@"attendee_count"] integerValue];
		self.venueName = [aEventData objectForKey:@"venue_name"];
		self.venueLat = [NSNumber numberWithFloat: [[aEventData objectForKey:@"venue_lat"] floatValue]];
		self.venueLon = [NSNumber numberWithFloat: [[aEventData objectForKey:@"venue_lon"] floatValue]];
		self.lat = [NSNumber numberWithFloat: [[aEventData objectForKey:@"lat"] floatValue]];
		self.lon = [NSNumber numberWithFloat: [[aEventData objectForKey:@"lon"] floatValue]];
	}
  return self;
}

	
- (id) initWithCoder:(NSCoder*)coder {
  self = [super init];
  
  if(self != nil)
  {
	self.groupName = [coder decodeObjectForKey:@"groupName"];
	self.eventName = [coder decodeObjectForKey:@"eventName"];
	self.desc = [coder decodeObjectForKey:@"description"];
	self.eventId = [coder decodeIntForKey:@"eventId"];
	self.time = [coder decodeObjectForKey:@"time"];
	self.updated = [coder decodeObjectForKey:@"updated"];
	self.eventURL = [coder decodeObjectForKey:@"eventURL"];
	self.photoURL = [coder decodeObjectForKey:@"photoURL"];
	self.fee = [coder decodeObjectForKey:@"fee"];
	self.feeDesc = [coder decodeObjectForKey:@"feeDesc8"];
	self.feeCurrency = [coder decodeObjectForKey:@"feeCurrency"];
	self.isMeetup = [coder decodeObjectForKey:@"isMeetup"];
	self.myRsvp = [coder decodeObjectForKey:@"myRsvp"];
	self.rsvpCount = [coder decodeIntForKey:@"rsvpCount"];
	self.attendeeCount = [coder decodeIntForKey:@"attendeeCount"];
	self.venueName = [coder decodeObjectForKey:@"venueName"];
	self.venueLat = [coder decodeObjectForKey:@"venueLat"];
	self.venueLon = [coder decodeObjectForKey:@"venueLon"];
	self.lat = [coder decodeObjectForKey:@"lat"];
	self.lon = [coder decodeObjectForKey:@"lon"];
  }
  
  return self;
}

- (void) encodeWithCoder:(NSCoder*)coder {
  [coder encodeObject:self.groupName forKey:@"groupName"];
  [coder encodeObject:self.eventName forKey:@"eventName"];
  [coder encodeObject:self.desc forKey:@"description"];
  [coder encodeObject:self.eventId forKey:@"eventId"];
  [coder encodeObject:self.time forKey:@"time"];
  [coder encodeObject:self.updated forKey:@"updated"];
  [coder encodeObject:self.eventURL forKey:@"eventURL"];	
  [coder encodeObject:self.photoURL forKey:@"photoURL"];
  [coder encodeObject:self.fee forKey:@"fee"];
  [coder encodeObject:self.feeDesc forKey:@"feeDesc"];
  [coder encodeObject:self.feeCurrency forKey:@"feeCurrency"];
  [coder encodeObject:self.isMeetup forKey:@"isMeetup"];
  [coder encodeObject:self.myRsvp forKey:@"myRsvp"];
  [coder encodeObject:self.rsvpCount forKey:@"rsvpCount"];
  [coder encodeObject:self.attendeeCount forKey:@"attendeeCount"];	
  [coder encodeObject:self.venueName forKey:@"venueName"];	
  [coder encodeObject:self.venueLat forKey:@"venueLat"];	
  [coder encodeObject:self.venueLon forKey:@"venueLon"];
  [coder encodeObject:self.lat forKey:@"lat"];
  [coder encodeObject:self.lon forKey:@"lon"];	
}

- (NSString*) description {
  return [NSString stringWithFormat:@"<Group: %@  Event: %@, id:%d>", self.groupName, self.eventName, self.eventId];
}

- (void) dealloc {
  [self.groupName release];
  [self.eventName release];
  [self.desc release];
  //[self.eventId release];
  [self.time release];
  [self.updated release];
  [self.eventURL release];
  [self.photoURL release];
  [self.fee release];
  [self.feeDesc release];
  [self.feeCurrency release];
  [self.isMeetup release];
  [self.myRsvp release];
  //[self.rsvpCount release];
  //[self.attendeeCount release];
  [self.venueName release];
  [self.venueLat release];
  [self.venueLon release];
  [self.lat release];
  [self.lon release];
  [super dealloc];
}


@end

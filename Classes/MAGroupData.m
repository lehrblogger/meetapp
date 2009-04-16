//
//  MAGroupData.m
//  Meetapp
//
//  Created by Steven Lehrburger on 3/30/09, based on work by David Nolen.
//  Copyright 2009 Steven Lehrburger. All rights reserved.
//

#import "MAGroupData.h"


@implementation MAGroupData

@synthesize groupId, groupName, groupURL, updated, numMembers, created, photoURL, description, lat, lon, country, city, state, zip, organizerprofileURL, daysLeft;

- (id) initWithDictionary:(NSDictionary *)aGroupData {
	self = [super init];
  if (self != nil) 
  {
		self.groupId = [[aGroupData objectForKey:@"id"] integerValue];
		self.groupName = [aGroupData objectForKey:@"name"];
		self.groupURL = [NSURL URLWithString:[aGroupData objectForKey:@"link"]];
		self.updated = [NSDate dateWithString:[aGroupData objectForKey:@"updated"]];
		self.numMembers = [[aGroupData objectForKey:@"members"] integerValue];
		self.created = [NSDate dateWithString:[aGroupData objectForKey:@"created"]];
		self.photoURL = [NSURL URLWithString:[aGroupData objectForKey:@"photo_url"]];
		self.description = [aGroupData objectForKey:@"description"];
		self.lat = [NSNumber numberWithFloat: [[aGroupData objectForKey:@"lat"] floatValue]];
		self.lon = [NSNumber numberWithFloat: [[aGroupData objectForKey:@"lon"] floatValue]];
		self.country =  [aGroupData objectForKey:@"country"];
		self.city =  [aGroupData objectForKey:@"city"];
		self.state =  [aGroupData objectForKey:@"state"];
		self.zip = [[aGroupData objectForKey:@"zip"] integerValue];
		self.organizerprofileURL = [NSURL URLWithString:[aGroupData objectForKey:@"organizerProfileURL"]];
		self.daysLeft = [[aGroupData objectForKey:@"daysleft"] integerValue];
	}
  return self;
}


- (id) initWithCoder:(NSCoder*)coder {
  self = [super init];
  
  if(self != nil)
  {
		self.groupId = [coder decodeObjectForKey:@"groupId"];
		self.groupName = [coder decodeObjectForKey:@"groupName"];
		self.groupURL = [coder decodeObjectForKey:@"groupURL"];
		self.updated = [coder decodeObjectForKey:@"updated"];
		self.numMembers = [coder decodeObjectForKey:@"numMembers"];
		self.created = [coder decodeObjectForKey:@"created"];
		self.photoURL = [coder decodeObjectForKey:@"photoURL"];
		self.description = [coder decodeObjectForKey:@"description"];
		self.lat = [coder decodeObjectForKey:@"lat"];
		self.lon = [coder decodeObjectForKey:@"lon"];
		self.country = [coder decodeObjectForKey:@"country"];
		self.city = [coder decodeObjectForKey:@"city"];
		self.state = [coder decodeObjectForKey:@"state"];
		self.zip = [coder decodeObjectForKey:@"zip"];
		self.organizerprofileURL = [coder decodeObjectForKey:@"organizerProfileURL"];
		self.daysLeft = [coder decodeObjectForKey:@"daysLeft"];
  }
  
  return self;
}

- (void) encodeWithCoder:(NSCoder*)coder {
  [coder encodeObject:self.groupId forKey:@"groupId"];
  [coder encodeObject:self.groupName forKey:@"groupName"];
  [coder encodeObject:self.groupURL forKey:@"groupURL"];
  [coder encodeObject:self.updated forKey:@"updated"];
  [coder encodeObject:self.numMembers forKey:@"numMembers"];
  [coder encodeObject:self.created forKey:@"created"];
  [coder encodeObject:self.photoURL forKey:@"photoURL"];
  [coder encodeObject:self.description forKey:@"description"];
  [coder encodeObject:self.lat forKey:@"lat"];
  [coder encodeObject:self.lon forKey:@"lon"];
  [coder encodeObject:self.country forKey:@"country"];
  [coder encodeObject:self.city forKey:@"city"];
  [coder encodeObject:self.state forKey:@"state"];
  [coder encodeObject:self.zip forKey:@"zip"];
  [coder encodeObject:self.organizerprofileURL forKey:@"organizerProfileURL"];
  [coder encodeObject:self.daysLeft forKey:@"daysLeft"];
}

- (NSString*) basicData {
  return [NSString stringWithFormat:@"<Group: %@, id:%d>", self.groupName, self.groupId];
}

- (void) dealloc {
//  [self.groupId release];
  [self.groupName release];
  [self.groupURL release];
  [self.updated release];
//  [self.numMembers release];
  [self.created release];
  [self.photoURL release];
  [self.description release];
  [self.lat release];
  [self.lon release];
  [self.country release];
  [self.city release];
  [self.state release];
//  [self.zip release];
  [self.organizerprofileURL release];
//  [self.daysLeft release];
  [super dealloc];
}


@end

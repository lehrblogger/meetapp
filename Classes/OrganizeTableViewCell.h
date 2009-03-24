//
//  OrganizeTableViewCell.h
//  Meetapp
//
//  Created by Steven Lehrburger on 3/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface OrganizeTableViewCell : UITableViewCell {
	UILabel *name;
}

- (void) setData:(NSString*)nameString;

@end

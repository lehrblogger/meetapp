//
//  OrganizeTableViewCell.m
//  Meetapp
//
//  Created by Steven Lehrburger on 3/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "OrganizeTableViewCell.h"


@implementation OrganizeTableViewCell

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        // Initialization code
		name = [[UILabel alloc] initWithFrame:frame];
		[self addSubview:name];
    }
    return self;
}


- (void) setData:(NSString*)nameString {
	name.text = nameString;
	[name sizeToFit];
	[self setNeedsDisplay];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
	[name release];
    [super dealloc];
}


@end

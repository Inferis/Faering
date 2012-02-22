//
//  PlaceHolderCell.m
//  Faering
//
//  Created by Tom Adriaenssen on 22/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import "PlaceHolderCell.h"

@implementation PlaceHolderCell

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryView = nil;
        self.textLabel.textAlignment = UITextAlignmentCenter;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self removeLine];
    }
    
    return self;
}

@end

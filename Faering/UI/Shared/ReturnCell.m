//
//  ReturnCell.m
//  Faering
//
//  Created by Tom Adriaenssen on 22/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import "ReturnCell.h"

@implementation ReturnCell

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.imageView.image = [UIImage imageNamed:@"left-backarrow-normal.png"];
        self.imageView.highlightedImage = [UIImage imageNamed:@"left-backarrow-highlight.png"];
        self.accessoryView = nil;
        [self removeLine];
    }
    
    return self;
}

@end

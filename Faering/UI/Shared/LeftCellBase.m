//
//  LeftCellBase.m
//  Faering
//
//  Created by Tom Adriaenssen on 18/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import "LeftCellBase.h"
#import "UIColor+Hex.h"

@interface LeftCellBase () {
    UIImageView* _line;
}

@end

@implementation LeftCellBase

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        _line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"accounts-line.png"]];
        _line.backgroundColor = [UIColor clearColor];
        _line.opaque = NO;
        [self.contentView addSubview:_line];
        
        self.selectedBackgroundView = [[UIImageView alloc] init];
        
        self.textLabel.textColor = [UIColor colorWithWhite:1 alpha:0.6];
        self.textLabel.highlightedTextColor = [UIColor colorWithHex:0xfff5e1];
        
        UIButton* detailButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [detailButton setImage:[UIImage imageNamed:@"left-arrow-normal.png"] forState:UIControlStateNormal];
        [detailButton setImage:[UIImage imageNamed:@"left-arrow-highlight.png"] forState:UIControlStateHighlighted];
        detailButton.frame = (CGRect) { 0, 0, 29, 30 };
        [detailButton addTarget:self action:@selector(pressedDetail) forControlEvents:UIControlEventTouchUpInside];
        self.accessoryView = detailButton;
    }
    
    return self;
}

- (void)dealloc {
    [self removeLine];
}

- (void)removeLine {
    [_line removeFromSuperview];
    _line = nil;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.accessoryView.frame.origin.x > 270)
        self.accessoryView.frame = CGRectOffset(self.accessoryView.frame, -44, 0);
    _line.frame = (CGRect) { 0, CGRectGetMaxY(self.bounds)-CGRectGetHeight(_line.frame), _line.frame.size };
}


@end

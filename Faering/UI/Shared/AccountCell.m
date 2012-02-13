//
//  AccountCell.m
//  Faering
//
//  Created by Tom Adriaenssen on 12/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import "AccountCell.h"
#import "Account.h"

@interface AccountCell () {
    UIImageView* _line;
    id<AccountCellDelegate> _delegate;
}

@end

@implementation AccountCell

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        _line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"accounts-line.png"]];
        _line.backgroundColor = [UIColor clearColor];
        _line.opaque = NO;
        [self.contentView addSubview:_line];

        self.selectedBackgroundView = [[UIImageView alloc] init];
        
        self.textLabel.textColor = [UIColor colorWithWhite:1 alpha:0.7];
        self.textLabel.highlightedTextColor = [UIColor colorWithWhite:1 alpha:1];

        UIButton* detailButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [detailButton setImage:[UIImage imageNamed:@"left-disclosure-detail.png"] forState:UIControlStateNormal];
        [detailButton setImage:[UIImage imageNamed:@"left-disclosure-detail-highlight.png"] forState:UIControlStateHighlighted];
        detailButton.frame = (CGRect) { 0, 0, 29, 30 };
        [detailButton addTarget:self action:@selector(pressedDetail) forControlEvents:UIControlEventTouchUpInside];
        self.accessoryView = detailButton;
    }
    
    return self;
}

- (void)dealloc {
    _delegate = nil;
    _line = nil;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.accessoryView.frame.origin.x > 270)
        self.accessoryView.frame = CGRectOffset(self.accessoryView.frame, -44, 0);
    _line.frame = (CGRect) { 0, CGRectGetMaxY(self.bounds)-CGRectGetHeight(_line.frame), _line.frame.size };
}

- (void)configure:(Account*)account delegate:(id<AccountCellDelegate>) delegate {
    self.textLabel.text = account.name;
    _delegate = delegate;
}

- (void)pressedDetail {
    [_delegate accountCellDidPressDetail:self];
}

@end

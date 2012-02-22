//
//  AccountCell.m
//  Faering
//
//  Created by Tom Adriaenssen on 12/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import "AccountCell.h"
#import "Account.h"
#import "UITableViewCell+AutoDequeue.h"

@interface AccountCell () {
}

@end

@implementation AccountCell

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
    }
    
    return self;
}

- (void)dealloc {
}

- (void)configure:(Account*)account {
    self.textLabel.text = account.name;
}

@end

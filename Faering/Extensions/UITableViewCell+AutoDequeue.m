//
//  UITableViewCell+AutoDequeue.m
//  Faering
//
//  Created by Tom Adriaenssen on 12/02/12.
//  Copyright (c) 2012 Adriaenssen BVBA. All rights reserved.
//

#import "UITableViewCell+AutoDequeue.h"

@implementation UITableViewCell (AutoDequeue)

+ (id)tableViewAutoDequeueCell:(UITableView*)tableView {
    NSString *cellIdentifier = NSStringFromClass(self);
    
    id cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [self alloc];
        if ([cell respondsToSelector:@selector(initWithReuseIdentifier:)])
            cell = [cell performSelector:@selector(initWithReuseIdentifier:) withObject:cellIdentifier];
        else 
            cell = [cell initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    return cell;
}

@end

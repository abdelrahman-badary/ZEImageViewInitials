//
//  UIView+constraints.m
//  My number
//
//  Created by Abdelrahman Badary on 10/31/16.
//  Copyright © 2016 IPMagix. All rights reserved.
//

#import "UIView+constraints.h"

@implementation UIView (constraints)

- (NSLayoutConstraint *)pin:(id)item attribute:(NSLayoutAttribute)attribute
{
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:attribute
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:item
                                        attribute:attribute
                                       multiplier:1.0
                                         constant:0.0];
    
}
@end

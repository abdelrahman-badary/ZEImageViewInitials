//
//  ZEInitialsView.m
//  Pods
//
//  Created by Abdelrahman Badary on 12/27/16.
//
//

#import "ZEInitialsView.h"

@implementation ZEInitialsView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self load];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        [self load];
    }
    return self;
}

-(void)load
{
   // UIView * view = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"ZEInitialsView" owner:self options:nil] firstObject];
    NSBundle * podBundle = [NSBundle bundleForClass:self.class];
    NSURL *bundleURL = [podBundle URLForResource:@"ZEImageViewInitialsBundle" withExtension:@"bundle"];
    NSBundle *nb = [NSBundle bundleWithURL:bundleURL];
    UIView * view = [[nb loadNibNamed:@"ZEInitialsView" owner:self options:nil] firstObject];
    
    
    [self addSubview:view] ;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[self pin:view attribute:NSLayoutAttributeTop]];
    [self addConstraint:[self pin:view attribute:NSLayoutAttributeLeft]];
    [self addConstraint:[self pin:view attribute:NSLayoutAttributeBottom]];
    [self addConstraint:[self pin:view attribute:NSLayoutAttributeRight]];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

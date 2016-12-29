//
//  ZEInitialsView.m
//  Pods
//
//  Created by Abdelrahman Badary on 12/27/16.
//
//

#import "ZEInitialsView.h"


@interface ZEInitialsView ()
@property (weak, nonatomic) IBOutlet UIView *initialsView;
@property (strong , nonatomic) UIView * containerView;
@property (weak, nonatomic) IBOutlet UILabel *initialsLabel;
@property (strong , nonatomic) NSArray * colors;

@end

@implementation ZEInitialsView
@synthesize containerView  , avatarImageView, randomColors ;
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
    randomColors = YES;
    NSBundle * podBundle = [NSBundle bundleForClass:self.class];
    NSURL *bundleURL = [podBundle URLForResource:@"ZEImageViewInitialsBundle" withExtension:@"bundle"];
    NSBundle *nb = [NSBundle bundleWithURL:bundleURL];
    containerView = [[nb loadNibNamed:@"ZEInitialsView" owner:self options:nil] firstObject];
    UIColor * color1 = [UIColor colorWithRed:243.0f/255.0f green:144.0f/255.0f blue:203.0f/255.0f alpha:1.0f];

        UIColor * color2 = [UIColor colorWithRed:62.0f/255.0f green:160.0f/255.0f blue:240.0f/255.0f alpha:1.0f];
    if(!_defaultColor)
        containerView.backgroundColor = color1;
    else
        containerView.backgroundColor = _defaultColor;
    
    
    [self addSubview:containerView] ;
    containerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[self pin:containerView attribute:NSLayoutAttributeTop]];
    [self addConstraint:[self pin:containerView attribute:NSLayoutAttributeLeft]];
    [self addConstraint:[self pin:containerView attribute:NSLayoutAttributeBottom]];
    [self addConstraint:[self pin:containerView attribute:NSLayoutAttributeRight]];
    [_initialsView sizeToFit];

}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if(keyPath == @"image")
    {
        if(avatarImageView.image)
        {
            _initialsView.hidden = YES;
            containerView.backgroundColor = [UIColor clearColor];
        }
    }
}
#pragma mark - MMNSearchView proprties
-(void)setCornerRadius:(NSInteger)cornerRadius
{
    self.layer.cornerRadius = cornerRadius ;
    self.clipsToBounds = YES ;
}
-(void)setBorderWidth:(NSInteger)borderWidth
{
    self.layer.borderWidth = borderWidth ;
}
-(void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = borderColor.CGColor ;  
}
-(void)setDefaultColor:(UIColor *)defaultColor
{
    containerView.backgroundColor = defaultColor;
}
-(void)setName:(NSString *)name
{
    self.initialsLabel.text = name;
    NSString * asd = name ;

}


-(void)generateColorsArray
{
    UIColor * color1 = [UIColor colorWithRed:243.0f/255.0f green:144.0f/255.0f blue:203.0f/255.0f alpha:1.0f];
    
    UIColor * color2 = [UIColor colorWithRed:62.0f/255.0f green:160.0f/255.0f blue:240.0f/255.0f alpha:1.0f];
    
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

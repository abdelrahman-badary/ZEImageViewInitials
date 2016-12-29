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
@property (strong , nonatomic) ZERandomColorGenerator * colorGenerator;

@end

@implementation ZEInitialsView
@synthesize containerView  , avatarImageView , defaultColor , colorGenerator ;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self initView];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        [self initView];
    }
    return self;
}

-(void)initView
{
    containerView = [self getContainerViewFromNib];
    colorGenerator = [ZERandomColorGenerator sharedInstance];
    [self addSubview:containerView] ;
    [self addLayoutConstraintsToContainerView];
    [self setContainerViewBackgroundColor];
}

-(UIView *)getContainerViewFromNib
{
    NSBundle * customBundle = [NSBundle bundleForClass:self.class];
    NSURL *customBundleURL = [customBundle URLForResource:@"ZEImageViewInitialsBundle" withExtension:@"bundle"];
    
    NSBundle *podBundle = [NSBundle bundleWithURL:customBundleURL];
    UIView * view = [[podBundle loadNibNamed:@"ZEInitialsView" owner:self options:nil] firstObject];
    
    return view;
}
-(void)addLayoutConstraintsToContainerView
{
    containerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[self pin:containerView attribute:NSLayoutAttributeTop]];
    [self addConstraint:[self pin:containerView attribute:NSLayoutAttributeLeft]];
    [self addConstraint:[self pin:containerView attribute:NSLayoutAttributeBottom]];
    [self addConstraint:[self pin:containerView attribute:NSLayoutAttributeRight]];
}
-(void)setContainerViewBackgroundColor
{
    if(defaultColor)
    {
        [containerView setBackgroundColor:defaultColor];
    }
    else
    {
        [containerView setBackgroundColor:[colorGenerator getRandomColor]];
    }
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
#pragma mark - MMNSearchView proprtie setters
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
}
-(void)setFontColor:(UIColor *)fontColor
{
    [self.initialsLabel setTextColor:fontColor];
}


+(void)setColorsSet:(NSArray<UIColor *> *)colorsSet
{
    [[ZERandomColorGenerator sharedInstance] setColorsSet:colorsSet];
}
+(void)userDefaultColorSet
{

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

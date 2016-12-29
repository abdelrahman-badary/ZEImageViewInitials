//
//  ZEInitialsView.h
//  Pods
//
//  Created by Abdelrahman Badary on 12/27/16.
//
//

#import "UIView+constraints.h"
#import "ZERandomColorGenerator.h"

IB_DESIGNABLE
@interface ZEInitialsView : UIView

@property (assign , nonatomic) IBInspectable NSInteger borderWidth;
@property (assign , nonatomic) IBInspectable UIColor * borderColor ;
@property (assign , nonatomic) IBInspectable NSInteger cornerRadius ;
@property (assign , nonatomic) IBInspectable NSString * name;
@property (assign , nonatomic) IBInspectable UIColor * defaultColor;
@property (assign , nonatomic)IBInspectable UIColor * fontColor;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

+(void)setColorsSet:(NSArray <UIColor *>*)colorsSet;
+(void)userDefaultColorSet;


@end

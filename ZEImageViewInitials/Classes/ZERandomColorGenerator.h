//
//  ZERandomColorGenerator.h
//  Pods
//
//  Created by Abdelrahman Badary on 12/29/16.
//
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "UIColor+ZEColors.h"

@interface ZERandomColorGenerator : NSObject
+(instancetype)sharedInstance;
-(UIColor *)getRandomColor;
-(void)setColorsSet:(NSArray<UIColor *> *)colorSet;
-(void)useDefaultColorSet;
@end

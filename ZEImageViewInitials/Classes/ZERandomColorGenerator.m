//
//  ZERandomColorGenerator.m
//  Pods
//
//  Created by Abdelrahman Badary on 12/29/16.
//
//

#import "ZERandomColorGenerator.h"

@interface ZERandomColorGenerator ()
@property (strong , nonatomic) NSArray * colorsSet;
@property (strong , nonatomic) UIColor * lastGeneratedColor;
@end

@implementation ZERandomColorGenerator
@synthesize colorsSet, lastGeneratedColor ;
+(instancetype)sharedInstance
{
    static ZERandomColorGenerator * sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken , ^{
        sharedInstance = [[ZERandomColorGenerator alloc]init];
    });
    return sharedInstance;
}
-(instancetype)init
{
    self = [super init];
    if(self)
    {
        [self setupColorGenerator];
    }
    return self;
}
-(void)setupColorGenerator
{
    colorsSet = [self getDefaultColorsSet];
    
}
-(NSArray<UIColor *> *)getDefaultColorsSet
{
    NSMutableArray * colors = [[NSMutableArray alloc] init];
    
    [colors addObject:[UIColor ZEPinkColor]];
    [colors addObject:[UIColor ZELightOrangeColor]];
    [colors addObject:[UIColor ZESkyBlueColor]];
    [colors addObject:[UIColor ZELightBrownColor]];
    [colors addObject:[UIColor ZEDarkGreenColor]];
    [colors addObject:[UIColor ZERedColor]];
    [colors addObject:[UIColor ZEGreenColor]];
    [colors addObject:[UIColor ZEDarkBlueColor]];
    
    return [colors copy];
}

-(UIColor *)getRandomColor
{
    NSUInteger randomIndex = arc4random() % [colorsSet count];
    UIColor * randomColor = [colorsSet objectAtIndex:randomIndex];
    if([randomColor isEqual:lastGeneratedColor])
    {
        if(randomIndex+1 < [colorsSet count])
            randomColor = [colorsSet objectAtIndex:randomIndex+1];
        else
            randomColor = [colorsSet objectAtIndex:0];
    }
  
    lastGeneratedColor = randomColor;
    return randomColor;
}

-(void)useDefaultColorSet
{
    self.colorsSet = [self getDefaultColorsSet];
}
@end

//
//  ZEInitialsView.h
//  Pods
//
//  Created by Abdelrahman Badary on 12/27/16.
//
//

#import <UIKit/UIKit.h>
#import "UIView+constraints.h"
IB_DESIGNABLE
@interface ZEInitialsView : UIView

@property (assign , nonatomic) IBInspectable NSInteger borderThickniss ;
@property (assign , nonatomic) IBInspectable UIColor * borderColor ;
@property (assign , nonatomic) IBInspectable NSInteger cornerRadius ;
@property  IBInspectable BOOL randomBackgroundColor ;



@end

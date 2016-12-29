//
//  ZEViewController.m
//  ZEImageViewInitials
//
//  Created by abdelrahman-badary on 12/27/2016.
//  Copyright (c) 2016 abdelrahman-badary. All rights reserved.
//

#import "ZEViewController.h"

@interface ZEViewController ()

@end

@implementation ZEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
- (IBAction)didTapAddImageBtn:(id)sender {
    [[self.initialsView avatarImageView] setImage:[UIImage imageNamed:@"empty_avatar.jpg"]];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

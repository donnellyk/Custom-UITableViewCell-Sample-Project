//
//  SampleCell.m
//  Sample
//
//  Created by James Kelso on 11/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SampleCell.h"

@implementation SampleCell

// There are two places where this can be hooked from what I can see.
// In the layout subviews and in the viewWillTransitionToState.
// Uncomment the one with which you want to play with 'cmd + /'.

//-(void)willTransitionToState:(UITableViewCellStateMask)state {
//    [super willTransitionToState:state];
//    
//    if ((state & UITableViewCellStateShowingDeleteConfirmationMask) == UITableViewCellStateShowingDeleteConfirmationMask) {
//        
//        for (UIView *subview in self.subviews) {
//            if ([NSStringFromClass([subview class]) isEqualToString:@"UITableViewCellDeleteConfirmationControl"]) {
//                // Normal images
//                UIImage *btn_delete_img = [UIImage imageNamed:@"btn_swipetodelete_normal.png"];
//                
//                // Highlighted images
//                UIImage *btn_delete_img_highlighted = [UIImage imageNamed:@"btn_swipetodelete_pressed.png"];
//                
//                // Create button
//                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//                button.frame = CGRectMake(5, 17, 65, 34);
//                [button setBackgroundImage:btn_delete_img forState:UIControlStateNormal];
//                [button setBackgroundImage:btn_delete_img_highlighted forState:UIControlStateHighlighted];
//                
//                // Button title
//                [button.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
//                [button setTitle:NSLocalizedString(@"Delete", nil) forState:UIControlStateNormal];
//                
//                // Text color
//                button.titleLabel.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
//                button.titleLabel.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.5];
//                button.titleLabel.shadowOffset = CGSizeMake(0, -1);
//                [subview addSubview:button];
//            }
//        }
//    }
//}

-(void)layoutSubviews {
    [super layoutSubviews];
    for (UIView *subview in self.subviews) {
        if ([NSStringFromClass([subview class]) isEqualToString:@"UITableViewCellDeleteConfirmationControl"]) {
            // Normal images
            UIImage *btn_delete_img = [UIImage imageNamed:@"btn_swipetodelete_normal.png"];
            
            // Highlighted images
            UIImage *btn_delete_img_highlighted = [UIImage imageNamed:@"btn_swipetodelete_pressed.png"];
            
            // Create button
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(5, 17, 65, 34);
            [button setBackgroundImage:btn_delete_img forState:UIControlStateNormal];
            [button setBackgroundImage:btn_delete_img_highlighted forState:UIControlStateHighlighted];
            
            // Button title
            [button.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
            [button setTitle:NSLocalizedString(@"Delete", nil) forState:UIControlStateNormal];
            
            // Text color
            button.titleLabel.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
            button.titleLabel.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.5];
            button.titleLabel.shadowOffset = CGSizeMake(0, -1);
            [subview addSubview:button];
        }
    }
}



@end

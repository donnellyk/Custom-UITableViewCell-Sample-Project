//
//  SampleCell.m
//  Sample
//
//  Created by James Kelso on 11/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SampleCell.h"

@implementation SampleCell
@synthesize beingEdited;

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // So, I was able to get ride of the weird "slide in from left hand corner" thing but setting up the button here. However, I couldn't recreate the swipe so took another route.
        
        
//        // Normal images
//        UIImage *btn_delete_img = [UIImage imageNamed:@"btn_swipetodelete_normal.png"];
//        
//        // Highlighted images
//        UIImage *btn_delete_img_highlighted = [UIImage imageNamed:@"btn_swipetodelete_pressed.png"];
//        
//        // Create button
//        button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.frame = CGRectMake(5, 16, 65, 34);
//        [button setBackgroundImage:btn_delete_img forState:UIControlStateNormal];
//        [button setBackgroundImage:btn_delete_img_highlighted forState:UIControlStateHighlighted];
//        
//        // Button title
//        [button.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
//        [button setTitle:NSLocalizedString(@"Delete", nil) forState:UIControlStateNormal];
//        
//        // Text color
//        button.titleLabel.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
//        button.titleLabel.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.5];
//        button.titleLabel.shadowOffset = CGSizeMake(0, -1);
//        
//        wipe = [[UIView alloc] initWithFrame:CGRectMake(5, 16, 65, 34)];
//        wipe.backgroundColor = [UIColor whiteColor];
        
        beingEdited = NO;
    }
    return self;
}

//-(void)layoutSubviews {
//    [super layoutSubviews];
//    for (UIView *subview in self.subviews) {
//        if ([NSStringFromClass([subview class]) isEqualToString:@"UITableViewCellDeleteConfirmationControl"]) {
//            [subview addSubview:button];
//            [subview addSubview:wipe];
//        }
//    }
//}

-(UITableView*)getTableView:(UIView*)theView
{
    if (!theView.superview)
        return nil;
    
    if ([theView.superview isKindOfClass:[UITableView class]])
        return (UITableView*)theView.superview;
    
    return [self getTableView:theView.superview];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    // We suppress the Delete button by explicitly not calling
    // super's implementation
    UITableView* tableView = [self getTableView:self];
    tableView.editing = NO;
}



@end

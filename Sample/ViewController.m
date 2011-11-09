//
//  ViewController.m
//  Sample
//
//  Created by James Kelso on 11/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SampleCell.h"
#import "ViewController.h"

@implementation ViewController

@synthesize nav_item, tbl_main;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSInteger capacity = 15;
    cellStrings = [NSMutableArray arrayWithCapacity:capacity];
	for (int i = 0; i < capacity; i++)
        [cellStrings addObject:[NSString stringWithFormat:@"Cell %i Text", i]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - UITableViewDataSource methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)theTableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    SampleCell* cell = [theTableView cellForRowAtIndexPath:indexPath]; //Yeah, I'll let you deal with this warning...
    
    
    //A lot of this logic & code could probably be cleaned up with a proper SampleCell class, but no time for that I got hackin' to do!
    if (cell.beingEdited) {
        UIView *wipe = [[UIView alloc] initWithFrame:CGRectMake(236, 16, 0, 34)];
        wipe.backgroundColor = [UIColor whiteColor];
        
        [cell.contentView addSubview:wipe];
        
        [UIView animateWithDuration:.2 animations:^{
            wipe.frame =  CGRectMake(236, 16, 65, 34);
        } completion:^(BOOL finished) {
            if (finished) {
                [wipe removeFromSuperview];
                for (UIView *subview in cell.contentView.subviews) {
                    if ([subview isKindOfClass:[UIButton class]]) {
                        [subview removeFromSuperview];
                    }
                }
            }
        }];
        cell.beingEdited = NO;
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    } else {
        // Normal images
        UIImage *btn_delete_img = [UIImage imageNamed:@"btn_swipetodelete_normal.png"];

        // Highlighted images
        UIImage *btn_delete_img_highlighted = [UIImage imageNamed:@"btn_swipetodelete_pressed.png"];

        // Create button
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(236, 16, 65, 34);
        [button setBackgroundImage:btn_delete_img forState:UIControlStateNormal];
        [button setBackgroundImage:btn_delete_img_highlighted forState:UIControlStateHighlighted];

        // Button title
        [button.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
        [button setTitle:NSLocalizedString(@"Delete", nil) forState:UIControlStateNormal];

        // Text color
        button.titleLabel.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        button.titleLabel.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.5];
        button.titleLabel.shadowOffset = CGSizeMake(0, -1);
        
        button.tag = indexPath.row; //You might call this a hack, I call it clever!
        
        [button addTarget:self action:@selector(removeCell:) forControlEvents:UIControlEventTouchUpInside];
        
        UIView *wipe = [[UIView alloc] initWithFrame:CGRectMake(236, 16, 65, 34)];
        wipe.backgroundColor = [UIColor whiteColor];

        [cell.contentView addSubview:button];
        [cell.contentView addSubview:wipe];

        [UIView animateWithDuration:.2 animations:^{
            wipe.frame =  CGRectMake(236, 16, 0, 34);
        } completion:^(BOOL finished) {
            if (finished) {
                [wipe removeFromSuperview];
            }
        }];
        cell.beingEdited = YES;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
}

-(SampleCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"SampleCell";
    SampleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    //Since cells are reused, Delete button might be visible
    for (UIView *subview in cell.contentView.subviews) {
        if ([subview isKindOfClass:[UIButton class]]) {
            [subview removeFromSuperview];
            cell.beingEdited = NO;
        }
    }
    
    cell.textLabel.text = [cellStrings objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //For willBeginEditingRowAtIndexPath: to be called, this must be implemented. So, blank!
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [cellStrings count];
}

#pragma mark - IBAction methods
- (IBAction) removeCell:(UIButton *) sender {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:sender.tag inSection:0];
    
    [cellStrings removeObjectAtIndex:indexPath.row];
    [tbl_main deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];

}

@end

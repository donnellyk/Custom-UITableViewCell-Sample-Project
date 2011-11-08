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

-(SampleCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"SampleCell";
    SampleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.textLabel.text = [cellStrings objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [cellStrings removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [cellStrings count];
}

#pragma mark - UITableViewDelegate methods
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

@end

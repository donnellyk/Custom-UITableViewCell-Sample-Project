//
//  ViewController.h
//  Sample
//
//  Created by James Kelso on 11/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    @private
    NSMutableArray *cellStrings;
    BOOL commitEditingStyleHack;
}

@property (nonatomic, retain) IBOutlet UINavigationItem *nav_item;
@property (nonatomic, retain) IBOutlet UITableView *tbl_main;

- (IBAction) removeCell:(UIButton *) sender;

@end

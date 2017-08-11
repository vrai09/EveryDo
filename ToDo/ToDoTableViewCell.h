//
//  ToDoTableViewCell.h
//  ToDo
//
//  Created by Livleen Rai on 2017-08-08.
//  Copyright © 2017 Livleen Rai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property NSString *title;
@property int priority;
@property BOOL isCompleted;

- (void)setUpCell;

@end

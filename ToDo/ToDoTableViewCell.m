//
//  ToDoTableViewCell.m
//  ToDo
//
//  Created by Livleen Rai on 2017-08-08.
//  Copyright © 2017 Livleen Rai. All rights reserved.
//

#import "ToDoTableViewCell.h"

@implementation ToDoTableViewCell

- (IBAction)doneButton:(UIButton *)sender {
    [self strikethroughString];
}

- (void)setUpCell {
    
    self.titleLabel.text = self.title;
    self.priorityLabel.text = [NSString stringWithFormat:@"%d", self.priority];
    if(self.isCompleted == YES) {
        [self strikethroughString];
    }
    
}



- (void)strikethroughString {
    NSAttributedString * title =
    [[NSAttributedString alloc] initWithString:self.titleLabel.text
                                    attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle)}];
    [self.titleLabel setAttributedText:title];
}

@end

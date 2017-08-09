//
//  ToDoTableViewCell.m
//  ToDo
//
//  Created by Livleen Rai on 2017-08-08.
//  Copyright © 2017 Livleen Rai. All rights reserved.
//

#import "ToDoTableViewCell.h"

@implementation ToDoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)doneButton:(UIButton *)sender {
    [self strikethroughString];
}



- (void)strikethroughString {
    NSAttributedString * title =
    [[NSAttributedString alloc] initWithString:self.titleLabel.text
                                    attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle)}];
    [self.titleLabel setAttributedText:title];
}

@end

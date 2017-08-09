//
//  Todo.m
//  ToDo
//
//  Created by Livleen Rai on 2017-08-08.
//  Copyright © 2017 Livleen Rai. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (instancetype)initWithTitle:(NSString *)title description:(NSString *)toDodescription priority:(int)priority completion:(BOOL)isCompleted {
    if(self =[super init]) {
        self.title = title;
        self.toDoDescription = toDodescription;
        self.priority = priority;
        self.isCompleted = isCompleted;
    }
    return self;
}
@end

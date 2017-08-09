//
//  Todo.h
//  ToDo
//
//  Created by Livleen Rai on 2017-08-08.
//  Copyright © 2017 Livleen Rai. All rights reserved.
//title
/*todoDescription (note: a property cannot be named description, as that's already in use)
                 priority number
                 is completed indicator */

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property NSString *title;
@property NSString *toDoDescription;
@property int priority;
@property BOOL isCompleted;


- (instancetype)initWithTitle:(NSString *)title description:(NSString *)toDodescription priority:(int)priority completion:(BOOL)isCompleted;

@end

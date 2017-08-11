//
//  AddItemViewController.h
//  ToDo
//
//  Created by Livleen Rai on 2017-08-09.
//  Copyright © 2017 Livleen Rai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@protocol AddItemDelegate <NSObject>

- (void)newTodo:(Todo*)toDo;

@end

@interface AddItemViewController : UIViewController

@property (weak, nonatomic) id<AddItemDelegate>delegate;

@end

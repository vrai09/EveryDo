//
//  AddItemViewController.m
//  ToDo
//
//  Created by Livleen Rai on 2017-08-09.
//  Copyright © 2017 Livleen Rai. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;

@property (weak, nonatomic) IBOutlet UITextField *priorityTextField;

@property (weak, nonatomic) IBOutlet UITextField *isCompletedTextField;

@property BOOL isCompleted;

@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Enter A New ToDo";
}


- (IBAction)enter:(UIButton *)sender {
    
    if([self.isCompletedTextField.text isEqualToString:@"yes"]) {
        self.isCompleted = YES;
    }else{
        self.isCompleted = NO;
    }
    
    Todo *toDo = [[Todo alloc]initWithTitle:self.titleTextField.text description:self.descriptionTextField.text priority:[self.priorityTextField.text intValue] completion:self.isCompleted];
    
    if(self.delegate) {
    [self.delegate newTodo:toDo];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end

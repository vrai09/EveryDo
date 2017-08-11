//
//  MasterViewController.m
//  ToDo
//
//  Created by Livleen Rai on 2017-08-08.
//  Copyright © 2017 Livleen Rai. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Todo.h"
#import "ToDoTableViewCell.h"

@interface MasterViewController () <UITableViewDataSource, UITableViewDelegate>

@property NSMutableArray *toDos;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didSelectAdd)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    Todo *toDo1 = [[Todo alloc]initWithTitle:@"Go shopping" description:@"We need more milk" priority:1 completion:NO];
    Todo *toDo2 = [[Todo alloc]initWithTitle:@"Wash the dog" description:@"He is dirty" priority:2 completion:NO];
    Todo *toDo3 = [[Todo alloc]initWithTitle:@"Clean the house" description:@"The house is dirty" priority:3 completion:YES];
    Todo *toDo4 = [[Todo alloc]initWithTitle:@"Go to the gym" description:@"You are fat" priority:4 completion:YES];
    
    self.toDos = [[NSMutableArray alloc]initWithObjects:toDo1, toDo2, toDo3, toDo4, nil];
    
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todo *toDo = self.toDos[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:toDo.toDoDescription];
        
    }else if([segue.identifier isEqualToString:@"AddItem"]) {
        
        AddItemViewController *addItemVC = (AddItemViewController*)[segue destinationViewController];
        addItemVC.delegate = self;
    }
    
}

- (void)didSelectAdd {
    
    [self performSegueWithIdentifier:@"AddItem" sender:self];
    
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.toDos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ToDoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ToDoCell" forIndexPath:indexPath];
    
    Todo *todoObject = self.toDos[indexPath.row];

    cell.title = todoObject.title;
    cell.priority = todoObject.priority;
    cell.isCompleted = todoObject.isCompleted;
    [cell setUpCell];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.toDos removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Delegate

- (void)newTodo:(Todo *)toDo {
    
    [self.toDos insertObject:toDo atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView reloadData];
    
}

@end

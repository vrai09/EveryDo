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
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    //UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    //self.navigationItem.rightBarButtonItem = addButton;
    
    Todo *toDo1 = [[Todo alloc]initWithTitle:@"Go shopping" description:@"We need more milk" priority:1 completion:NO];
    Todo *toDo2 = [[Todo alloc]initWithTitle:@"Wash the dog" description:@"He is dirty" priority:2 completion:NO];
    Todo *toDo3 = [[Todo alloc]initWithTitle:@"Clean the house" description:@"The house is dirty" priority:3 completion:YES];
    Todo *toDo4 = [[Todo alloc]initWithTitle:@"Go to the gym" description:@"You are fat" priority:4 completion:YES];
    
    self.toDos = [[NSMutableArray alloc]initWithObjects:toDo1, toDo2, toDo3, toDo4, nil];
    
}


- (void)viewWillAppear:(BOOL)animated {
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*- (void)insertNewObject:(id)sender {
    if (!self.toDos) {
        self.toDos = [[NSMutableArray alloc] init];
    }
    [self.toDos insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}*/


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todo *toDo = self.toDos[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:toDo.toDoDescription];
    }
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

    cell.titleLabel.text = todoObject.title;
    cell.priorityLabel.text = [NSString stringWithFormat:@"%d",todoObject.priority];
    cell.isCompleted = todoObject.isCompleted;
    if(cell.isCompleted == YES) {
        [cell strikethroughString];
    }
    
    
    return cell;
}

/*
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
} */


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.toDos removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    /*} else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view. */
    }
}


@end

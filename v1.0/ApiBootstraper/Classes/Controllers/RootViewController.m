//
//  RootViewController.m
//  ApiBootstraper
//
//  Created by Jeremy on 18/04/13.
//  Copyright (c) 2013 ApiBootstraper. All rights reserved.
//

#import "RootViewController.h"
#import "MBProgressHUD.h"
#import "Todo.h"

@interface RootViewController ()

@end

@implementation RootViewController

@synthesize navigationController = _navigationController;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = NSLocalizedString(@"Todo List", nil);
        UIBarButtonItem *addTodoButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTodoButtonPress:)];
        self.navigationItem.rightBarButtonItem = addTodoButton;

        indicatorView = [[MBProgressHUD alloc] initWithView:self.view];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self reload:nil];
}

- (UINavigationController *)navigationController {
    if (!navigationController) {
        navigationController = [[UINavigationController alloc] initWithRootViewController:self];
        _navigationController = navigationController;
    }

    return navigationController;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [rows count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }

    Todo *todo = rows[indexPath.row];

    cell.textLabel.text = todo.name;

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

#pragma mark - CJInfinityScrollTableViewController delegate

- (void)reload:(id)sender {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (offset)
        [dictionary setValue:[NSNumber numberWithInt:offset] forKey:@"offset"];

    if (limit)
        [dictionary setValue:[NSNumber numberWithInt:limit] forKey:@"limit"];


    [indicatorView show:YES];
    [self beginLoading];
    [Todo todosWithParameters:dictionary callback:^(id todosOrOperation, id totalCountOrError) {
        if ([[totalCountOrError class] isSubclassOfClass:[NSError class]]) {
#warning TODO show indicatorView error
#warning TODO pb pull refrech
        }
        else {
            [rows addObjectsFromArray:[todosOrOperation copy]];
            totalRowsCount = [totalCountOrError integerValue];

            [indicatorView hide:YES];
        }
        [self endLoading];
    }];
}


#pragma press button

- (void)addTodoButtonPress:(id)sender {
    NSLog(@"Add Todo");
}

#pragma mark - Table view delegate

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([rows count] != totalRowsCount){
        [super scrollViewDidScroll:scrollView];
    }
}

@end

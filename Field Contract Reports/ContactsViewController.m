//
//  SecondViewController.m
//  Field Contract Reports
//
//  Created by Orion Despo on 8/14/13.
//  Copyright (c) 2013 Orion Despo. All rights reserved.
//

#import "ContactsViewController.h"
#import "AppDelegate.h"

@interface ContactsViewController ()
@property NSMutableArray *contacts;
@property UITableView *viewforcontacts;
@end

@implementation ContactsViewController

- (void)viewDidLoad
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.contacts = appDelegate.contacts;
    NSLog(@"%@",self.contacts);
    UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen]applicationFrame] style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView setAllowsSelection:YES];
    [tableView reloadData];
    
    self.viewforcontacts = tableView;
    [self.view addSubview:tableView];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

///table view methods
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (self.view.bounds.size.height/[self.contacts count]);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contacts count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *indentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    NSString *name = [self.contacts objectAtIndex:indexPath.row];
    cell.textLabel.text = name;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //show past pdf
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

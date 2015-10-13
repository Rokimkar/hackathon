//
//  LeftDeckViewController.m
//  Hackathon
//
//  Created by Sanchit Kumar Singh on 10/11/15.
//  Copyright (c) 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "LeftDeckViewController.h"
#import "LeftDeckTableViewCell.h"

@interface LeftDeckViewController (){
    NSArray *itemsArray ;
}

@end

@implementation LeftDeckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    itemsArray = [[NSArray alloc]initWithObjects:@"Home",@"Electronics",@"Clothes",@"Books", nil];
    // Do any additional setup after loading the view.
    [self.itemListTableView registerNib:[UINib nibWithNibName:@"LeftDeckTableViewCell" bundle:nil] forCellReuseIdentifier:@"LeftDeckTableViewCell"];
    self.itemListTableView.scrollEnabled=NO;
}

- (NSInteger) numberOfSectionsInTableView : (UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView :(UITableView *)tableView numberOfRowsInSection:(NSInteger) section{
   
    return itemsArray.count;
}


-(UITableViewCell *)tableView : (UITableView *)tableView cellForRowAtIndexPath : (NSIndexPath *) indexPath{
    LeftDeckTableViewCell *cell= (LeftDeckTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"LeftDeckTableViewCell"];
    if(cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"LeftDeckTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.labelForItems.text=[itemsArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat) tableView: (UITableView *)
tableView heightForRowAtIndexPath: (NSIndexPath *)indexPath{
    return 40;
}

@end

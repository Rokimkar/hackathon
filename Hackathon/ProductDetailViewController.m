//
//  ProductDetailViewController.m
//  ImagePickerProject
//
//  Created by Kunal Chelani on 10/12/15.
//  Copyright © 2015 til. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "TopZoneView.h"
#import "ProductDetailsTableViewCell.h"
#import "ProductDescriptionTableViewCell.h"
#import "Product.h"
@interface ProductDetailViewController () <UITableViewDelegate,UITableViewDataSource>
{
    CGSize screenSize;
}
@end

@implementation ProductDetailViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andProduct:(Product *)product{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.product=product;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    screenSize = ([[UIScreen mainScreen] bounds]).size;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 2;
    }
    else{
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell;
    if (indexPath.section==0 && indexPath.row==0) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        TopZoneView *topZoneView = [[TopZoneView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, 172) andItems:nil];
        [cell setBackgroundColor:[UIColor greenColor]];
        [cell addSubview:topZoneView];
    }
    else if (indexPath.section==0 && indexPath.row==1) {
        cell = (ProductDetailsTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"ProductDetailsTableViewCell"];
        if (cell==nil) {
            [tableView registerNib:[UINib nibWithNibName:@"ProductDetailsTableViewCell" bundle:nil ] forCellReuseIdentifier:@"ProductDetailsTableViewCell"];
            NSArray *cellnib = [[NSBundle mainBundle] loadNibNamed:@"ProductDetailsTableViewCell" owner:self options:nil];
            cell = (ProductDetailsTableViewCell *)[cellnib objectAtIndex:0];
        }
        [(ProductDetailsTableViewCell*)cell bindData:nil];
    }
    else{
        cell = (ProductDescriptionTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"ProductDescriptionTableViewCell"];
        if (cell==nil) {
            [tableView registerNib:[UINib nibWithNibName:@"ProductDescriptionTableViewCell" bundle:nil ] forCellReuseIdentifier:@"ProductDescriptionTableViewCell"];
            NSArray *cellnib = [[NSBundle mainBundle] loadNibNamed:@"ProductDescriptionTableViewCell" owner:self options:nil];
            cell = (ProductDescriptionTableViewCell *)[cellnib objectAtIndex:0];
        }
        [(ProductDescriptionTableViewCell*)cell bindDataFor:nil];
    }
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0 && indexPath.row==0)
        return 172;
    else if (indexPath.section==0 && indexPath.row==1)
        return 128;
    else if(indexPath.section==1)
        return [self heightForBasicCellAtIndexPath:indexPath];
    
    return 100;
}


- (CGFloat)heightForBasicCellAtIndexPath:(NSIndexPath *)indexPath {
        static ProductDescriptionTableViewCell *sizingCell = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sizingCell = (ProductDescriptionTableViewCell*)[self.detailTableView dequeueReusableCellWithIdentifier:@"ProductDescriptionTableViewCell"];
            [self.detailTableView registerNib:[UINib nibWithNibName:@"ProductDescriptionTableViewCell" bundle:nil ] forCellReuseIdentifier:@"ProductDescriptionTableViewCell"];
            NSArray *cellnib = [[NSBundle mainBundle] loadNibNamed:@"ProductDescriptionTableViewCell" owner:self options:nil];
            sizingCell = (ProductDescriptionTableViewCell *)[cellnib objectAtIndex:0];
        });
    sizingCell.descLabel.text=@"hdjkdhsdljkhdkjlhdskjldshdlkjhdskjhdsvkjdhdvslkjhdsjkhhdkjdhdkshsdkjdhdskhjbdhbdjbdskjdsbdkjbdkjbdckjbdkjbdkjbdkjbdkjbdkjbdkbdkbdkjbdskjdbskjdbskdjsbdskjbdkjbdkbdkjbdkjbdkjbdkjbdkjbdkdjsbdbdkjbdskjbsdkjdbkjdbdkjbdkjbdkjdbdkjbdkjbdkjbdkjbdkjbdskjbdkjbdkjbdkbdsvdskjdskjbdsjkbdskjbddjbdvbdsdbdskjbdskjbdfskbdskddkdkdkjdvkbdjkbdskbdkbdskjdkjdskbdvskbjcdksdkbdvkdkdfdskdskbdskbdkbdksfbkdbkbdkbdkbddkbdkb";
        return [self calculateHeightForConfiguredSizingCell:sizingCell];
}

- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell {
    [sizingCell setNeedsUpdateConstraints];
    [sizingCell updateConstraintsIfNeeded];
    
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];
    
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height + 1.0f; // Add 1.0f for the cell separator height
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==1) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, 44)];
        UILabel *lbl =[[UILabel alloc] initWithFrame:CGRectMake(30, 0, screenSize.width, 44)];
        lbl.text=@"Description";
//        lbl.textColor=RGBA(98, 98, 98, 1);
//        lbl.font=[UIFont fontWithName:@"SinkinSans-300Light" size:15];
//        [view setBackgroundColor:RGBA(245, 246, 245, 1.0)];
        [view setBackgroundColor:[UIColor lightGrayColor]];
        [view addSubview:lbl];
        return view;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==1) {
        return 44;
    }
    else
        return 0;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

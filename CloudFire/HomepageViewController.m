//
//  HomepageViewController.m
//  CloudFire
//
//  Created by macos on 2018/1/18.
//  Copyright © 2018年 jbu. All rights reserved.
//

#import "HomepageViewController.h"
#import "Utils.h"
#import "Config.h"


#import "HomePageHeadView.h"
#import "NewLoginViewController.h"

#import <MBProgressHUD.h>

#import "UINavigationBar+BackgroundColor.h"

static NSString *reuseIdentifier = @"HomeButtonCell";


@interface HomepageViewController ()
@property (nonatomic ,strong) UIImageView *imageView;
@property (nonatomic, assign) BOOL isLogin;
@property (nonatomic,assign) int64_t myID;
@property (nonatomic, strong) HomePageHeadView *homePageHeadView;



@end

@implementation HomepageViewController



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tableView.tableHeaderView = self.homePageHeadView;
    [self.tableView sendSubviewToBack:self.homePageHeadView];

    [self refreshHeaderView];
}

-(void)viewDidAppear:(BOOL)animated
{
        [super viewDidAppear:animated];
       [self.navigationController.navigationBar setBackgroundImage:[Utils createImageWithColor:[UIColor navigationbarColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBackgroundImage:[Utils createImageWithColor:[UIColor navigationbarColor]] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar lt_setBackgroundColor:[[UIColor navigationbarColor] colorWithAlphaComponent:0]];

    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    _imageView = [self findHairlineImageViewUnder:
                  self.navigationController.navigationBar];
    self.tableView.backgroundColor=[UIColor whiteColor];
    self.tableView.separatorColor=[UIColor separatorColor];
    self.tableView.bounces =NO;
    
     [self.tableView registerNib:[UINib nibWithNibName:@"HomeButtonCell" bundle:nil] forCellReuseIdentifier:reuseIdentifier];
    
    _myID = [Config getOwnID];
    
    [self refreshHeaderView];
   // [self ]
    
    self.tableView.tableFooterView = [UIView new];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_qrcode"] style:UIBarButtonItemStylePlain target:self action:@selector(showCodeAction)];
    
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_my_setting"] style:UIBarButtonItemStylePlain target:self action:@selector(setUpAction)];
    
    
    self.navigationItem.title=@"我的2";
}


#pragma mark - 他人详情资料

- (void)tapPortraitAction
{ if (![Utils isNetworkExist]) {
    MBProgressHUD *HUD = [Utils createHUD];
    HUD.mode = MBProgressHUDModeText;
    HUD.label.text = @"网络无连接，请检查网络";
    
    [HUD hideAnimated:YES afterDelay:1];
} else {
    if ([Config getOwnID] == 0) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"NewLogin" bundle:nil];
        NewLoginViewController *loginVC = [storyboard instantiateViewControllerWithIdentifier:@"NewLoginViewController"];
        [self presentViewController:loginVC animated:YES completion:nil];
    } else {
        
        //NSLog(@"==%@",[Config myNewProfile]);
        
      //  MyBasicInfoViewController *basicInfoVC = [[MyBasicInfoViewController alloc] initWithUserItem:_myInfo isNeedShowIdendity:NO];
       // basicInfoVC.hidesBottomBarWhenPushed = YES;
       // [self.navigationController pushViewController:basicInfoVC animated:YES];
    }
}
}


-(void)refreshHeaderView{
    
    _isLogin = _myID != 0;
    if (_isLogin) {
        
    }else{
        self.homePageHeadView.userPortrait.image = [UIImage imageNamed:@"default-portrait"];
        self.homePageHeadView.creditLabel.hidden =YES;
    }
    self.homePageHeadView.nameLabel.font = [UIFont systemFontOfSize:_isLogin ? 20 : 15];
    self.homePageHeadView.nameLabel.text =  @"点击头像登录";
    self.homePageHeadView.nameLabel.textColor =[UIColor blueColor];
    
    
    
    
    [self.homePageHeadView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPortraitAction)]];
    self.homePageHeadView.userInteractionEnabled = YES;
    
    //[self setUpSubviews];
    
    
}

-(void)setUpSubviews
{
    [self.homePageHeadView.userPortrait setBorderWidth:2.0 andColor:[UIColor whiteColor]];
    [self.homePageHeadView.userPortrait addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changePortraitAction)]];
    
    self.refreshControl.tintColor = [UIColor refreshControlColor];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 6;
    }
    return 0;
}-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [UITableViewCell new];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (!_isLogin) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"NewLogin" bundle:nil];
        NewLoginViewController *loginVC =[storyboard instantiateViewControllerWithIdentifier:@"NewLoginViewController"];
        [self presentViewController:loginVC animated:YES completion:nil];
        return;
    }
    
}



-(HomePageHeadView*) homePageHeadView{
    _isLogin =[Config getOwnID]? YES:NO;
    if (_homePageHeadView == nil) {
        CGFloat homeViewHeight = 230;
        if (!_isLogin) {
            homeViewHeight = homeViewHeight -60;
        }
         _homePageHeadView = [[HomePageHeadView alloc] initWithFrame:(CGRect){{0,-64},{[UIScreen mainScreen].bounds.size.width, homeViewHeight}}];
        
        
    }
    return _homePageHeadView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


-(UIImageView*)findHairlineImageViewUnder:(UIView *)view{
    if ([view isKindOfClass:UIImageView.class]
        && view.bounds.size.height <= 1.0) {
        return (UIImageView*)view;
    }
    for (UIView * subView in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subView];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

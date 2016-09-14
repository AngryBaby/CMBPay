//
//  FHViewController.m
//  CMBPay
//
//  Created by HamYu on 09/13/2016.
//  Copyright (c) 2016 HamYu. All rights reserved.
//

#import "FHViewController.h"
#import "WebViewController.h"

@interface FHViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *button;
@end

@implementation FHViewController

- (void)openWebView
{
    WebViewController *vc = [[WebViewController alloc] init];
    vc.view.frame = [UIScreen mainScreen].bounds;
    
    NSString *getURL = _textField.text;

    NSMutableURLRequest *requestObj = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:getURL]];
    [requestObj setHTTPMethod:@"POST"];
    
    NSString *account = @"15889975362";
    NSString *app_flag = @"fonehui";
    NSString *encrypt_pwd = @"5c4969e5a2f40cfa615027c0abfd356c3b3e831b";
    NSString *iphone_token = @"a9265dc0e63bfec16989118686ce016a6caed55a5b151745e7c96cf673bda4b0";
    NSString *session_id = @"3v35f48q1uqtc5stl1jrosm065";
    NSString *region_code = @"86";
    
    NSString *activity_id = @"2490";
    NSString *signup_admission_id = @"3056";
    NSString *order_code = @"1473833524173768979370";
    
//    NSString *postString = [NSString stringWithFormat:@"account=%@&app_flag=%@&encrypt_pwd=%@&iphone_token=%@&session_id=%@&activity_id=%@&region_code=%@&signup_admission_id=%@",account,app_flag,encrypt_pwd,iphone_token,session_id,activity_id,region_code,signup_admission_id];
    
    NSString *postString = [NSString stringWithFormat:@"account=%@&app_flag=%@&encrypt_pwd=%@&iphone_token=%@&session_id=%@&region_code=%@&order_code=%@",account,app_flag,encrypt_pwd,iphone_token,session_id,region_code,order_code];
    NSLog(@"postring: %@",postString);
    NSData *data = [postString dataUsingEncoding:NSUTF8StringEncoding];
    [requestObj setHTTPBody:data];
    [vc loadURLRequest:requestObj];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //http://www.fonehui.com/index.php/app/fhappuser2_2/activity_admission_pay_with_cmb_ios
    
    //http://www.fonehui.com/index.php/app/fhappuser2_2/pay_order_with_cmb_ios
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 84, 200, 40)];
    self.textField.delegate = self;
    self.textField.backgroundColor = [UIColor lightGrayColor];
//    self.textField.text = @"https://www.fonehui.com/index.php/app/fhappuser2_2/activity_admission_pay_with_cmb_ios";
    
    self.textField.text = @"https://www.fonehui.com/index.php/app/fhappuser2_2/pay_order_with_cmb_ios";
    
    [self.view addSubview:self.textField];
    
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(230, 84, 50, 40)];
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button setTitle:@"open" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(openWebView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFied delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    textField.clearsOnBeginEditing = YES;
    
    return YES;
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    textField.keyboardType = UIKeyboardTypeDefault;
    //设置初始
    if ([textField.text length] > 0) {
        //[keyboard setArrayBufferWithString:textField.text];
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    
    return YES;
}

@end

//
//  WebViewController.m
//  CMBPay
//
//  Created by yuham on 16/9/13.
//  Copyright © 2016年 HamYu. All rights reserved.
//

#import "WebViewController.h"
#import <cmbkeyboard/CMBWebKeyboard.h>
#import <cmbkeyboard/NSString+Additions.h>

@interface WebViewController ()<UIWebViewDelegate,UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation WebViewController {
    NSURLRequest *_requestUrl;
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (BOOL)needBackItem
{
    return YES;
}

- (void)loadUrl:(NSString *)outerURL
{
    NSURL *url = [NSURL URLWithString:outerURL];
    _requestUrl = [NSURLRequest requestWithURL:url];
    
}

- (void)loadURLRequest:(NSURLRequest *)requesturl
{
    _requestUrl = requesturl;
}

- (void)reloadWebView
{
    [_webView loadRequest:_requestUrl];
}

- (void)viewDidLoad {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _webView = [[UIWebView alloc] init];
    _webView.frame = self.view.frame;
    [self.view addSubview:_webView];
    _webView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[CMBWebKeyboard shareInstance] hideKeyboard];
    
    [self reloadWebView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[CMBWebKeyboard shareInstance] hideKeyboard];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

static BOOL FROM = FALSE;
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if ([request.URL.host isCaseInsensitiveEqualToString:@"cmbls"]) {
        CMBWebKeyboard *secKeyboard = [CMBWebKeyboard shareInstance];
        [secKeyboard showKeyboardWithRequest:request];
        secKeyboard.webView = _webView;
        
        UITapGestureRecognizer *myTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [self.view addGestureRecognizer:myTap];
        
        myTap.delegate = self;
        myTap.cancelsTouchesInView = NO;
        return NO;
    }
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (void)handleSingleTap:(UITapGestureRecognizer *)sender
{
    [[CMBWebKeyboard shareInstance] hideKeyboard];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    if (FROM) {
        return;
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}

- (void)dealloc
{
    [[CMBWebKeyboard shareInstance] hideKeyboard];
}

@end

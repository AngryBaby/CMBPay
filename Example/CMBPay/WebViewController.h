//
//  WebViewController.h
//  CMBPay
//
//  Created by yuham on 16/9/13.
//  Copyright © 2016年 HamYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
- (void)loadUrl:(NSString *)outerURL;
- (void)loadURLRequest:(NSURLRequest *)requesturl;
@end

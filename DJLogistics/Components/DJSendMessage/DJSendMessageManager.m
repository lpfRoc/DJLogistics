//
//  DJSendMessageManager.m
//  DJLogistics
//
//  Created by 段世宜 on 2017/10/31.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJSendMessageManager.h"
#import <MessageUI/MessageUI.h>
#import "UIViewController+FYCategory.h"
@interface DJSendMessageManager ()<MFMessageComposeViewControllerDelegate>


@end

@implementation DJSendMessageManager

//发短信
-(void)SendMessage:(NSString *)phone message:(NSString *)message{
    
    //传入要发送到得电话号码，和短信界面预写入短信的内容，调用此方法即可跳到短信发送界面
    [self showMessageView:@[phone] title:@"短信" body:message];
}

//发短信
-(void)showMessageView:(NSArray *)phones title:(NSString *)title body:(NSString *)body
{
    if( [MFMessageComposeViewController canSendText] )
    {
        MFMessageComposeViewController * controller = [[MFMessageComposeViewController alloc] init];
        controller.recipients = phones;
        controller.navigationBar.tintColor = [UIColor redColor];
        controller.body = body;
        controller.messageComposeDelegate = self;
        [[UIViewController currentViewController].navigationController presentViewController:controller animated:YES completion:nil];
        [[[[controller viewControllers] lastObject] navigationItem] setTitle:title];//修改短信界面标题
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示信息"
                                                        message:@"该设备不支持短信功能"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
}
//发短信
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [ controller  dismissViewControllerAnimated:YES completion:nil];
    switch (result) {
        case MessageComposeResultSent:
            //信息传送成功
            NSLog(@"信息发送成功");
             [ controller  dismissViewControllerAnimated:YES completion:nil];
            break;
        case MessageComposeResultFailed:
            //信息传送失败
            NSLog(@"信息传送失败");
             [ controller  dismissViewControllerAnimated:YES completion:nil];
            
            break;
        case MessageComposeResultCancelled:
            //信息被用户取消传送
            NSLog(@"信息被用户取消传送");
            
            
            break;
        default:
            break;
    }
   
}
@end

//
//  ValidationClass.m
//  WebServiceDemo
//
//  Created by Stark Digital Media Services Pvt Ltd on 27/08/15.
//  Copyright (c) 2015 Stark Digital Media Services Pvt Ltd. All rights reserved.
//

#import "ValidationClass.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation ValidationClass

+(BOOL)isValidEmail:(NSString*)strEmail senderViewController:(UIViewController*)controller
{
    if (strEmail.length>50) {
        return false;
    }
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    if(![emailTest evaluateWithObject:strEmail])
        [self showErrorMessage:@"Invalid email address" sender:controller];
    return [emailTest evaluateWithObject:strEmail];
}
+(BOOL)isNotEmpty:(NSString*)str senderViewController:(UIViewController*)controller
{
    if (str.length>0) {
        return YES;
    }
    if (![[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        return YES;
    }
    [self showErrorMessage:@"Select Profession"  sender:controller];
    return false;
}
+(BOOL)isNotEmptyFeedback:(NSString*)str senderViewController:(UIViewController*)controller
{
    if (str.length>0) {
        return YES;
    }
    if (![[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        return YES;
    }
    [self showErrorMessage:@"Please enter valid feedback"  sender:controller];
    return false;
}
+(BOOL)isvalidMobile:(NSString*)strNumber senderViewController:(UIViewController*)controller
{
    if ([[strNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        [self showErrorMessage:[NSString stringWithFormat:@"Invalid phone number"] sender:controller];
        return false;
    }
    NSCharacterSet *cs1 = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    NSString *length=[[strNumber componentsSeparatedByCharactersInSet:cs1] componentsJoinedByString:@""];
    if(length.length>0)
        if (length.length<9 || length.length>11) {
            [self showErrorMessage:@"Invalid phone number"  sender:controller];
            return false;
        }
    
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"(+*#-0123456789*#) "] invertedSet];
    NSString *filtered = [[strNumber componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    
    if(![strNumber isEqualToString:filtered])
        [self showErrorMessage:@"Invalid phone number"  sender:controller];
    return [strNumber isEqualToString:filtered];

}

+(BOOL)isValidName:(NSString*)strName senderViewController:(UIViewController*)controller strFieldName:(NSString *)fieldName
{
    if ([[strName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        [self showErrorMessage:[NSString stringWithFormat:@"Invalid %@",fieldName] sender:controller];
        return false;
    }
    else
        return true;
}

+(BOOL)isValidName:(NSString*)strName senderViewController:(UIViewController*)controller
{
    if ([[strName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        [self showErrorMessage:@"Invalid name" sender:controller];
        return false;
    }
    else
        return true;
}
+(BOOL)isValidUsername:(NSString*)strUsername senderViewController:(UIViewController*)controller
{
    if ([[strUsername stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        [self showErrorMessage:@"Username is missing" sender:controller];
        return false;
    }
    else
        return true;
}
+(BOOL)isValidAddress:(NSString*)strAddress senderViewController:(UIViewController*)controller;
{
    if ([[strAddress stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [strAddress stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length < 8) {
        [self showErrorMessage:@"Address should be more than 8 character" sender:controller];
        return false;
    }
    else
        return true;
}
+(BOOL)isValidPostelCode:(NSString*)strCode senderViewController:(UIViewController*)controller
{
    NSString *pinregex = @"^[0-9]{6}$";
    NSPredicate *pintest = [NSPredicate predicateWithFormat:@"self matches %@", pinregex];
    bool pinvalidates = [pintest evaluateWithObject:strCode];
    NSLog(@"Postal code validation for india only");
    if(!pinvalidates)
        [self showErrorMessage:@"Invalid postal code" sender:controller];
    return pinvalidates;
}

+(BOOL)isValidDateOfBirth:(NSDate*)BirthDate withDateFormate:(NSString*)strDateFormatte senderViewController:(UIViewController*)controller
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = strDateFormatte;
    NSDate *today=[formatter dateFromString:[formatter stringFromDate:[NSDate date]]];
    NSDate *b_date=[formatter dateFromString:[formatter stringFromDate:BirthDate]];
    if ([today compare:b_date] == NSOrderedDescending) {
        NSLog(@"birthdate is before today");
        return  true;
    } else if ([today compare:BirthDate] == NSOrderedAscending) {
        NSLog(@"birthdate is future date");
        [self showErrorMessage:@"Invalid birthdate" sender:controller];
        return false;
    } else {
        NSLog(@"dates are the same");
        return true;
    }
}

+(BOOL)isValidWebURL:(NSString*)strUrl senderViewController:(UIViewController*)controller
{
    NSString *urlRegEx = @"(http|https|www)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    if ([urlTest evaluateWithObject:strUrl])
        return true;
    urlRegEx =  @"(www\\.)[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?";
    urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    if(![urlTest evaluateWithObject:strUrl])
        [self showErrorMessage:@"Invalid web url" sender:controller];
    return [urlTest evaluateWithObject:strUrl];
}

+(BOOL)isValidFax:(NSString*)strFaxNumber senderViewController:(UIViewController*)controller
{
    
    return false;
}
+(BOOL)isValidPassword:(NSString*)strPassword senderViewController:(UIViewController*)controller
{
    if ([[strPassword stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        [self showErrorMessage:@"Password is missing" sender:controller];
        return false;
    }
    else
        return true;
}


#pragma mark- All Field Validation
+(void)showErrorMessage:(NSString*)strErrorMessage sender:(UIViewController*)controller
{
    //UIAlertView *alertMessage=[[UIAlertView alloc] initWithTitle:@"Invalid field" message:strErrorMessage delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    UIView *viewMessage=[[UIView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH , 0)];
    viewMessage.backgroundColor=[UIColor redColor];
    UILabel *lblError=[[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/2)-100, 0, 200, 50)];
    lblError.text=strErrorMessage;
    lblError.numberOfLines = 3;
    lblError.textAlignment=NSTextAlignmentCenter;
    lblError.textColor=[UIColor whiteColor];
    [lblError setFont:[UIFont fontWithName:@"HelveticaNeue"size:14]];
    [viewMessage addSubview:lblError];
    viewMessage.clipsToBounds=YES;
//    [controller.view addSubview:viewMessage];
    
  if (!controller.navigationController.navigationBarHidden) {
        
        [controller.navigationController.navigationBar addSubview:viewMessage];
        
    }else{
        
            [controller.view addSubview:viewMessage];
   }

    
    [controller.view bringSubviewToFront:viewMessage];
   
   [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:1 initialSpringVelocity:0.6 options:0 animations:^(void){
                      viewMessage.frame=CGRectMake(0, 0,SCREEN_WIDTH , 60);
       
    } completion:^(BOOL completion){
        //[self performSelector:@selector(closeMessageView) withObject:nil afterDelay:0.5];
        [UIView animateWithDuration:0.7 delay:0.7 options:0 animations:^(){
            viewMessage.frame=CGRectMake(0, 0,SCREEN_WIDTH ,0);
            
        } completion:^(BOOL completion){
            completion=true;
            lblError.frame=CGRectMake(0, 0, 0, 0);
            [lblError removeFromSuperview];
            [viewMessage removeFromSuperview];
        }];
    }];
    
    //[alertMessage show];
}

+(void)showIndicatorView:(UIViewController *)controller{
    
    [controller.view setUserInteractionEnabled:FALSE];
    UIView *indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0,0, 100, 100)];
    
    indicatorView.backgroundColor = [UIColor blackColor];
    indicatorView.layer.cornerRadius = 5;
    indicatorView.layer.masksToBounds = YES;
    //    [UIView beginAnimations:nil context:nil];
    //    [UIView setAnimationDuration:2.0];
    //    [UIView setAnimationDelay:2.5];
    //    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:_window cache:YES];
    //    [UIView setAnimationDelegate:self];
    //    [UIView setAnimationDidStopSelector:@selector(startupAnimationDone:finished:context:)];
    indicatorView.alpha = 1.0;
    indicatorView.tag = 404;
    //Create and add the Activity Indicator to splashView
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activityIndicator.alpha = 1.0;
    activityIndicator.center = indicatorView.center;
    activityIndicator.hidesWhenStopped = NO;
    [indicatorView addSubview:activityIndicator];
    [activityIndicator startAnimating];
    
    indicatorView.center = controller.view.center;
    [controller.view addSubview:indicatorView];
    [controller.view bringSubviewToFront:indicatorView];
    
}

+(void)stopIndicatorView:(UIViewController *)controller{
    UIView *indicatorView = [controller.view viewWithTag:404];
    
    [indicatorView removeFromSuperview];
    [controller.view setUserInteractionEnabled:YES];
}


@end

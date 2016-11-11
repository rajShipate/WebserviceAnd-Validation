//
//  ValidationClass.h
//  WebServiceDemo
//
//  Created by Stark Digital Media Services Pvt Ltd on 27/08/15.
//  Copyright (c) 2015 Stark Digital Media Services Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ValidationClass : UIViewController

+(BOOL)isValidEmail:(NSString*)strEmail senderViewController:(UIViewController*)controller;
+(BOOL)isvalidMobile:(NSString*)strNumber senderViewController:(UIViewController*)controller;
+(BOOL)isValidName:(NSString*)strName senderViewController:(UIViewController*)controller;
+(BOOL)isValidAddress:(NSString*)strAddress senderViewController:(UIViewController*)controller;
+(BOOL)isValidPostelCode:(NSString*)strCode senderViewController:(UIViewController*)controller;
+(BOOL)isValidDateOfBirth:(NSDate*)BirthDate withDateFormate:(NSString*)strDateFormatte senderViewController:(UIViewController*)controller;
+(BOOL)isValidWebURL:(NSString*)strUrl senderViewController:(UIViewController*)controller;
+(BOOL)isValidFax:(NSString*)strFaxNumber senderViewController:(UIViewController*)controller;
+(BOOL)isValidPassword:(NSString*)strPassword senderViewController:(UIViewController*)controller;
+(BOOL)isValidUsername:(NSString*)strUsername senderViewController:(UIViewController*)controller;
+(BOOL)isNotEmpty:(NSString*)str senderViewController:(UIViewController*)controller;
+(BOOL)isNotEmptyFeedback:(NSString*)str senderViewController:(UIViewController*)controller;
+(void)showErrorMessage:(NSString*)strErrorMessage sender:(UIViewController*)controller;
+(BOOL)isValidName:(NSString*)strName senderViewController:(UIViewController*)controller strFieldName:(NSString *)fieldName;
+(void)showIndicatorView:(UIViewController*)controller;
+(void)stopIndicatorView:(UIViewController*)controller;
@end

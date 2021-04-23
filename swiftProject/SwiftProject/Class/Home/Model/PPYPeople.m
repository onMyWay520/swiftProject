//
//  PPYPeople.m
//  swiftProject
//
//  Created by wuyongchao on 2018/9/28.
//  Copyright © 2018年 YC科技有限公司. All rights reserved.
//

#import "PPYPeople.h"
#import "swiftProject-Swift.h"
/*
 1.进入TARGETS ->Build Settings -> Packaging 中设置Defines Module为YES设置 Product Module Name ，也可以不设置，默认为工程的名字。这个在后面会用到
2.需要在当前OC类里导入xxx-Swift.h头文件，其中xxx为项目名称
3.OC类里仅可以调用public的Swift方法和变量
4.Swift类最好用@objc(xxx)进行描述
 */
@implementation PPYPeople
-(void)eat{
    NSLog(@"吃饭了");
    ViewController *vc=[[ViewController alloc]init];
    [vc show];//oc调用无参数的swift方法
    NSInteger a=[vc inputsWithNo1:10 no2:2];
    NSLog(@"a==%ld",(long)a);//oc调用含参数的swift方法
//    PPYHomeGoodsModel *model=[[PPYHomeGoodsModel alloc]init];
//    [model showMethod];

}
- (void)logMe:(NSString *)logMe logYou:(NSString *)logYou {
    NSLog(@"%@--%@", logMe, logYou);
}
@end

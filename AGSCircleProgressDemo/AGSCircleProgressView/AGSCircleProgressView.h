//
//  AGSCircleProgressView.h
//  JianKangJie3
//
//  Created by 高莹莹 on 2020/12/24.
//  Copyright © 2020 liyufeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#define AGSColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// 屏幕尺寸
#define AGSScreenW [UIScreen mainScreen].bounds.size.width
#define AGSScreenH [UIScreen mainScreen].bounds.size.height
NS_ASSUME_NONNULL_BEGIN
@class AGSCircleViewConfig;
@interface AGSCircleProgressView : UIView
/**
 创建含有圆环的实例View

 frame 尺寸
 configure 圆环属性的配置
 @return 圆环所在的View
 */
- (instancetype)initWithFrame:(CGRect)frame configure:(AGSCircleViewConfig *)config;
@property (assign, nonatomic) float progress;
@end

#pragma mark 配置属性类-AGSCircleViewConfig
@interface AGSCircleViewConfig : NSObject

//环形宽度
@property (nonatomic, assign) CGFloat circleLineWidth;
//环形颜色
@property (nonatomic, strong) UIColor *lineColor;
// 是否顺时针：yes顺 No逆
@property (nonatomic, assign) BOOL isClockwise;
// 起始坐标
@property (nonatomic, assign) CGPoint startPoint;
// 结束坐标
@property (nonatomic, assign) CGPoint endPoint;


//这俩数组必须相等
//渐变色的颜色数组
@property (nonatomic, strong) NSArray *colorArr;
// 渐变色颜色的位置数组从左到右排列
@property (nonatomic, strong) NSArray *colorSize;


@end
NS_ASSUME_NONNULL_END

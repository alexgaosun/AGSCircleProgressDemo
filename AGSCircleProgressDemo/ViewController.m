//
//  ViewController.m
//  AGSCircleProgressDemo
//
//  Created by 高莹莹 on 2021/1/4.
//

#import "ViewController.h"
#import "AGSCircleProgressView.h"
@interface ViewController ()
@property(nonatomic, strong)AGSCircleProgressView *loadingProgressView;
@property(nonatomic,strong)UISlider *slider;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = 78;
    //1.创建圆环
    AGSCircleViewConfig *configure = [[AGSCircleViewConfig alloc]init];
    //圆环背景色
    configure.lineColor = [UIColor lightGrayColor];
    //圆环宽度
    configure.circleLineWidth = 5;
    //设置顺时针方向画圆
    configure.isClockwise = YES;
    //渐变色分布方向
    configure.startPoint = CGPointMake(width / 2, 0);
    configure.endPoint   = CGPointMake(width / 2 , width);
    //渐变色的颜色
    configure.colorArr = @[
                           (id)AGSColorFromRGB(0x0C95FF).CGColor,//浅蓝色
                           (id)AGSColorFromRGB(0x02D191).CGColor //浅绿色
                           ];
    //颜色数组中,每个颜色在"渐变色方向"上[0,1]中的起始位置
    configure.colorSize = @[@0,@1];
    
    _loadingProgressView = [[AGSCircleProgressView alloc]initWithFrame:CGRectMake(100, 100, width, width) configure:configure];
    _loadingProgressView.progress = 0;
    [self.view addSubview:_loadingProgressView];
    [self.view addSubview:self.slider];
    _slider.frame=CGRectMake((self.view.frame.size.width-300)/2,(self.view.frame.size.width)/2, 300, 50);
    [_slider addTarget:self action:@selector(sliderChangeAction:) forControlEvents:UIControlEventValueChanged];
}

//初始化滑动控件
- (UISlider *)slider{
    
    if (_slider==nil) {
        
        _slider=[[UISlider alloc]init];
        
    }
    
    return _slider;
    
}
//slider的事件
-(void)sliderChangeAction:(id)sender{
    
    //确定一个对象是否是一个类的成员,或者是派生自该类的成员
    if ([sender isKindOfClass:[UISlider class]]) {
        
        //强制转化
        
        UISlider *slider=(UISlider*)sender;
        _loadingProgressView.progress = slider.value;
       ;
        
    }
    
}
@end

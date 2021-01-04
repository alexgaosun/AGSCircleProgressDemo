# AGSCircleProgressDemo
渐变色，环形，圆环进度条。
轻量的封装，简单易用
配置代码：
```
@interface ViewController ()
@property(nonatomic, strong)AGSCircleProgressView *loadingProgressView;
@property(nonatomic,strong)UISlider *slider;
@end

@implementation ViewController
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
@end
```

//
//  ViewController.m
//  AAChartsDemo
//
//  Created by 王雪剑 on 2019/1/7.
//  Copyright © 2019年 zkml－wxj. All rights reserved.
//

#import "ViewController.h"
#import "AAChartKit.h"


@interface ViewController ()
@property (nonatomic, strong) AAChartModel *aaChartModel;
@property (nonatomic, strong) AAChartView  *aaChartView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self ss];
}

- (void)ss{
    self.aaChartView = [[AAChartView alloc]initWithFrame:CGRectMake(20,
                                                                    0,
                                                                    self.view.frame.size.width-40,
                                                                    self.view.frame.size.height)];
    self.view.backgroundColor = [UIColor whiteColor];
    self.aaChartView.scrollEnabled = NO;
    self.aaChartView.contentHeight = self.aaChartView.frame.size.height-80;
    [self.view addSubview:self.aaChartView];
    
    self.aaChartModel = [self configureTheChartModel];
    
    [self.aaChartView aa_drawChartWithChartModel:_aaChartModel];
}


    
        
- (AAChartModel *)configureTheChartModel{
    bool bool_false = false;
    
    AAChartModel *aaChartModel= AAChartModel.new
    .chartTypeSet(AAChartTypePie)
    .colorsThemeSet(@[@"#03a9f4",@"#ff6040",@"#3dcc6d",@"#ff992b",@"#333333"])
    .titleSet(@"")
    .subtitleSet(@"")
    .dataLabelEnabledSet(true)//是否直接显示扇形图数据
    .yAxisTitleSet(@"摄氏度")
    .seriesSet(
               @[
                 AASeriesElement.new
                 .nameSet(@"语言热度值")
                 .innerSizeSet(@"50%")//内部圆环半径大小占比
                 .sizeSet([NSNumber numberWithInt:(self.view.frame.size.width-200)])//尺寸大小
                 .borderWidthSet(@0)//描边的宽度
                 .allowPointSelectSet(false)//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
                 .statesSet(@{@"hover": @{@"enabled": @(bool_false)}})//禁用点击区块之后出现的半透明遮罩层 (先定义bool变量的原因是，直接用true，false，处理完成之后容易变成0或者1。https://www.cnblogs.com/haojuncong/p/4652998.html )
                 .dataSet(
                          @[
                            @[@"Firefox",   @336.2],
                            @[@"IE",        @26.8],
                            @{
                                @"name":@"Chrome",
                                @"y":@100.8,
                                @"sliced":@(false),
                                @"selected":@(false)
                                },
                            @[@"Safari",    @0],
                            @[@"Opera",     @46.0],
                            ]
                          ),
                 ]
               )
    ;
    
    return aaChartModel;
            
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

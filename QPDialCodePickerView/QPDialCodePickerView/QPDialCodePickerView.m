//
//  QPDialCodePickerView.m
//  QPDialCodePickerView
//
//  Created by pcjbird on 2017/6/29.
//  Copyright © 2017年 Zero Status. All rights reserved.
//

#import "QPDialCodePickerView.h"
#import "QPDialCodePickerViewDefine.h"
#import "QPDialCodePickerViewDataSource.h"

@interface QPDialCodePickerView()<UIPickerViewDelegate,UIPickerViewDataSource,UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIView *alertView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *trailingConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@property (nonatomic, strong)QPDialCodePickerViewResultBlock complete;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *tapGesutre;

@property (nonatomic, strong) QPDialCodeObject *scrollToObject;

- (IBAction)OnConfirmBtnClick:(id)sender;
- (IBAction)dismiss:(id)sender;
@end

@implementation QPDialCodePickerView

+ (NSString*)version
{
    return QPDCPV_VERSION;
}

+ (NSString*)buildVersion
{
    return QPDCPV_BUILD_VERSION;
}

+ (NSString*)currentLocaleDialCode
{
    return [[[QPDialCodePickerViewDataSource sharedInstance] dataSourceWithFormat:QPDialCodeAreaNameFormatCurrentLocale] firstObject].dial_code;
}

/**
 * @brief 初始化国际区号选择器
 * @param format 地区名称显示格式
 * @param complete 选择结果回调block
 */
-(instancetype)initWithAreaFormat:(QPDialCodeAreaNameFormat)format complete:(QPDialCodePickerViewResultBlock)complete
{
    self = [super init];
    if (self) {
        self = [[QP_DCPV_BUNDLE loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
        [self defaultConfig];
        [self setAreaFormat:format];
        [self setupUI];
        self.complete = complete;
        
    }
    return self;
}

-(void) defaultConfig
{
    [self setDoneButtonColor:[UIColor blackColor]];
    [self setDoneButtonTitle:QP_DCPV_LocalizedString(@"Confirm")];
    [self setAreaFormat:QPDialCodeAreaNameFormatCurrentLocale];
    [self setGrayMaskBack:YES];
    _roundCorner = NO;
    self.scrollToObject = [[[QPDialCodePickerViewDataSource sharedInstance] dataSourceWithFormat:_areaFormat] firstObject];
}

-(void)setupUI
{
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    self.tapGesutre.delegate = self;
    self.frame=CGRectMake(0, 0, kQPDCPVScreenWidth, kQPDCPVScreenHeight);
    self.bottomConstraint.constant = -self.frame.size.height;
    self.backgroundColor = RGBA(0, 0, 0, 0);
    [self layoutIfNeeded];
    [KeyWindow bringSubviewToFront:self];
}


-(void)setDoneButtonColor:(UIColor *)doneButtonColor
{
    _doneButtonColor = doneButtonColor;
    self.confirmBtn.backgroundColor = _doneButtonColor;
}

-(void)setDoneButtonTitle:(NSString *)doneButtonTitle
{
    _doneButtonTitle = doneButtonTitle;
    [self.confirmBtn setTitle:_doneButtonTitle forState:UIControlStateNormal];
    [self.confirmBtn setTitle:_doneButtonTitle forState:UIControlStateHighlighted];
    [self.confirmBtn setTitle:_doneButtonTitle forState:UIControlStateSelected];
}

-(void)setGrayMaskBack:(BOOL)grayMaskBack
{
    _grayMaskBack = grayMaskBack;
    self.backgroundColor = _grayMaskBack ? [UIColor colorWithWhite:0.0f alpha:0.4f] : [UIColor clearColor];
}

-(void)setRoundCorner:(BOOL)roundCorner
{
    _roundCorner = roundCorner;
    self.alertView.layer.cornerRadius = _roundCorner ? 10 : 0;
    self.leadingConstraint.constant = self.trailingConstraint.constant = self.bottomConstraint.constant = _roundCorner ? 10 : 0;
    self.alertView.layer.masksToBounds = YES;
}

-(void)setAreaFormat:(QPDialCodeAreaNameFormat)areaFormat
{
    _areaFormat = areaFormat;
    [self.pickerView reloadAllComponents];
}

/**
 * @brief 显示国际区号选择器
 */
-(void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:.3 animations:^{
        self.bottomConstraint.constant = _roundCorner ? 10 : 0;
        self.backgroundColor =  _grayMaskBack ? RGBA(0, 0, 0, 0.4) : [UIColor clearColor];
        [self layoutIfNeeded];
    }];
}

- (IBAction)OnConfirmBtnClick:(id)sender {
    if(self.complete)
    {
        self.complete(self.scrollToObject);
    }
    [self dismiss:nil];
}

- (IBAction)dismiss:(id)sender {
    [UIView animateWithDuration:.3 animations:^{
        self.bottomConstraint.constant = -self.frame.size.height;
        self.backgroundColor = RGBA(0, 0, 0, 0);
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self removeFromSuperview];
    }];
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if( [touch.view isDescendantOfView:self.alertView]) {
        return NO;
    }
    return YES;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [[[QPDialCodePickerViewDataSource sharedInstance] dataSourceWithFormat:self.areaFormat] count];
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}


-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *customLabel = (UILabel *)view;
    if (!customLabel) {
        customLabel = [[UILabel alloc] init];
        customLabel.textAlignment = NSTextAlignmentCenter;
        [customLabel setFont:[UIFont systemFontOfSize:17]];
    }
    NSArray <QPDialCodeObject *>* items = [[QPDialCodePickerViewDataSource sharedInstance] dataSourceWithFormat:self.areaFormat];
    customLabel.text = [[items objectAtIndex:row] description];
    return customLabel;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.scrollToObject = [[[QPDialCodePickerViewDataSource sharedInstance] dataSourceWithFormat:self.areaFormat] objectAtIndex:row];
}

@end

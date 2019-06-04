![logo](logo.png)
[![Build Status](http://img.shields.io/travis/pcjbird/QPDialCodePickerView/master.svg?style=flat)](https://travis-ci.org/pcjbird/QPDialCodePickerView)
[![Pod Version](http://img.shields.io/cocoapods/v/QPDialCodePickerView.svg?style=flat)](http://cocoadocs.org/docsets/QPDialCodePickerView/)
[![Pod Platform](http://img.shields.io/cocoapods/p/QPDialCodePickerView.svg?style=flat)](http://cocoadocs.org/docsets/QPDialCodePickerView/)
[![Pod License](http://img.shields.io/cocoapods/l/QPDialCodePickerView.svg?style=flat)](https://www.apache.org/licenses/LICENSE-2.0.html)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/pcjbird/QPDialCodePickerView)
[![GitHub release](https://img.shields.io/github/release/pcjbird/QPDialCodePickerView.svg)](https://github.com/pcjbird/QPDialCodePickerView/releases)
[![GitHub release](https://img.shields.io/github/release-date/pcjbird/QPDialCodePickerView.svg)](https://github.com/pcjbird/QPDialCodePickerView/releases)
[![Website](https://img.shields.io/website-pcjbird-down-green-red/https/shields.io.svg?label=author)](https://pcjbird.github.io)

# QPDialCodePickerView 

### International Dial Code Picker View for Country or Area 国家或地区国际区号选择器
   
## 特性 / Features

1.自定义确定按钮背景颜色。

2.自定义确定按钮标题。

3.支持多种地区名称显示格式:根据当前地区本地化所有地区名称／根据地区自身本地化地区名称/根据美国 (US) 地区本地化所有地区名称。

4.可配置是否显示灰色背景蒙版。

5.可配置是否显示圆角。

6.默认按钮“确定”已经国际化，请确保主工程项目支持该语言国际化选项，在项目 `PROJECT` - `Localizations` 中添加。

7.当前地区及当前时区的地区会显示在选择器的最前面。

## 演示 / Demo 

<p align="center" >
  <img src="https://github.com/pcjbird/QPDialCodePickerView/raw/master/demo.gif" title="demo">
</p>

<p align="center" >
  <img src="https://github.com/pcjbird/QPDialCodePickerView/raw/master/demo2.gif" title="demo">
</p>

## 安装 / Installation

方法一：直接下载, 打开工作区 `QPDialCodePickerView.xcworkspace`, 选择 Target `QPDialCodePickerView-Universal`进行编译，在根目录下的 `product` 目录下会生成 `QPDialCodePickerView.framework` 和 `QPDialCodePickerView.bundle`, 将这两个文件添加到您的项目中即可。

方法二：`QPDialCodePickerView` is available through CocoaPods. To install it, simply add the following line to your Podfile:

```
pod "QPDialCodePickerView"
```

方法三： 使用Carthage安装

`Cartfile`如下:
```
github "pcjbird/QPDialCodePickerView"
```

## 使用 / Usage

```
 __weak typeof (UIButton*) weakBtn = self.btnDialCode;
 QPDialCodePickerView *pickerView = [[QPDialCodePickerView alloc] initWithAreaFormat:QPDialCodeAreaNameFormatCurrentLocale complete:^(QPDialCodeObject *item) {
     [weakBtn setTitle:[NSString stringWithFormat:@"+%@", item.dial_code] forState:UIControlStateNormal];
 }];
 pickerView.roundCorner = YES;
 [pickerView show];
```

## 关注我们 / Follow us

<a href="https://itunes.apple.com/cn/app/iclock-一款满足-挑剔-的翻页时钟与任务闹钟/id1128196970?pt=117947806&ct=com.github.pcjbird.QPDialCodePickerView&mt=8"><img src="https://github.com/pcjbird/AssetsExtractor/raw/master/iClock.gif" width="400" title="iClock - 一款满足“挑剔”的翻页时钟与任务闹钟"></a>

<a href="https://itunes.apple.com/cn/app/%E8%90%8C%E9%B1%BC%E8%BE%A8%E8%89%B2-%E4%B8%80%E6%AC%BE%E6%9C%89%E8%B6%A3%E7%9A%84%E9%A2%9C%E8%89%B2%E8%AF%86%E5%88%AB%E4%B8%8E%E4%BB%A3%E7%A0%81%E7%94%9F%E6%88%90%E5%B7%A5%E5%85%B7/id1234015415?pt=117947806&ct=com.github.pcjbird.QPDialCodePickerView&mt=8"><img src="Color Sniffer.png" width="686" title="Color Sniffer - 一款有趣的颜色识别与代码生成工具"></a>

<a href="https://itunes.apple.com/cn/app/iclock-simplest-always-best/id1128196970?pt=117947806&ct=com.github.pcjbird.QPDialCodePickerView&mt=8"><img src="iClock_appinn.png" title="iClock - 一款满足“挑剔”的翻页时钟与任务闹钟"></a>

[![Twitter URL](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?text=https://github.com/pcjbird/QPDialCodePickerView)
[![Twitter Follow](https://img.shields.io/twitter/follow/pcjbird.svg?style=social)](https://twitter.com/pcjbird)

![logo](logo.png)

# QPDialCodePickerView 

   international dial code picker view for country or area 国家或地区国际区号选择器

## Demo 
![demo](demo.gif)

## Installation

QPDialCodePickerView is available through CocoaPods. To install it, simply add the following line to your Podfile:

```
pod "QPDialCodePickerView"
```

## Usage

```
    __weak typeof (UIButton*) weakBtn = self.btnDialCode;
    QPDialCodePickerView *pickerView = [[QPDialCodePickerView alloc] initWithAreaFormat:QPDialCodeAreaNameFormatCurrentLocale complete:^(QPDialCodeObject *item) {
        [weakBtn setTitle:[NSString stringWithFormat:@"+%@", item.dial_code] forState:UIControlStateNormal];
    }];
    pickerView.roundCorner = YES;
    [pickerView show];
```

## Follow us

[![Twitter URL](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?text=https://github.com/pcjbird/QPDialCodePickerView)
[![Twitter Follow](https://img.shields.io/twitter/follow/pcjbird.svg?style=social)](https://twitter.com/pcjbird)

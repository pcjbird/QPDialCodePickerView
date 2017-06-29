![logo](logo.png)

## Demo 
![demo](demo.gif)

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

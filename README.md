# Button
Buttons are clickable elements used to trigger actions

## Specifications

The button specifications on Zeroheight is [here](https://spark.adevinta.com/1186e1705/p/34b742-button).

![Figma anatomy](https://github.com/adevinta/spark-ios-component-button/blob/main/.github/assets/anatomy.png)

## Usage

Button is available both in UIKit and SwiftUI.

### UIKit

### Usage

#### Subviews

* `imageView`: The image view of the button.
* `titleLabel`: The title label of the button.

#### Properties

* `theme`: The current Spark-Theme. [You can always define your own theme.](https://github.com/adevinta/spark-ios/wiki/Theming#your-own-theming)
* `intent`: The button intent, e.g. main, support.
* `variant`: The button variant, e.g. filled, tinted.
* `size`: The button size, e.g. medium, large.
* `shape`: The button shape, e.g. pill, rounded.
* `alignment`: The button content alignment, e.g. leadingImage, trailingImage.
* `isEnabled`: A Boolean value indicating whether the button is in the enabled state.
* `isSelected`:A Boolean value indicating whether the button is in the selected state.
* `isHighlighted`: A Boolean value indicating whether the button draws a highlight.
* `isAnimated`: Button modifications should be animated or not. **True** by default.

#### Published Properties

* `tapPublisher`: The tap publisher. Alternatively, you can **action** or **target**.
* `touchCancelPublisher`: Publishes when a touch was cancelled (e.g. by the system).
* `touchUpOutsidePublisher`: Publishes when a touch was started but the touch ended outside of the button view bounds.
* `touchDownPublisher`: Publishes instantly when the button is touched down. **Warning**: This should not trigger a user action and should only be used for things like tracking.

#### Initialization

There is one possibility to initialize the button.

```swift
let button = ButtonUIView(
    theme: theme,
    intent: .main,
    variant: .filled,
    size: .medium,
    shape: .rounded,
    alignment: .leadingIcon
)
```

#### Getter / Setter

There is the possibilty to **get** and **set** **image**, **title** and **attributedTitle** for a states. 

All theses properties are optional.

- image: 
```swift
let button = ButtonUIView(...)

// Set image for state
button.setImage(UIImage(), for: .touchUpInside)

// Get the image for state
let image = button.image(for: .touchUpInside)
```

- title: 
```swift
let button = ButtonUIView(...)

// Set title for state
button.setTitle("Text", for: .touchUpInside)

// Get the title for state
let image = button.title(for: .touchUpInside)
```


- attributedTitle: 
```swift
let button = ButtonUIView(...)

// Set attributedTitle for state
button.setAttributedTitle(NSAttributedString(string: "Text"), for: .touchUpInside)

// Get the attributedTitle for state
let image = button.attributedTitle(for: .touchUpInside)
```

#### States

Because the button inherits from the **UIControl**, you can set and get theses properties: 
- **isEnabled**
- **isSelected**
- **isHighlighted**

#### Actions

Because the button inherits from the **UIControl**, you can **add** and **remove** **actions** and/or **target** for a states.

- actions: 
```swift
let button = ButtonUIView(...)

let action: UIAction = .init(handler: { _ in }
// Add action for state
self.buttonView.addAction(
    action, 
    for: .touchUpInside
)
// Remove action for state
self.buttonView.addAction(
    action, 
    for: .touchUpInside
)
```
- targets:
```swift
let button = ButtonUIView(...)

let action: UIAction = .init(handler: { _ in }
// Add target for state
self.buttonView.addTarget(
    self, 
    action: #selector(self.touchUpInsideTarget), 
    for: .touchUpInside
)
// Remove target for state
self.buttonView.removeTarget(
    self, 
    action: #selector(self.touchUpInsideTarget), 
    for: .touchUpInside
)

@objc func touchUpInsideTarget() {
   //...
}
``` 

It also possible to receive action from **publisher** presented above.

### SwiftUI

#### Initialization

There is only one possibility to initialize the button.

```swift
let textLink = ButtonView(
    theme: theme,
    intent: .main,
    variant: .filled,
    size: .medium,
    shape: .rounded,
    alignment: .leadingIcon
    action: {
        print("My button is tapped !")
    }
)
```

#### Modifier

To update Button there are several functions available:
- Set the max width and the alignment of the button.
```swift
func frame(maxWidth: CGFloat? = nil, alignment: Alignment = .center) -> ButtonView
```
*Note: Please use this method instead of the native one.*

- Set the image of the button for a state.
```swift
func image(_ image: Image?, for state: ControlState) -> ButtonView
```

- Set the title of the button for a state.
```swift
func title(_ title: String?, for state: ControlState) -> ButtonView
```

- Set the attributedTitle of the button for a state.
```swift
func attributedTitle(_ attributedTitle: AttributedString?, for state: ControlState) -> ButtonView
```

- Set the button to disabled.
```swift
func disabled(_ isDisabled: Bool) -> ButtonView
```

- Set the button to selected.
```swift
func selected(_ isSelected: Bool) -> ButtonView
```

# Icon Button

Icon Buttons are clickable elements used to trigger actions

## Specifications

The icon button specifications on Zeroheight is [here](https://spark.adevinta.com/1186e1705/p/2352e9-icon-button/t/557b39).

![Figma anatomy](https://github.com/adevinta/spark-ios-component-button/blob/main/.github/assets/icon_anatomy.png)

## Usage

Icon Button is available both in UIKit and SwiftUI.

### UIKit

#### Subviews

* `imageView`: The image view of the icon button.

#### Properties

* `theme`: The current Spark-Theme. [You can always define your own theme.](https://github.com/adevinta/spark-ios/wiki/Theming#your-own-theming)
* `intent`: The icon button intent, e.g. main, support.
* `variant`: The icon button variant, e.g. filled, tinted.
* `size`: The icon button size, e.g. medium, large.
* `shape`: The icon button shape, e.g. pill, rounded.
* `isEnabled`: A Boolean value indicating whether the icon button is in the enabled state.
* `isSelected`:A Boolean value indicating whether the icon button is in the selected state.
* `isHighlighted`: A Boolean value indicating whether the icon button draws a highlight.
* `isAnimated`: icon button modifications should be animated or not. **True** by default.

#### Published Properties

* `tapPublisher`: The tap publisher. Alternatively, you can **action** or **target**.
* `touchCancelPublisher`: Publishes when a touch was cancelled (e.g. by the system).
* `touchUpOutsidePublisher`: Publishes when a touch was started but the touch ended outside of the icon button view bounds.
* `touchDownPublisher`: Publishes instantly when the icon button is touched down. **Warning**: This should not trigger a user action and should only be used for things like tracking.

#### Initialization

There is one possibility to initialize the icon button.

```swift
let iconButton = IconButtonUIView(
    theme: theme,
    intent: .main,
    variant: .filled,
    size: .medium,
    shape: .rounded
)
```

#### Getter / Setter

There is the possibilty to **get** and **set** **image** for a states. 

This propertiy is optional.

```swift
let iconButton = ButtonUIView(...)

// Set image for state
iconButton.setImage(UIImage(), for: .touchUpInside)

// Get the image for state
let image = iconButton.image(for: .touchUpInside)
```


#### States

Because the icon button inherits from the **UIControl**, you can set and get theses properties: 
- **isEnabled**
- **isSelected**
- **isHighlighted**

#### Actions

Because the icon button inherits from the **UIControl**, you can **add** and **remove** **actions** and/or **target** for a states.

- actions: 
```swift
let icon button = ButtonUIView(...)

let action: UIAction = .init(handler: { _ in }
// Add action for state
self.icon buttonView.addAction(
    action, 
    for: .touchUpInside
)
// Remove action for state
self.icon buttonView.addAction(
    action, 
    for: .touchUpInside
)
```
- targets:
```swift
let icon button = ButtonUIView(...)

let action: UIAction = .init(handler: { _ in }
// Add target for state
self.icon buttonView.addTarget(
    self, 
    action: #selector(self.touchUpInsideTarget), 
    for: .touchUpInside
)
// Remove target for state
self.icon buttonView.removeTarget(
    self, 
    action: #selector(self.touchUpInsideTarget), 
    for: .touchUpInside
)

@objc func touchUpInsideTarget() {
   //...
}
``` 

It also possible to receive action from **publisher** presented above.

### SwiftUI

#### Initialization

There is only one possibility to initialize the icon button.

```swift
let textLink = IconButtonView(
    theme: theme,
    intent: .main,
    variant: .filled,
    size: .medium,
    shape: .rounded,
    action: {
        print("My icon button is tapped !")
    }
)
```

#### Modifier

To update Button there are several functions available:

- Set the image of the icon button for a state.
```swift
func image(_ image: Image?, for state: ControlState) -> IconButtonView
```

- Set the icon button to disabled.
```swift
func disabled(_ isDisabled: Bool) -> IconButtonView
```

- Set the icon button to selected.
```swift
func selected(_ isSelected: Bool) -> IconButtonView
```
## License

```
MIT License

Copyright (c) 2024 Adevinta

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

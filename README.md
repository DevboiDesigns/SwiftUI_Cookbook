# SwiftUI_Cookbook
 
## WindowGroup(content: Closure)
This initializer creates a scene to manage all the windows of an instance of the application. The content argument is a closure with the code that defines what the windows are going to display. If only returning one view, do not need return.

`Window -> Root View -> Views = (Text, Image, Button)`

## Opaque Types
* `some View` 
* type: `generic`
data types that hide the values data type from the programmer
*declared with `some` keyword, followed by name of protocol it conforms too*

```swift 
func reverseIt(mylist: [String]) -> some Collection {
    let reversed = myList.reversed()
    return reversed
}
```

## Modifiers
* `View`

extends view to edges of screen 
```swift
.frame(minWidth: 0, maxWidth: .infinity)
.frame(minHeight: 0, maxHeight: .infinity)
```
edge insets 
```swift
.padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
```

padding
```swift
.padding([.top, .bottom], 50)
```

## Text

* `Text(string: )`
* `Text(Date, style: DateStyle)` - present a date. Style argument is a struct that determines the format. Type properties include `date`, `offset`, `relative`, `time`, and `timer` to define this value.

*recommended to use dynamic fonts not system or custom*

* `.font(Font)` = .body, .header, etc
* `.bold()`
* `.italic()`
* `.fontWeight(Weight)` = .heavy, etc
* `.extCase(Case)` = .uppercase, .lowercase 
* `.dynamicTypeSize(DynamicTypeSize)` = .large, .medium, .small, .xLarge, etc
* `.underline(Bool, color: Color)`
* `.strikethrough(Bool, color: Color)`
* `.shadow(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat)`
* `.font(.system(size: <CGFloat>, weight: <Font.Weight>, design: <Font.Design>))`
* `.font(.custom(String, size: CGFloat))` = PostScript name - font book -> show font info -> font -> shown in panel on right 
  

 *joining text views* 
```swift 
Text("Hello \(Text("World").underline())")
```

*combining modifiers*
```swift
.font(.largeTitle.weight(.semibold))
```

#### formatting 
* `.lineLimit(Int?)` = how many lines text can contain
* `.multilineTextAlignment(TextAlignment)`
* `.lineSpacing(CGFloat)` = space between lines 
* `.textSelection(TextSelectability)` = determines if text is selectable, copy & paste = .enabled, .disabled
* `.truncationMode(Text.TruncationMode)` = .head, .middle, .tail
* `.privacySensitive()` = view will hide sensitive information from system 
  
### currency converter 
```swift 
Text("My number: \(number.formatted(.currency(code: "USD")))")
```

### date converter
```swift
Text(today.formatted(date: .abbreviated, time: .omitted))
```

### timer 
```swift
Text(today, style: .timer)
```


## Color 
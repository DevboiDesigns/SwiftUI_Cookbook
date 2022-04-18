# SwiftUI_Cookbook
* complete overview of the `SwiftUI` framework
* Xcode vers: `13`
* Swift vers: `5`
 
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

## App icon 

* set [here](SwiftUI_Cookbook/SwiftUI_Cookbook/Assets.xcassets/AppIcon.appiconset) 
* [App icon Generator](https://appicon.co/#app-icon)

## Views 

`View`

#### Modifiers 

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

*`Materials` apply a blur effect to the background of a view*

```swift
Text("Hello World")
    .background(.red)
    .foregroundStyle(.thickMaterial)
```
```swift
.background(.thickMaterial)
.foregroundStyle(.thickMaterial)
```


### Text

 `Text`

#### Initializers 

* `Text(string: )`
* `Text(Date, style: DateStyle)` - present a date. Style argument is a struct that determines the format. Type properties include `date`, `offset`, `relative`, `time`, and `timer` to define this value.

*recommended to use dynamic fonts not system or custom*

* `.font(Font)` = `Font` - .body, .header, etc
* `.bold()`
* `.italic()`
* `.fontWeight(Weight)` = `Weight` - .heavy, etc
* `.extCase(Case)` = .uppercase, .lowercase 
* `.dynamicTypeSize(DynamicTypeSize)` = `DynamicTypeSize` - .large, .medium, .small, .xLarge, etc
* `.underline(Bool, color: Color)`
* `.strikethrough(Bool, color: Color)`
* `.shadow(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat)`
* `.font(.system(size: <CGFloat>, weight: <Font.Weight>, design: <Font.Design>))`
* `.font(.custom(String, size: CGFloat))` = PostScript name - font book -> show font info -> font -> shown in panel on right 
* `.zIndex(Double)` = float above/ below
  

 *joining text views* 
```swift 
Text("Hello \(Text("World").underline())")
```

*combining modifiers*
```swift
.font(.largeTitle.weight(.semibold))
```

##### formatting 
* `.lineLimit(Int?)` = how many lines text can contain
* `.multilineTextAlignment(TextAlignment)`
* `.lineSpacing(CGFloat)` = space between lines 
* `.textSelection(TextSelectability)` = determines if text is selectable, copy & paste = `TextSelectability` - .enabled, .disabled
* `.truncationMode(Text.TruncationMode)` = `TruncationMode` - .head, .middle, .tail
* `.privacySensitive()` = view will hide sensitive information from system 
  
#### currency converter 
```swift 
Text("My number: \(number.formatted(.currency(code: "USD")))")
```

#### date converter
```swift
Text(today.formatted(date: .abbreviated, time: .omitted))
```

#### timer 
```swift
Text(today, style: .timer)
```


### Color 

 `Color`

 #### Initializers 

* `RGBColorSpace` = .sRGB, .sRGBLinear, .displayP3
* `Color(Color.RGBColorSpace, red: Double, green: Double, blue: Double, opacity: Double)` 
* `Color(Color.RGBColorSpace, white: Double, opacity: Double)`
* `Color(hue: Double, saturation: Double, brightness: Double)` 
* `Color(Color.accentColor)` = dynamic light dark, can be predefined 
* `Color(Color.primary)` = dynamic light dark, can be predefined 
* `Color(Color.secondary)` = dynamic light dark, can be predefined 

set AccentColor for global use in [Assets.xcassets](SwiftUI_Cookbook/SwiftUI_Cookbook/Assets.xcassets) 

*view previews with dark mode*

```swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
```

```swift
.border(Color, width: CGFloat)
```

```swift
.background(alignment: Alignment, content: <() -> View>)
```

```swift
.overlay(alignment: Alignment, content: <() -> View>)
```

### Images 

`Image`

*all imported images need 3 sizes* [Image sets Generator](https://appicon.co/#image-sets)

#### Initializers

* `Image(String)`
* `Image(systemName: String)`

```swift
Image("matrix")
    .resizable()
    .scaledToFit()
    .frame(width: 250, height: 100, alignment: .center)
```

```swift
Image("matrix")
    .resizable()
    .scaledToFit()
    .cornerRadius(22)
    .padding(20)
    .shadow(color: .gray, radius: 4, x: 4, y: 0)
```

```swift
Image(systemName: "envelope.fill")
    .font(.system(size: 100))
    .symbolVariant(.fill)
```

*first color for mic, second for badge*
```swift
Image(systemName: "mic.badge.plus")
    .font(.system(size: 100))
    .symbolRenderingMode(.palette)
    .foregroundStyle(.red, .blue)
```

#### Modifiers 
* `.resizable()`
* `.clipped()` = clips image to views frame 
* `.aspectRatio(contentMode: ContentMode)`
* `.scaledToFit()`
* `.scaledToFill()`
* `.blur(radius: CGFloat, opaque: Bool)`
* `.colorMultiply(Color)`
* `.saturation(Double)`
* `.contrast(Double)`
* `.opacity(Double)`
* `.scaleEffect(CGSize)`
* `.symbolVariant(SymbolVariants)` = `SymbolVariants` - animate fill, circle, etc dynamicly 
* `.symbolRenderingMode(.multicolor)` = multi-color SF Symbols

#### Property Wrappers

` @ScaledMetric(relativeTo: TextStyle)` 
* scales a value according to the dynamic font type selected by user from settings in phone. .body, .callout, .caption, etc

```swift 
struct ContentView: View {
    
    @ScaledMetric var customSize: CGFloat = 100
 
    var body: some View {
       
       Image("matrix")
            .resizable()
            .frame(width: customSize, height: customSize)
    }
}
```


### Label

`Label`

#### Initializers

* `Label(StringProtocol, systemImage: String)`
* `Label(StringProtocol, image: String)`

```swift
Label("Record", systemImage: "mic.badge.plus")
    .labelStyle(.titleAndIcon)
```
  
#### Modifiers
* `.labelStyle(LabelStyle)` = `LabelStyle` - .automatic, .iconOnly, .titleAndIcon, .titleOnly


## Event Modifiers 

### onAppear(perform: Closure)
executes closure when view appears 

```swift
Label("Record", systemImage: "mic.badge.plus")
    .labelStyle(.titleAndIcon)
    .onAppear {
        // Do Something
}
 ```

### onDisapper(perform: Closure)
executes closure when view disappears 

```swift
Label("Record", systemImage: "mic.badge.plus")
    .labelStyle(.titleAndIcon)
    .onDisappear {
        // Do something
}
```

## Custom Modifiers 

```swift
struct MyModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 13))
            .foregroundColor(.blue)
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .modifier(MyModifiers())
    }
}
```

*dynamic*
```swift
struct MyModifiers: ViewModifier {
    var size: CGFloat
    
    init(size: CGFloat) {
        self.size = size
    }
    
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: size))
            .foregroundColor(.blue)
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .modifier(MyModifiers(size: 13))
    }
}
```

## Stacks

* Horizontal - `HStack`
* Vertical - `VStack`
* Overlapping - `ZStack`


```swift
VStack(alignment: HorizontalAlignment, spacing: CGFloat?, content: <() -> _>)
```

```swift
ZStack(alignment: Alignment, content: <() -> _>)
```

## Spacer

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Text("Up")
                Spacer() // -- will push views as far apart as possible
            Text("Down")
        }
    }
}
```

## Safe Area

* `.container` will dynamically move for keyboard etc.

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image(systemName: "cloud")
                VStack(alignment: .leading) {
                    Text("City")
                        .foregroundColor(Color.gray)
                    Text("New York")
                        .font(.title)
                }
                Spacer()
            }
        }.ignoresSafeArea(.container, edges: .bottom)
    }
}
```

* `.safeAreaInset(edge: VerticalEdge, content: <() -> View>)`

will inject a view in the area defined 

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image(systemName: "cloud")
                VStack(alignment: .leading) {
                    Text("City")
                        .foregroundColor(Color.gray)
                    Text("New York")
                        .font(.title)
                }
                Spacer()
            }
        }
        .safeAreaInset(edge: .bottom) {
            HStack {
                Spacer()
                Text("Important")
                    .padding()
                Spacer()
            }.background(.blue)
        }
    }
}
```


## Priorities 

* `.layoutPriority(Double)`
  sets views priority, higher value determines that view will get as much space as possible default = `0`

* `.fixedSize(horizontal: Bool, vertical: Bool)`
  fixes the view to its ideal horizontal or vertical size, if no parameters it is fixed on both





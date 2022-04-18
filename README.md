# SwiftUI Cookbook
* complete overview of the `SwiftUI` framework
* Xcode vers: `13`
* Swift vers: `5`
* *work in progress*
 
# WindowGroup(content: Closure)
This initializer creates a scene to manage all the windows of an instance of the application. The content argument is a closure with the code that defines what the windows are going to display. If only returning one view, do not need return.

`Window -> Root View -> Views = (Text, Image, Button)`

# Opaque Types
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

# App icon 

* set [here](SwiftUI_Cookbook/SwiftUI_Cookbook/Assets.xcassets/AppIcon.appiconset) 
* [App icon Generator](https://appicon.co/#app-icon)

# Views 

`View`

### Modifiers 

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


## Text

 `Text`

### Initializers 

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

#### formatting 
* `.lineLimit(Int?)` = how many lines text can contain
* `.multilineTextAlignment(TextAlignment)`
* `.lineSpacing(CGFloat)` = space between lines 
* `.textSelection(TextSelectability)` = determines if text is selectable, copy & paste = `TextSelectability` - .enabled, .disabled
* `.truncationMode(Text.TruncationMode)` = `TruncationMode` - .head, .middle, .tail
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

 `Color`

 ### Initializers 

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

## Images 

`Image`

*all imported images need 3 sizes* [Image sets Generator](https://appicon.co/#image-sets)

### Initializers

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

### Modifiers 
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

### Property Wrappers

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


## Label

`Label`

### Initializers

* `Label(StringProtocol, systemImage: String)`
* `Label(StringProtocol, image: String)`

```swift
Label("Record", systemImage: "mic.badge.plus")
    .labelStyle(.titleAndIcon)
```
  
### Modifiers
* `.labelStyle(LabelStyle)` = `LabelStyle` - .automatic, .iconOnly, .titleAndIcon, .titleOnly


# Event Modifiers 

## onAppear(perform: Closure)
executes closure when view appears 

```swift
Label("Record", systemImage: "mic.badge.plus")
    .labelStyle(.titleAndIcon)
    .onAppear {
        // Do Something
}
 ```

## onDisapper(perform: Closure)
executes closure when view disappears 

```swift
Label("Record", systemImage: "mic.badge.plus")
    .labelStyle(.titleAndIcon)
    .onDisappear {
        // Do something
}
```

# Custom Modifiers 

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

# Stacks

*maximum 10 views - contained in tuple*

* Horizontal - `HStack`
* Vertical - `VStack`
* Overlapping - `ZStack`


```swift
VStack(alignment: HorizontalAlignment, spacing: CGFloat?, content: <() -> _>)
```

```swift
ZStack(alignment: Alignment, content: <() -> _>)
```

# Spacer

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

# Safe Area

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


# Priorities 

* `.layoutPriority(Double)`
  sets views priority, higher value determines that view will get as much space as possible default = `0`

* `.fixedSize(horizontal: Bool, vertical: Bool)`
  fixes the view to its ideal horizontal or vertical size, if no parameters it is fixed on both

* `.fixedSize()`

```swift
struct ContentView: View {
    var body: some View {
        HStack {
            Text("Manchester")
                .font(.title)
                .lineLimit(1)
                .fixedSize()
            Image(systemName: "cloud")
                .font(.system(size: 80))
            Text("New Yorker")
                .font(.title)
                .lineLimit(1)
                .layoutPriority(1)
        }
    }
}
```

# Alignment

## alignmentGuide

`.alignmentGuide(_, computeValue: Closure)`

```swift
struct ContentView: View {
    var body: some View {
        HStack {
            Image(systemName: "person")
                .alignmentGuide(VerticalAlignment.center) { dim in
                    return dim[VerticalAlignment.center] + 45 // offset from defined alignment
                }
            Image("matrix")
                .resizable()
                .scaledToFit()
            Image(systemName: "person")
        }
        .border(.blue, width: 2)
    }
}
```

## custom alignment

*extension*

```swift
extension VerticalAlignment {
    enum BusAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[VerticalAlignment.center]
        }
    }
}

```

*usage*

```swift
struct ContentView: View {
    var body: some View {
        HStack(alignment: .alignImage) {
            Image(systemName: "person")
                .alignmentGuide(.alignImage) { dim in dim[VerticalAlignment.center] - 40 }
            VStack {
                Image("matrix")
                    .resizable()
                    .scaledToFit()
            }
            Image("matrix")
                .resizable()
                .scaledToFit()
            
            Image(systemName: "person")
                .alignmentGuide(.alignImage) { dim in dim[VerticalAlignment.center] - 40 }
        }
        .border(.blue, width: 2)
    }
}
```

# Group Views

`Group(content: Closure)`

group views together 

*insert if/ else conditional logic in group views*

```swift
struct ContentView: View {
    var body: some View {
        let valid = true
        
        return Group {
            if valid {
                Image(systemName: "keyboard")
            } else {
                Text("The state is not valid")
            }
        }
    }
}
```

# Generic Views

custom generic views

* `AnyView(View)`

```swift
struct ContentView: View {
    var body: some View {
       getView()
    }
    
    func getView() -> AnyView {
        let valid = true
        var myView: AnyView!
        
        if valid {
            myView = AnyView(Image(systemName: "keyboard"))
        } else {
            myView = AnyView(Text("The state is not valid"))
        }
        return myView
    }
}
```

* `@ViewBuilder` - property wrapper
  
*better approach*

```swift
struct ContentView: View {
    var body: some View {
       getView()
    }
    
    @ViewBuilder
    func getView() -> some View {
        let valid = false
        
        if valid {
            Image(systemName: "keyboard")
        } else {
           Text("The state is not valid")
        }
    }
}
```
* `EmptyView()`
  
will not affect interface - placeholder view for dynamic view selection 

```swift
@ViewBuilder
    func getView() -> some View {
        let valid = false
        
        if valid {
            EmptyView()
        } else {
           Text("The state is not valid")
        }
    }
```

# Preview Modifiers

* `xcrun simctl list devicetypes` in terminal to see a list of all devices 

```swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13")
            .previewDisplayName("Test Name")
            .previewLayout(.sizeThatFits)
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
```

*multiple simulators at once*

```swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 13")
                .previewDisplayName("Phone 13")
            ContentView()
                .previewDevice("iPhone 8")
                .previewDisplayName("Phone 8")
        }
    }
}
```

# Enviorment

*Like an external storage space accesible anywhere in our code*
Data structure that belongs to application and contains data about app and views.

* `.environment(KeyPath, Value)`
processes the view and returns a new one with the characteristics defined by the arguments

- First Argument: `KeyPath` = key path to enviorment property we want to modify
- Second Argument: `Value` = value we want to assign to that property 

* `.environment(\.colorScheme, .dark)`
* `.environment(\.dynamicTypeSize, .large)`
* `.environment(\.font, .title)`
* `accessibilityEnabled`
* `layoutDirection`
* `.environment(\.calendar, .autoupdatingCurrent)`
* `.environment(\.locale, .current)`
* `timeZone`


# Property Wrappers 

**Declaritive User Interface**

*like computed properties*

allow us to encapsulate functionality in a property, applicable to multiple properties 

* must include a property with name wrappedValue to process and store value
* must also include an initializer for wrapped value property 

## Custom Property Wrapper

```swift
@propertyWrapper
struct ClampedValue {
    var storedValue: Int = 0
    var min: Int = 0
    var max: Int = 255
    
    var wrappedValue: Int {
        get {
            return storedValue
        }
        set {
            if newValue < min {
                storedValue = min
            } else if newValue > max {
                storedValue = newValue
            } else {
                storedValue = newValue
            }
        }
    }
    
    init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue
    }
}
```

*usage*

```swift
struct Price {
    @ClampedValue var firstPrice: Int
    @ClampedValue var secondPrice: Int
    
    func printMessage() {
        print("First price: \(firstPrice)")
        print("Second price: \(secondPrice)")
    }
}

var purchase = Price(firstPrice: -42, secondPrice: 350)
purchase.printMessage()
```

## @State 

`@State`

designed to store the states of a single view 

* declare as `private`
* unidirectional - property modified, view updated
* bidirectional - values modified by the user `$` = prefix name of property 


```swift
struct ContentView: View {
    
    @State private var title: String = "Default Title"
    
    var body: some View {
        VStack {
            Text(title)
                .padding(10)
            Button  {
                title = "My new title"
            } label: {
                Text("Change title")
            }
            Spacer()
        }.padding()
    }
}
```

## @Binding

`@Binding`

used to create a bidirectional connection between the @State properties defined in one view and the code in the other

```swift
struct HeaderView: View {
    
    @Binding var title: String
    
    var body: some View {
        Text(title)
            .padding(10)
    }
}

struct ContentView: View {
    
    @State private var title: String = "Default Title"
    @State private var titleInput: String = ""
    
    var body: some View {
        VStack {
            HeaderView(title: $title)
            TextField("Insert Title", text: $titleInput)
                .textFieldStyle(.roundedBorder)
            
            Button  {
                title = titleInput
                titleInput = ""
            } label: { Text("Change title") }
            Spacer()
        }.padding()
    }
}
```

### Binding Structures 

The structure that defines the `@State` property wrapper is called State. This is a generic structure and therefore it can process values of any type.

* `wrappedValue` - this property returns the value managed by the `@State` property
* `projectedValue` - this property returns a structure of type `@Binding` that creates the bidirectional binding with the view

*not neccesary*

```swift
struct ContentView: View {
    
    @State private var title: String = "Default Title"
    @State private var titleInput: String = ""
    
    var body: some View {
        VStack {
            HeaderView(title: _title.projectedValue)
            TextField("Insert Title", text: _titleInput.projectedValue)
                .textFieldStyle(.roundedBorder)
            
            Button  {
                _title.wrappedValue = _titleInput.wrappedValue
                _titleInput.wrappedValue = ""
            } label: { Text("Change title") }
            Spacer()
        }.padding()
    }
}
```

**SwiftUI doesnt allow us to access and work with `@State` properties outside the closure assigned to the body property, but we can replace one State structure by another**

#### Initializers

* `State(initialValue: Value)`
* `State(wrappedValue: Value)`

* Custom `@State` initializer

*only recommended when there are no other options, if possible use `onAppear()` or by storing in an observable object*

```swift 
struct ContentView: View {
    
    @State private var title: String = "Default Title"
    @State private var titleInput: String = ""
    
    init() {
        _titleInput = State(initialValue: "Hello World")
    }
    
    var body: some View {
        VStack {
            HeaderView(title: _title.projectedValue)
            TextField("Insert Title", text: _titleInput.projectedValue)
                .textFieldStyle(.roundedBorder)
            
            Button  {
                _title.wrappedValue = _titleInput.wrappedValue
                _titleInput.wrappedValue = ""
            } label: { Text("Change title") }
            Spacer()
        }.padding()
    }
}
```

* Custom `@Binding` initializer 

```swift
struct HeaderView: View {
    
    @Binding var title: String
    let counter: Int
    
    init(title: Binding<String>) {
        _title = title
        
        let sentence = title.wrappedValue
        counter = sentence.count
    }
    
    var body: some View {
        Text("\(title) (\(counter))")
            .padding(10)
    }
}
```

**Binding in Previews**

```swift
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        let constantValue = Binding<String>(
            get: { return "My preview title"},
            set: { value in
                print(value)
            }
        )
        return HeaderView(title: constantValue)
    }
}
```

## @Enviornment

* [Enviorment Properties](#Enviorment) - available properties 

```swift
struct ContentView: View {

    @Environment(\.colorScheme) var mode
    
    var body: some View {
       Image(systemName: "trash")
            .font(Font.system(size: 100))
            .foregroundColor(mode == .dark ? Color.yellow : Color.blue)
            .symbolVariant(mode == .dark ? .fill : .circle)
    }
}
```

## Model and State 

### ObservableObject
Define a class that conforms to `ObservableObject` protocol

### @Published
Define the properties we want to use to store the states with `@Published` property wrapper 
* `ObservableObject` level 

```swift
final class ApplicationData: ObservableObject {
    @Published var title: String = "Default Title"
    @Published var titleInput: String = ""
}
```

### @StateObject
Store an instance of this model with the `@StateObject` property wrapper 
* `App` level 

```swift
@main
struct SwiftUI_CookbookApp: App {
    
    @StateObject private var appData = ApplicationData()
    
    var body: some Scene {
        WindowGroup {
            ContentView(appData: appData)
        }
    }
}
```

### @ObservedObject
Then include a property with the `@ObservedObject` property wrapper inside every view we want to connect this model
* `View` level 

```swift
struct ContentView: View {
    
    @ObservedObject var appData: ApplicationData

    @Environment(\.colorScheme) var mode
    
    var body: some View {
       Text(appData.title)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(appData: ApplicationData())
    }
}
```

**not ideal to store private state of a view in an apps model**
*scalable solution*


```swift

final class ApplicationData: ObservableObject {
    @Published var title: String = "Default Title"
}

final class ContentViewData: ObservableObject {
    @Published var titleInput: String = ""
}

struct ContentView: View {
    @ObservedObject var contentData = ContentViewData()
    @ObservedObject var appData: ApplicationData
    
    /*     same as onAppear
    init(appData: ApplicationData) {
        self.appData = appData
        contentData.titleInput = self.appData.title
    }
     */
    
    var body: some View {
        VStack(spacing: 8) {
            Text(appData.title)
                .padding(10)
            TextField("Insert title", text: $contentData.titleInput)
                .textFieldStyle(.roundedBorder)
            Button {
                appData.title = contentData.titleInput
            } label: { Text("Save") }
            Spacer()
        }
        .padding()
        .onAppear {
            contentData.titleInput = appData.title
        }
    }
}
```

## @EnviornmentObject

* Top Level 

```swift
@main
struct SwiftUI_CookbookApp: App {
    
    @StateObject private var appData = ApplicationData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appData)
        }
    }
}
```

* View Level

```swift
struct ContentView: View {
    
    @EnvironmentObject var appData: ApplicationData
    
    var body: some View {
        Text(appData.title)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ApplicationData())
    }
}
```
import Foundation
public struct Item {
    var name: String

    public init( name: String) {
        self.name = name

    }
}

public struct Section {

    var items: [Item]
    var collapsed: Bool
    
    public init( items: [Item], collapsed: Bool = true) {

        self.items = items
        self.collapsed = collapsed
    }
}

public var sectionsData: [Section] = [
    Section(items: [
        Item(name: "Apple's ultraportable laptop, trading portability for speed and connectivity."),
        ]),
    Section( items: [
        Item( name: "iPad Pro delivers epic power, in 12.9-inch and a new 10.5-inch size."),
        ]),
    Section( items: [
        Item( name: "The iPhone 6S has a similar design to the 6 but updated hardware, including a strengthened chassis and upgraded system-on-chip, a 12-megapixel camera, improved fingerprint recognition sensor, and LTE Advanced support.")
])
]

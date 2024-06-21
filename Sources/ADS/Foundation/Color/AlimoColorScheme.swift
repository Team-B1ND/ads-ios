import SwiftUI

public enum AlimoColor {}

public extension AlimoColor {
    enum Label {
        case normal
        case sub
        case alt
        case back
        case inverse
        case disabled
    }
    enum Background {
        case normal
        case sub
        case alt
        case inverse
    }
    enum Elevation {
        case black1
        case black2
        case black3
    }
    enum Color {
        case neutralPrimary
        case primary60
        case neutral90
        case neutral00
    }
    enum Warning {
        case normal
        case back
    }
}

import SwiftUI

public extension Image {
    init(icon: AlimoIconography) {
        self = Image(icon.icon, bundle: .module)
    }
}

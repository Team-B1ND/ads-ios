import SwiftUI

public extension Image {
    init(image: AlimoImage) {
        self = Image(image.image, bundle: .module)
    }
}

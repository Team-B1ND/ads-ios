import SwiftUI

public protocol SementicColor {
    var lightColor: Color { get }
    var darkColor: Color { get }
}

private extension SementicColor {
    var P: AlimoPallete { AlimoPallete.shared }
}

// MARK: - Label
extension AlimoColor.Label: SementicColor {
    public var lightColor: Color {
        switch self {
        case .normal: P.Neutral90
        case .sub: P.Neutral70
        case .alt: P.Neutral50
        case .back: P.Neutral30
        case .inverse: P.Neutral10
        case .disabled: P.Neutral40
        }
    }
    
    public var darkColor: Color {
        switch self {
        case .normal: P.Neutral10
        case .sub: P.Neutral30
        case .alt: P.Neutral60
        case .back: P.Neutral70
        case .inverse: P.Neutral90
        case .disabled: P.Neutral40
        }
    }
}

// MARK: - Background
extension AlimoColor.Background: SementicColor {
    public var lightColor: Color {
        switch self {
        case .normal: P.Neutral00
        case .sub: P.Neutral10
        case .alt: P.Neutral10
        case .inverse: P.Neutral80
        }
    }
    
    public var darkColor: Color {
        switch self {
        case .normal: P.Neutral80
        case .sub: P.Neutral70
        case .alt: P.Neutral90
        case .inverse: P.Neutral00
        }
    }
}

// MARK: - Elevation
extension AlimoColor.Elevation: SementicColor {
    public var lightColor: Color {
        switch self {
        case .black1: Color(0xFF000000, alpha: 0.02)
        case .black2: Color(0xFF000000, alpha: 0.04)
        case .black3: Color(0xFF000000, alpha: 0.06)
        }
    }
    
    public var darkColor: Color {
        switch self {
        case .black1: Color(0xFFCCCCD6, alpha: 0.02)
        case .black2: Color(0xFFCCCCD6, alpha: 0.04)
        case .black3: Color(0xFFCCCCD6, alpha: 0.06)
        }
    }
}

// MARK: - Color
extension AlimoColor.Color: SementicColor {
    public var lightColor: Color {
        switch self {
        case .neutralPrimary: P.Neutral90
        case .primary60: P.Primary60
        case .neutral90: P.Neutral90
        case .neutral00: P.Neutral00
        case .transparent: P.Transparent
        }
    }
    
    public var darkColor: Color {
        switch self {
        case .neutralPrimary: P.Primary60
        case .primary60: P.Primary60
        case .neutral90: P.Neutral90
        case .neutral00: P.Neutral00
        case .transparent: P.Transparent
        }
    }
}

// MARK: - Warning
extension AlimoColor.Warning: SementicColor {
    public var lightColor: Color {
        switch self {
        case .normal: P.Red60
        case .back: P.Red10
        }
    }
    
    public var darkColor: Color {
        switch self {
        case .normal: P.Red60
        case .back: P.Neutral70
        }
    }
}

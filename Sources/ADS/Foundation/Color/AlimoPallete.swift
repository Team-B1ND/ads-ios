import SwiftUI

public struct AlimoPallete {
    private init() {}
    public static let shared = AlimoPallete()
    
    // MARK: - Neutral Color
    public let Neutral00 = Color(0xFFFFFFFF)
    public let Neutral10 = Color(0xFFF5F6F8)
    public let Neutral20 = Color(0xFFF1F1F4)
    public let Neutral30 = Color(0xFFE3E3E9)
    public let Neutral40 = Color(0xFFCCCCD6)
    public let Neutral50 = Color(0xFFA4A4B0)
    public let Neutral60 = Color(0xFF666674)
    public let Neutral70 = Color(0xFF2E2E32)
    public let Neutral80 = Color(0xFF202022)
    public let Neutral90 = Color(0xFF141415)
    public let Neutral100 = Color(0xFF000000)

    // MARK: - Primary Color
    public let Primary00 = Color(0xFFFFFFFF)
    public let Primary10 = Color(0xFFFFF9E5)
    public let Primary20 = Color(0xFFFFF3CC)
    public let Primary30 = Color(0xFFFFEDB2)
    public let Primary40 = Color(0xFFFFE180)
    public let Primary50 = Color(0xFFFFDB66)
    public let Primary60 = Color(0xFFFECB23)
    public let Primary70 = Color(0xFFFFC300)
    public let Primary80 = Color(0xFFCC9C00)
    public let Primary90 = Color(0xFF997500)
    public let Primary100 = Color(0xFF664E00)

    // MARK: - Red Color
    public let Red00 = Color(0xFFFFFAFA)
    public let Red10 = Color(0xFFFEECEC)
    public let Red20 = Color(0xFFFED5D5)
    public let Red30 = Color(0xFFFFB5B5)
    public let Red40 = Color(0xFFFF8C8C)
    public let Red50 = Color(0xFFFF6363)
    public let Red60 = Color(0xFFFF4242)
    public let Red70 = Color(0xFFE52222)
    public let Red80 = Color(0xFFB20C0C)
    public let Red90 = Color(0xFF750404)
    public let Red100 = Color(0xFF3B0101)

    // MARK: - Common
    public let Transparent = Color(0x00FFFFFF, alpha: 0)
}

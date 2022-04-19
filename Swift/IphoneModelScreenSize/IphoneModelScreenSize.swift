import UIKit

@objc(IphoneModelScreenSize)
public class IphoneModelScreenSize: NSObject {

    // MARK: Enums

    // swiftlint:disable identifier_name
    public enum IphoneModelScreenSize: Int {
    case notAnIphone = 0,
         twoThreeOrFour = 1,
         se = 2,
         sixSevenOrEight = 3,
         plus = 4,
         elevenXorXS = 5,
         elevenProMaxOrXsMax = 6
    }

    // MARK: Class properties

    public class func screenSize() -> IphoneModelScreenSize {
        let bounds = UIScreen.main.bounds
        let screenWidth = bounds.size.width
        let screenHeight = bounds.size.height

        switch (screenWidth, screenHeight) {
        case (320.0, 480.0):
          return .twoThreeOrFour
        case (320.0, 568.0):
          return .se
        case (375.0, 667.0):
          return .sixSevenOrEight
        case (414.0, 736.0):
          return .plus
        case (375.0, 812.0):
          return .elevenXorXS
        case (414.0, 896.0):
          return .elevenProMaxOrXsMax
        default:
          return .notAnIphone
        }
    }

    public class func screenSizeStringValue() -> String {
        return screenSizeEnumToString(screenSize())
    }

    // MARK: Private properties

    private class func screenSizeEnumToString(_ screenSize: IphoneModelScreenSize) -> String {
        var screenSizeAsString: String

        switch screenSize {
        case .notAnIphone:
            screenSizeAsString = "Not an Iphone"
        case .twoThreeOrFour:
            screenSizeAsString = "2G, 3G, 3GS, 4 or 4s"
        case .se:
            screenSizeAsString = "5, 5s, 5c or SE"
        case .sixSevenOrEight:
            screenSizeAsString = "6, 6s, 7 or 8"
        case .plus:
            screenSizeAsString = "6+, 6s+, 7+ or 8+"
        case .elevenXorXS:
            screenSizeAsString = "11 Pro, X or Xs"
        case .elevenProMaxOrXsMax:
            screenSizeAsString = "11, Xr, 11 Pro Max or Xs Max"
        }
        return screenSizeAsString
    }

}

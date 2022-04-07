import UIKit

@objc(IphoneModelScreenSize)
class IphoneModelScreenSize: NSObject {
    // swiftlint:disable identifier_name
    @objc enum IphoneModelScreenSize: Int {
    case notAnIphone = 0,
         twoThreeOrFour = 1,
         se = 2,
         sixSevenOrEight = 3,
         plus = 4,
         elevenXorXS = 5,
         elevenProMaxOrXsMax = 6
    }

    @objc class func screenSize() -> IphoneModelScreenSize {
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
}

@objc(IphoneModelScreenSize)
class IphoneModelScreenSize: NSObject {
  @objc enum IphoneModelScreenSize: Int {
    case NotAnIphone = 0,
         TwoThreeOrFour = 1,
         SE = 2,
         SixSevenOrEight = 3,
         Plus = 4,
         ElevenXorXS = 5,
         ElevenProMaxOrXsMax = 6
  }
  
  @objc class func screenSize() -> IphoneModelScreenSize {
    let bounds = UIScreen.main.bounds
    let screenWidth = bounds.size.width
    let screenHeight = bounds.size.height

    switch (screenWidth, screenHeight) {
    case (320.0, 480.0):
      return .TwoThreeOrFour
    case (320.0, 568.0):
      return .SE
    case (375.0, 667.0):
      return .SixSevenOrEight
    case (414.0, 736.0):
      return .Plus
    case (375.0, 812.0):
      return .ElevenXorXS
    case (414.0, 896.0):
      return .ElevenProMaxOrXsMax
    default:
      return .NotAnIphone
    }
  }
}
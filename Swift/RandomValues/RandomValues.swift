public extension Double {
    static func random() -> Double {
        return Double.random(in: 0...100)
    }
}

public extension String {
    static func random() -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<9).map { _ in letters.randomElement()! })
    }
}

// MARK: - Seed

public struct Seed: Equatable, Sendable {
  public static let defaultConstant: Self = .init(a: 1, b: 0, c: 6, d: 6)
  public static var random: Self = .init(
    a: UInt64.rand,
    b: UInt64.rand,
    c: UInt64.rand,
    d: UInt64.rand
  )
  let value: [UInt64]
  public init(a: UInt64, b: UInt64, c: UInt64, d: UInt64) {
    self.value = [a, b, c, d]
  }

  func raw() -> (pointer: UnsafeMutablePointer<[UInt64]>, count: UInt64) {
    let pointer = UnsafeMutablePointer<[UInt64]>.allocate(capacity: value.count)
    pointer.initialize(to: value)
    return (pointer, UInt64(value.count))
  }
}

extension UInt64 {
  fileprivate static var rand: Self {
    UInt64.random(in: UInt64.min ... UInt64.max)
  }
}
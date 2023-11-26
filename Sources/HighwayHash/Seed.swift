public struct Seed: Equatable {
  static let `default`: Self = .init(a: 1, b: 0, c: 6, d: 6)
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
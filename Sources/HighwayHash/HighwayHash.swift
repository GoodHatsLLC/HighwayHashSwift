import Bridge
import Foundation

public struct HighwayHash {

  public static let `default`: Self = .init(seed: .default)
  public init(seed: Seed) {
    self.seed = seed
  }

  private let seed: Seed

  public func of(data: Data) -> UInt64 {
    let bytes = data.map { CChar($0) }
    return bytes.withUnsafeBufferPointer { pointer in
      let raw = seed.raw()
      return HighwayHash64(raw.pointer[0], pointer.baseAddress, raw.count)
    }
  }

  public func of(_ string: String) -> UInt64 {
    of(data: Data(string.utf8.map { $0 }))
  }
}

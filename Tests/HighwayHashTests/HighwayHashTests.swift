import XCTest
@testable import HighwayHash

// MARK: - HighwayHashTests

final class HighwayHashTests: XCTestCase {

  func testDefaultSeed() throws {
    XCTAssertEqual(Seed.defaultConstant, Seed(a: 1, b: 0, c: 6, d: 6))
  }

  func testDefaultHash_matchesKnown() throws {
    let input = "battle of hastings".data
    let output = HighwayHash(seed: .defaultConstant).hash(data: input)
    XCTAssertEqual(output, UInt64(10_502_827_635_072_092_050))
  }

  func testInstanceHash_matchesKnown() throws {
    let input = "some input".data
    let hasher = HighwayHash(seed: .init(a: 1, b: 1, c: 1, d: 1))
    let value = hasher.hash(data: input)
    XCTAssertEqual(value, 7_690_291_565_961_054_682)
  }

  func testInstanceHash_isStableAcrossHashers() throws {
    let input = String(repeating: String(UInt64.rand), count: 10).data
    let seed = Seed.random
    let hasher1 = HighwayHash(seed: seed)
    let hasher2 = HighwayHash(seed: seed)
    let value1 = hasher1.hash(data: input)
    let value2 = hasher2.hash(data: input)
    XCTAssertEqual(value1, value2)
  }

  // func _testReconsume_failsToCompile() throws {
  // let hasher = HighwayHash.default
  // let x = hasher.hash(data: Data("input".utf8.map { $0 }))
  // let y = hasher.hash(data: Data("input".utf8.map { $0 }))
  // }

}

extension String {
  var data: Data {
    Data(utf8.map { $0 })
  }
}

extension UInt64 {
  static var rand: Self {
    UInt64.random(in: UInt64.min ... UInt64.max)
  }
}
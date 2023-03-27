# HighwayHashSwift

This package is a Swift package manager wrapper for [HighwayHash](https://github.com/google/highwayhash) — a fast, stable, and dos-attack resistent hashing algorithm.

* `HighwayHash` is faster than `SipHash` (which backs Swift's Hashable implementation.)
* `HighwayHash` is stable for a given seed value. Unlike Swift's `Hashable` you can serialize `HighwayHash` output to match values _across sessions_.
* This package bundles the c++ implementation of `HighwayHash` and provides an API for easy use from Swift.
* This package is usable on `arm64` and `x86_64` variants of macOS, iOS, and linux.
* The bundled code, and this package, are apache 2 licensed.
* The underlying library contains an implementation of SipHash. That's exposed here too.

## Usage

`HighwayHash` (and `SipHash`) accept `Data` or `String` input and return a `UInt64` hash.

```swift
    import HighwayHash
    let input = "battle of hastings"
    let output = HighwayHash.of(input)
    XCTAssertEqual(output, UInt64(10_502_827_635_072_092_050))
```

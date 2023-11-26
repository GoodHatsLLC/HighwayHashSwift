# HighwayHashSwift

This package is a Swift package manager wrapper for [HighwayHash](https://github.com/google/highwayhash) — a fast, stable, and dos-attack resistent hashing algorithm.

* `HighwayHash` is faster than `SipHash` (which backs Swift's Hashable implementation.)
* `HighwayHash` is stable for a given seed value. Unlike Swift's `Hashable` you can serialize `HighwayHash` output to match values _across sessions_.
* This package bundles the c++ implementation of `HighwayHash` and provides a simplified API to swift.
  * (No incremental hashing API is currently exposed. Open to code contributions.)
* This package is usable on `arm64` and `x86_64` variants of macOS, iOS, and linux.
* The bundled code, and this package, are Apache 2 licensed.
* The underlying library contains an implementation of SipHash. It is also re-exposed here.

## Usage

`HighwayHash` (and `SipHash`) accept `Data` or `String` input and return a `UInt64` hash.

```swift
    import HighwayHash

    // Choose a seed
    let seed = Seed(a: 1, b: 0, c: 6, d: 6)

    // Instantiate your hasher
    let hasher = HighwayHash(seed: seed)
    
    // Hash your data
    let output = hasher.hash(data: input)

    // Given a stable seed, observe a stable output value
    XCTAssertEqual(output, UInt64(10_502_827_635_072_092_050))

    // Note: the hasher instance is consumed and can't be reused.
    // Reinstantiate with the same seed if desired.

```

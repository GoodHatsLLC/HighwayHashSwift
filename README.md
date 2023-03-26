# HighwayHash

This package is a Swift package manager wrapper around [HighwayHash](https://github.com/google/highwayhash).

HighwayHash is a hashing algorithm which is faster than SipHash (which backs Swift's Hashable implementation.)  
The reference implementation of HighwayHash is written in C++. This package bundles that implementation
in an XCFramework and provides a simple API.

The algorithm is stable and, unlike Swift's native Hashable behavior, this package provides an API with a stable
seed value. i.e. you can serialize the output and rely on it to be constant between sessions.

The wrapped library also contains an implementation of SipHash. That's exposed here too.

## Usage

Both hashers accept `Data` input, and have a convenience wrapper for strings. 

```swift
    import HighwayHash
    let input = "battle of hastings"
    let output = HighwayHash.of(input)
    XCTAssertEqual(output, UInt64(10_502_827_635_072_092_050))
```

## Platforms

The XCFramework contained in this package is built to support iOS, iOS Simulators, and macOS, and macOS Catalyst 
in architecture builds for arm64 and x86_64.
(The project used to generate it is checked in.)


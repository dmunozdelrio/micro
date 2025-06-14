// swift-tools-version:5.6
import PackageDescription

let package = Package(
  name: "MyService",
  platforms: [
    .macOS(.v10_15) // Specify a common macOS version
    // Add other platforms like .iOS(.v13), .watchOS(.v6), .tvOS(.v13) if needed
    // For Linux, SwiftNIO works without specific platform versions here.
  ],
  dependencies: [
    .package(
      url: "https://github.com/apple/swift-nio.git", // Changed to swift-nio
      from: "2.0.0" // Use an appropriate version for swift-nio
    )
  ],
  targets: [
    .executableTarget(
      name: "MyService",
      dependencies: [
        .product(name: "NIO", package: "swift-nio"), // Changed to NIO
        .product(name: "NIOHTTP1", package: "swift-nio") // For HTTP parsing
      ]
    )
  ]
)

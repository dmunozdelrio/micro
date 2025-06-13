// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "swift-notifications",
    platforms: [
        .macOS(.v12)
    ],
    targets: [
        .executableTarget(
            name: "swift-notifications",
            path: "Sources"
        )
    ]
)

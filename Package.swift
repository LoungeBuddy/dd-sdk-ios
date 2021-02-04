// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Datadog",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "Datadog",
            type: .dynamic,
            targets: ["Datadog"]
        ),
        .library(
            name: "DatadogObjc",
            type: .dynamic,
            targets: ["DatadogObjc"]
        ),
        .library(
            name: "DatadogCrashReporting",
            type: .dynamic,
            targets: ["DatadogCrashReporting"]
        ),
    ],
    dependencies: [
        .package(name: "Kronos", url: "https://github.com/lyft/Kronos.git", from: "4.1.0"),
        .package(name: "PLCrashReporter", url: "https://github.com/microsoft/plcrashreporter.git", from: "1.8.1"),
    ],
    targets: [
        .target(
            name: "Datadog",
            dependencies: [
                "_Datadog_Private",
                .product(name: "Kronos", package: "Kronos"),
            ]
        ),
        .target(
            name: "DatadogObjc",
            dependencies: [
                "Datadog",
            ]
        ),
        .target(
            name: "_Datadog_Private"
        ),
        .target(
            name: "DatadogCrashReporting",
            dependencies: [
                "Datadog",
                .product(name: "CrashReporter", package: "PLCrashReporter"),
            ]
        )
    ]
)

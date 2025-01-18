// swift-tools-version:6.0

//
// This source file is part of the Stanford Spezi open-source project
// 
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
// 
// SPDX-License-Identifier: MIT
//

import PackageDescription


let package = Package(
    name: "SpeziHealthKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "SpeziHealthKit", targets: ["SpeziHealthKit"]),
        .library(name: "SpeziHealthKitUI", targets: ["SpeziHealthKitUI"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SpeziHealthKit",
            swiftSettings: [.enableUpcomingFeature("ExistentialAny")]
        ),
        .target(
            name: "SpeziHealthKitUI",
            dependencies: [.target(name: "SpeziHealthKit")],
            swiftSettings: [.enableUpcomingFeature("ExistentialAny")]
        )
    ]
)

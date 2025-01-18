//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2024 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import struct SwiftUI.Color
import SpeziHealthKit


public func hmmmm<each R: _SampleWithSampleType>(_ entry: (repeat Entry<each R>)) -> [(String, Color)] {
    var mapping: [(String, Color)] = []
    func imp(_ entry: Entry<some _SampleWithSampleType>) {
        if !entry.isEmpty {
            mapping.append((entry.sampleType.displayTitle, entry.color))
        }
    }
    repeat imp(each entry)
    return mapping
}

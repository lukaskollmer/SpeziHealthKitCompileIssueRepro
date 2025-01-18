//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2024 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import struct SwiftUI.Color
import SpeziHealthKit


public final class Entry<Sample: _SampleWithSampleType> {
    private enum Variant {
        case regular(HealthKitSampleType<Sample>, Color)
        case empty
    }
    
    private let variant: Variant
    
    private init(variant: Variant) {
        self.variant = variant
    }
    
    var isEmpty: Bool {
        switch variant {
        case .regular: false
        case .empty: true
        }
    }
    
    var sampleType: HealthKitSampleType<Sample> {
        switch variant {
        case .regular(let sampleType, _):
            return sampleType
        case .empty:
            fatalError()
        }
    }
    
    var color: Color {
        switch variant {
        case .regular(_, let color):
            return color
        case .empty:
            fatalError()
        }
    }
}

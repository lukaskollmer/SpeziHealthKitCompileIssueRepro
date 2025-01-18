//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2024 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import Foundation
import class HealthKit.HKUnit


public class SampleType {
    public let identifier: String
    public init(_ identifier: String) {
        self.identifier = identifier
    }
}
public class QuantityType: SampleType {}
public class CorrelationType: SampleType {}


public class Sample {}
public class QuantitySample: Sample {}
public class Correlation: Sample {}



public protocol _SampleWithSampleType: Sample {
    associatedtype _SampleType: SampleType
}

extension QuantitySample: _SampleWithSampleType {
    public typealias _SampleType = QuantityType
}

extension Correlation: _SampleWithSampleType {
    public typealias _SampleType = CorrelationType
}



public struct HealthKitSampleType<Sample: _SampleWithSampleType> {
    private enum Variant: Sendable {
        case quantity(displayUnit: HKUnit, expectedValuesRange: ClosedRange<Double>?)
        case correlation(displayUnit: HKUnit?)
    }
    
    public let underlyingSampleType: Sample._SampleType
    public let displayTitle: String
    private let variant: Variant
    
    private init(_ underlyingSampleType: Sample._SampleType, displayTitle: String, variant: Variant) {
        self.underlyingSampleType = underlyingSampleType
        self.displayTitle = displayTitle
        self.variant = variant
    }
}

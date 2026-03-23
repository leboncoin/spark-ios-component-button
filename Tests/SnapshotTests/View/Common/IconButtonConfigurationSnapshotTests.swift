//
//  IconButtonConfigurationSnapshotTests.swift
//  SparkComponentButtonSnapshotTests
//
//  Created by robin.lemaire on 30/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkCommonSnapshotTesting
import XCTest

struct IconButtonConfigurationSnapshotTests {

    // MARK: - Type Alias

    private typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    let scenario: IconButtonScenarioSnapshotTests

    let intent: ButtonIntent
    let size: ButtonSize
    let variant: ButtonVariant

    let image: ImageEither
    let state: ControlState

    let modes: [ComponentSnapshotTestMode]
    let sizes: [UIContentSizeCategory]

    // MARK: - Initialization

    init(
        scenario: IconButtonScenarioSnapshotTests,
        intent: ButtonIntent = .main,
        size: ButtonSize = .medium,
        variant: ButtonVariant = .filled,
        image: ImageEither,
        state: ControlState = .normal,
        modes: [ComponentSnapshotTestMode] = Constants.Modes.default,
        sizes: [UIContentSizeCategory] = Constants.Sizes.default
    ) {
        self.scenario = scenario
        self.intent = intent
        self.size = size
        self.variant = variant
        self.image = image
        self.state = state
        self.modes = modes
        self.sizes = sizes
    }

    // MARK: - Getter

    func testName() -> String {
        return [
            "\(self.scenario.rawValue)",
            "\(self.intent)",
            "\(self.size)" + "Size",
            "\(self.variant)" + "Variant",
            "\(self.state)" + "State"
        ].joined(separator: "-")
    }
}

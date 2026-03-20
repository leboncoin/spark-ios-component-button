//
//  IconButtonViewSnapshotTestsDeprecated.swift
//  SparkComponentButtonSnapshotTests
//
//  Created by robin.lemaire on 30/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

// MARK: - Deprecated

/// This file is deprecated and should not be used for new tests.

import XCTest
import SnapshotTesting
@testable import SparkComponentButton
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme
import SwiftUI

final class IconButtonViewSnapshotTestsDeprecated: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() throws {
        let scenarios = IconButtonScenarioSnapshotTestsDeprecated.allCases

        for scenario in scenarios {
            let configurations: [IconButtonConfigurationSnapshotTestsDeprecated] = try scenario.configuration(
                isSwiftUIComponent: true
            )

            for configuration in configurations {
                let view = IconButtonView(
                    theme: self.theme,
                    intent: configuration.intent,
                    variant: configuration.variant,
                    size: configuration.size,
                    action: {}
                )
                    .disabled(configuration.state == .disabled)
                    .selected(configuration.state == .selected)
                    .image(configuration.image.rightValue, for: configuration.state)
                    .fixedSize()

                self.assertSnapshot(
                    matching: view,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName()
                )
            }
        }
    }
}

//
//  ButtonGetBorderUseCaseDeprecatedTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 23/06/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkComponentButton
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting

final class ButtonGetBorderUseCaseDeprecatedTests: XCTestCase {

    // MARK: - Properties

    private let borderMock = BorderGeneratedMock.mocked()

    // MARK: - Tests Width from all variants cases

    func test_execute_width_when_variant_is_contrast_case() {
        self.testExecute(
            givenShape: .rounded,
            givenVariant: .contrast,
            expectedWidth: 0,
            expectedRadius: self.borderMock.radius.large
        )
    }

    func test_execute_width_when_variant_is_filled_case() {
        self.testExecute(
            givenShape: .rounded,
            givenVariant: .filled,
            expectedWidth: 0,
            expectedRadius: self.borderMock.radius.large
        )
    }

    func test_execute_width_when_variant_is_ghost_case() {
        self.testExecute(
            givenShape: .rounded,
            givenVariant: .ghost,
            expectedWidth: 0,
            expectedRadius: self.borderMock.radius.large
        )
    }

    func test_execute_width_when_variant_is_outlined_case() {
        self.testExecute(
            givenShape: .rounded,
            givenVariant: .outlined,
            expectedWidth: self.borderMock.width.small,
            expectedRadius: self.borderMock.radius.large
        )
    }

    func test_execute_width_when_variant_is_tinted_case() {
        self.testExecute(
            givenShape: .rounded,
            givenVariant: .tinted,
            expectedWidth: 0,
            expectedRadius: self.borderMock.radius.large
        )
    }

    // MARK: - Tests Shape cases

    func test_execute_radius_when_shape_is_square_case() {
        self.testExecute(
            givenShape: .square,
            givenVariant: .filled,
            expectedWidth: 0,
            expectedRadius: 0
        )
    }

    func test_execute_radius_when_shape_is_rounded_case() {
        self.testExecute(
            givenShape: .rounded,
            givenVariant: .filled,
            expectedWidth: 0,
            expectedRadius: self.borderMock.radius.large
        )
    }

    func test_execute_radius_when_shape_is_pill_case() {
        self.testExecute(
            givenShape: .pill,
            givenVariant: .filled,
            expectedWidth: 0,
            expectedRadius: self.borderMock.radius.full
        )
    }

    // MARK: - Tests RemoveShapeFeatureToggle

    func test_execute_radius_when_rebrandingFeatureToggle_is_true_with_square_shape() {
        self.testExecute(
            givenShape: .square,
            givenVariant: .filled,
            givenRebrandingFeatureToggle: true,
            expectedWidth: 0,
            expectedRadius: self.borderMock.radius.full
        )
    }

    func test_execute_radius_when_rebrandingFeatureToggle_is_true_with_rounded_shape() {
        self.testExecute(
            givenShape: .rounded,
            givenVariant: .filled,
            givenRebrandingFeatureToggle: true,
            expectedWidth: 0,
            expectedRadius: self.borderMock.radius.full
        )
    }

    func test_execute_radius_when_rebrandingFeatureToggle_is_true_with_pill_shape() {
        self.testExecute(
            givenShape: .pill,
            givenVariant: .filled,
            givenRebrandingFeatureToggle: true,
            expectedWidth: 0,
            expectedRadius: self.borderMock.radius.full
        )
    }

    func test_execute_radius_when_rebrandingFeatureToggle_is_false_respects_all_shapes() {
        // GIVEN
        let useCase = ButtonGetBorderUseCaseDeprecated()

        // WHEN
        let borderSquare = useCase.execute(
            border: self.borderMock,
            shape: .square,
            variant: .filled
        )

        let borderRounded = useCase.execute(
            border: self.borderMock,
            shape: .rounded,
            variant: .filled
        )

        let borderPill = useCase.execute(
            border: self.borderMock,
            shape: .pill,
            variant: .filled
        )

        // THEN
        XCTAssertEqual(borderSquare.radius, 0, "Wrong radius for square shape")
        XCTAssertEqual(borderRounded.radius, self.borderMock.radius.large, "Wrong radius for rounded shape")
        XCTAssertEqual(borderPill.radius, self.borderMock.radius.full, "Wrong radius for pill shape")
    }

    // MARK: - Tests Combined scenarios

    func test_execute_with_outlined_variant_and_rounded_shape() {
        self.testExecute(
            givenShape: .rounded,
            givenVariant: .outlined,
            expectedWidth: self.borderMock.width.small,
            expectedRadius: self.borderMock.radius.large
        )
    }

    func test_execute_with_outlined_variant_and_square_shape() {
        self.testExecute(
            givenShape: .square,
            givenVariant: .outlined,
            expectedWidth: self.borderMock.width.small,
            expectedRadius: 0
        )
    }

    func test_execute_with_outlined_variant_pill_shape_and_rebrandingFeatureToggle_true() {
        self.testExecute(
            givenShape: .pill,
            givenVariant: .outlined,
            expectedWidth: self.borderMock.width.small,
            expectedRadius: self.borderMock.radius.full
        )
    }
}

// MARK: - Execute Testing

private extension ButtonGetBorderUseCaseDeprecatedTests {

    func testExecute(
        givenShape: ButtonShape,
        givenVariant: ButtonVariant,
        givenRebrandingFeatureToggle: Bool = false,
        expectedWidth: CGFloat,
        expectedRadius: CGFloat
    ) {
        // GIVEN
        let errorSuffixMessage = " for .\(givenShape) shape, .\(givenVariant) variant"

        let featureToggleService = SparkFeatureToggleServicingGeneratedMock()
        featureToggleService.rebranding = givenRebrandingFeatureToggle

        let useCase = ButtonGetBorderUseCaseDeprecated(
            featureTogglesService: featureToggleService
        )

        // WHEN
        let border = useCase.execute(
            border: self.borderMock,
            shape: givenShape,
            variant: givenVariant
        )

        // THEN
        XCTAssertEqual(border.width,
                       expectedWidth,
                       "Wrong width" + errorSuffixMessage)

        XCTAssertEqual(border.radius,
                       expectedRadius,
                       "Wrong radius" + errorSuffixMessage)
    }
}

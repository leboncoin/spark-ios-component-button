//
//  ButtonGetBorderUseCaseTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 23/06/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkComponentButton
@_spi(SI_SPI) import SparkThemingTesting

final class ButtonGetBorderUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let borderMock = BorderGeneratedMock.mocked()

    // MARK: - Tests Width drom all variants cases

    func test_execute_width_when_variant_is_contrast_case() {
        self.testExecute(
            givenVariant: .contrast,
            expectedWidth: 0
        )
    }

    func test_execute_width_when_variant_is_filled_case() {
        self.testExecute(
            givenVariant: .filled,
            expectedWidth: 0
        )
    }

    func test_execute_width_when_variant_is_ghost_case() {
        self.testExecute(
            givenVariant: .ghost,
            expectedWidth: 0
        )
    }

    func test_execute_width_when_variant_is_outlined_case() {
        self.testExecute(
            givenVariant: .outlined,
            expectedWidth: self.borderMock.width.small
        )
    }

    func test_execute_width_when_variant_is_tinted_case() {
        self.testExecute(
            givenVariant: .tinted,
            expectedWidth: 0
        )
    }
}

// MARK: - Execute Testing

private extension ButtonGetBorderUseCaseTests {

    func testExecute(
        givenVariant: ButtonVariant,
        expectedWidth: CGFloat
    ) {
        // GIVEN
        let errorSuffixMessage = " for .\(givenVariant) variant case"

        let useCase = ButtonGetBorderUseCase()

        // WHEN
        let border = useCase.execute(
            border: self.borderMock,
            variant: givenVariant
        )

        // THEN
        XCTAssertEqual(border.width,
                       expectedWidth,
                       "Wrong width" + errorSuffixMessage)

        XCTAssertEqual(border.radius,
                       self.borderMock.radius.full,
                       "Wrong radius" + errorSuffixMessage)
    }
}

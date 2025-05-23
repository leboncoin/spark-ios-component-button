//
//  ButtonSUIViewModelTests.swift
//  SparkButtonUnitTests
//
//  Created by robin.lemaire on 15/01/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkButton
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkCommon

final class ButtonSUIViewModelTests: XCTestCase {

    // MARK: - Init Tests

    func test_default_properties_on_init() {
        // GIVEN / WHEN
        let viewModel = ButtonSUIViewModel(
            theme: ThemeGeneratedMock.mocked(),
            intent: .main,
            variant: .filled,
            size: .medium,
            shape: .rounded,
            alignment: .leadingImage
        )

        // THEN
        XCTAssertEqual(
            viewModel.controlStatus,
            .init(),
            "Wrong constrol status"
        )
        XCTAssertNotNil(
            viewModel.controlStateImage,
            "Wrong constrol state text"
        )
        XCTAssertNotNil(
            viewModel.controlStateText,
            "Wrong constrol state text"
        )
        XCTAssertNil(
            viewModel.maxWidth,
            "Wrong max Width"
        )
        XCTAssertEqual(
            viewModel.frameAlignment,
            .center,
            "Wrong frame alignment"
        )
    }
}

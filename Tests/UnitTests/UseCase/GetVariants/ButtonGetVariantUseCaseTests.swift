//
//  ButtonVariantUseCaseTests.swift
//  SparkButton
//
//  Created by janniklas.freundt.ext on 16.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkButton
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming

/// Base class for variant tests.
class ButtonVariantUseCaseTests: XCTestCase {

    // MARK: - Properties
    var theme: ThemeGeneratedMock!

    // MARK: - Setup
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.theme = ThemeGeneratedMock.mock
    }
}

// MARK: - Helper Extensions
private extension Theme where Self == ThemeGeneratedMock {
    static var mock: Self {
        let theme = ThemeGeneratedMock()
        theme.colors = .mock
        theme.dims = DimsGeneratedMock.mocked()
        return theme
    }
}

private extension Colors where Self == ColorsGeneratedMock {
    static var mock: Self {
        let colors = ColorsGeneratedMock()
        colors.base = ColorsBaseGeneratedMock.mocked()
        colors.main = ColorsMainGeneratedMock.mocked()
        colors.support = ColorsSupportGeneratedMock.mocked()
        colors.feedback = ColorsFeedbackGeneratedMock.mocked()
        colors.states = ColorsStatesGeneratedMock.mocked()

        return colors
    }
}

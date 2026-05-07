//
//  ButtonColorsTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 11/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentButton
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Button Colors Tests")
struct ButtonColorsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let colors = ButtonColors()

        // THEN
        #expect(colors.tintColor.equals(ColorTokenClear()))
        #expect(colors.backgroundColor.equals(ColorTokenClear()))
        #expect(colors.borderColor.equals(ColorTokenClear()))
    }

    @Test("Equality when same colors")
    func equalityWhenSameColors() {
        // GIVEN / WHEN
        let tintColor = ColorTokenGeneratedMock.random()
        let backgroundColor = ColorTokenGeneratedMock.random()
        let borderColor = ColorTokenGeneratedMock.random()

        let colors1 = ButtonColors(
            tintColor: tintColor,
            backgroundColor: backgroundColor,
            borderColor: borderColor
        )

        let colors2 = ButtonColors(
            tintColor: tintColor,
            backgroundColor: backgroundColor,
            borderColor: borderColor
        )

        // THEN
        #expect(colors1 == colors2)
    }

    @Test("Inequality when different tint color")
    func inequalityWhenDifferentTintColor() {
        // GIVEN / WHEN
        let tintColor1 = ColorTokenGeneratedMock.random()
        let tintColor2 = ColorTokenGeneratedMock.random()
        let backgroundColor = ColorTokenGeneratedMock.random()
        let borderColor = ColorTokenGeneratedMock.random()

        let colors1 = ButtonColors(
            tintColor: tintColor1,
            backgroundColor: backgroundColor,
            borderColor: borderColor
        )

        let colors2 = ButtonColors(
            tintColor: tintColor2,
            backgroundColor: backgroundColor,
            borderColor: borderColor
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different background color")
    func inequalityWhenDifferentBackgroundColor() {
        // GIVEN / WHEN
        let tintColor = ColorTokenGeneratedMock.random()
        let backgroundColor1 = ColorTokenGeneratedMock.random()
        let backgroundColor2 = ColorTokenGeneratedMock.random()
        let borderColor = ColorTokenGeneratedMock.random()

        let colors1 = ButtonColors(
            tintColor: tintColor,
            backgroundColor: backgroundColor1,
            borderColor: borderColor
        )

        let colors2 = ButtonColors(
            tintColor: tintColor,
            backgroundColor: backgroundColor2,
            borderColor: borderColor
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Inequality when different border color")
    func inequalityWhenDifferentBorderColor() {
        // GIVEN / WHEN
        let tintColor = ColorTokenGeneratedMock.random()
        let backgroundColor = ColorTokenGeneratedMock.random()
        let borderColor1 = ColorTokenGeneratedMock.random()
        let borderColor2 = ColorTokenGeneratedMock.random()

        let colors1 = ButtonColors(
            tintColor: tintColor,
            backgroundColor: backgroundColor,
            borderColor: borderColor1
        )

        let colors2 = ButtonColors(
            tintColor: tintColor,
            backgroundColor: backgroundColor,
            borderColor: borderColor2
        )

        // THEN
        #expect(colors1 != colors2)
    }

    @Test("Hash consistency")
    func hashConsistency() {
        // GIVEN / WHEN
        let tintColor = ColorTokenGeneratedMock.random()
        let backgroundColor = ColorTokenGeneratedMock.random()
        let borderColor = ColorTokenGeneratedMock.random()

        let colors1 = ButtonColors(
            tintColor: tintColor,
            backgroundColor: backgroundColor,
            borderColor: borderColor
        )

        let colors2 = ButtonColors(
            tintColor: tintColor,
            backgroundColor: backgroundColor,
            borderColor: borderColor
        )

        // THEN
        #expect(colors1.hashValue == colors2.hashValue)
    }
}

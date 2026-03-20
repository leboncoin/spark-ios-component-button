//
//  ButtonGetColorsUseCaseTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 11/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
@_spi(SI_SPI)  import SparkComponentButtonTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import XCTest

final class ButtonGetColorsUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var sut: ButtonGetColorsUseCase!

    private var theme: ThemeGeneratedMock!

    private var getContrastUseCase: ButtonGetVariantUseCaseableGeneratedMock!
    private var getFilledUseCase: ButtonGetVariantUseCaseableGeneratedMock!
    private var getGhostUseCase: ButtonGetVariantUseCaseableGeneratedMock!
    private var getOutlinedUseCase: ButtonGetVariantUseCaseableGeneratedMock!
    private var getTintedUseCase: ButtonGetVariantUseCaseableGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.theme = .mocked()

        self.getContrastUseCase = .init()
        self.getFilledUseCase = .init()
        self.getGhostUseCase = .init()
        self.getOutlinedUseCase = .init()
        self.getTintedUseCase = .init()

        self.sut = ButtonGetColorsUseCase(
            getContrastUseCase: self.getContrastUseCase,
            getFilledUseCase: self.getFilledUseCase,
            getGhostUseCase: self.getGhostUseCase,
            getOutlinedUseCase: self.getOutlinedUseCase,
            getTintedUseCase: self.getTintedUseCase
        )
    }

    // MARK: - Tests

    func test_filledVariant_isPressedFalse() {
        // GIVEN
        let expectedColors = ButtonColors(
            tintColor: self.theme.colors.main.onMain,
            backgroundColor: self.theme.colors.main.main,
            borderColor: ColorTokenDefault.clear
        )
        self.getFilledUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = expectedColors

        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            intent: .main,
            variant: .filled,
            isPressed: false
        )

        // THEN
        XCTAssertEqual(colors, expectedColors)
        XCTAssertEqual(self.getFilledUseCase.executeWithThemeAndIntentAndIsPressedCallsCount, 1)
        XCTAssertEqual(self.getContrastUseCase.executeWithThemeAndIntentAndIsPressedCallsCount, 0)
        XCTAssertEqual(self.getGhostUseCase.executeWithThemeAndIntentAndIsPressedCallsCount, 0)
        XCTAssertEqual(self.getOutlinedUseCase.executeWithThemeAndIntentAndIsPressedCallsCount, 0)
        XCTAssertEqual(self.getTintedUseCase.executeWithThemeAndIntentAndIsPressedCallsCount, 0)
    }

    func test_filledVariant_isPressedTrue() {
        // GIVEN
        let expectedColors = ButtonColors(
            tintColor: self.theme.colors.main.onMain,
            backgroundColor: self.theme.colors.states.mainPressed,
            borderColor: ColorTokenDefault.clear
        )
        self.getFilledUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = expectedColors

        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            intent: .main,
            variant: .filled,
            isPressed: true
        )

        // THEN
        XCTAssertEqual(colors, expectedColors)
        XCTAssertEqual(self.getFilledUseCase.executeWithThemeAndIntentAndIsPressedCallsCount, 1)
    }

    func test_contrastVariant() {
        // GIVEN
        let expectedColors = ButtonColors(
            tintColor: self.theme.colors.accent.onAccentContainer,
            backgroundColor: self.theme.colors.base.surface,
            borderColor: ColorTokenDefault.clear
        )
        self.getContrastUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = expectedColors

        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            intent: .accent,
            variant: .contrast,
            isPressed: false
        )

        // THEN
        XCTAssertEqual(colors, expectedColors)
        XCTAssertEqual(self.getContrastUseCase.executeWithThemeAndIntentAndIsPressedCallsCount, 1)
        XCTAssertEqual(self.getFilledUseCase.executeWithThemeAndIntentAndIsPressedCallsCount, 0)
    }

    func test_ghostVariant() {
        // GIVEN
        let expectedColors = ButtonColors(
            tintColor: self.theme.colors.accent.onAccentContainer,
            backgroundColor: ColorTokenDefault.clear,
            borderColor: ColorTokenDefault.clear
        )
        self.getGhostUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = expectedColors

        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            intent: .accent,
            variant: .ghost,
            isPressed: false
        )

        // THEN
        XCTAssertEqual(colors, expectedColors)
        XCTAssertEqual(self.getGhostUseCase.executeWithThemeAndIntentAndIsPressedCallsCount, 1)
        XCTAssertEqual(self.getFilledUseCase.executeWithThemeAndIntentAndIsPressedCallsCount, 0)
    }

    func test_outlinedVariant() {
        // GIVEN
        let expectedColors = ButtonColors(
            tintColor: self.theme.colors.accent.accent,
            backgroundColor: ColorTokenDefault.clear,
            borderColor: self.theme.colors.accent.accent
        )
        self.getOutlinedUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = expectedColors

        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            intent: .accent,
            variant: .outlined,
            isPressed: false
        )

        // THEN
        XCTAssertEqual(colors, expectedColors)
        XCTAssertEqual(self.getOutlinedUseCase.executeWithThemeAndIntentAndIsPressedCallsCount, 1)
        XCTAssertEqual(self.getFilledUseCase.executeWithThemeAndIntentAndIsPressedCallsCount, 0)
    }

    func test_tintedVariant() {
        // GIVEN
        let expectedColors = ButtonColors(
            tintColor: self.theme.colors.accent.onAccentContainer,
            backgroundColor: self.theme.colors.accent.accentContainer,
            borderColor: ColorTokenDefault.clear
        )
        self.getTintedUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = expectedColors

        // WHEN
        let colors = self.sut.execute(
            theme: self.theme,
            intent: .accent,
            variant: .tinted,
            isPressed: false
        )

        // THEN
        XCTAssertEqual(colors, expectedColors)
        XCTAssertEqual(self.getTintedUseCase.executeWithThemeAndIntentAndIsPressedCallsCount, 1)
        XCTAssertEqual(self.getFilledUseCase.executeWithThemeAndIntentAndIsPressedCallsCount, 0)
    }
}

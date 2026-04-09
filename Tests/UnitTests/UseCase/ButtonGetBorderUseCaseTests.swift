//
//  ButtonGetBorderUseCaseTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 11/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Button Get Border Use Case Tests")
struct ButtonGetBorderUseCaseTests {

    // MARK: - Properties

    let sut: ButtonGetBorderUseCase

    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = ButtonGetBorderUseCase()
    }

    // MARK: - Tests

    @Test("Variant contrast with styles")
    func variantContrastWithStyles() throws {
        // GIVEN / WHEN
        let border = self.sut.execute(
            theme: self.theme,
            variant: .contrast,
            removeStyles: false
        )

        // THEN
        let expectedBorder = ButtonBorder(
            width: 0,
            radius: self.theme.border.radius.full
        )

        #expect(border == expectedBorder)
    }

    @Test("Variant filled with styles")
    func variantFilledWithStyles() throws {
        // GIVEN / WHEN
        let border = self.sut.execute(
            theme: self.theme,
            variant: .filled,
            removeStyles: false
        )

        // THEN
        let expectedBorder = ButtonBorder(
            width: 0,
            radius: self.theme.border.radius.full
        )

        #expect(border == expectedBorder)
    }

    @Test("Variant ghost with styles")
    func variantGhostWithStyles() throws {
        // GIVEN / WHEN
        let border = self.sut.execute(
            theme: self.theme,
            variant: .ghost,
            removeStyles: false
        )

        // THEN
        let expectedBorder = ButtonBorder(
            width: 0,
            radius: self.theme.border.radius.full
        )

        #expect(border == expectedBorder)
    }

    @Test("Variant outlined with styles")
    func variantOutlinedWithStyles() throws {
        // GIVEN / WHEN
        let border = self.sut.execute(
            theme: self.theme,
            variant: .outlined,
            removeStyles: false
        )

        // THEN
        let expectedBorder = ButtonBorder(
            width: self.theme.border.width.small,
            radius: self.theme.border.radius.full
        )

        #expect(border == expectedBorder)
    }

    @Test("Variant tinted with styles")
    func variantTintedWithStyles() throws {
        // GIVEN / WHEN
        let border = self.sut.execute(
            theme: self.theme,
            variant: .tinted,
            removeStyles: false
        )

        // THEN
        let expectedBorder = ButtonBorder(
            width: 0,
            radius: self.theme.border.radius.full
        )

        #expect(border == expectedBorder)
    }

    @Test("Remove styles returns empty border")
    func removeStylesReturnsEmptyBorder() throws {
        // GIVEN / WHEN
        let border = self.sut.execute(
            theme: self.theme,
            variant: .outlined,
            removeStyles: true
        )

        // THEN
        let expectedBorder = ButtonBorder()

        #expect(border == expectedBorder)
    }

    @Test("Remove styles ignores variant")
    func removeStylesIgnoresVariant() throws {
        // GIVEN / WHEN
        let borderOutlined = self.sut.execute(
            theme: self.theme,
            variant: .outlined,
            removeStyles: true
        )

        let borderFilled = self.sut.execute(
            theme: self.theme,
            variant: .filled,
            removeStyles: true
        )

        // THEN
        #expect(borderOutlined == borderFilled)
        #expect(borderOutlined.width == 0)
        #expect(borderOutlined.radius == 0)
    }
}

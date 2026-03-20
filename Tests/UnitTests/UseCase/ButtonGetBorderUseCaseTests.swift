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

    @Test("Variant contrast")
    func variantContrast() throws {
        // GIVEN / WHEN
        let border = self.sut.execute(
            theme: self.theme,
            variant: .contrast
        )

        // THEN
        let expectedBorder = ButtonBorder(
            width: 0,
            radius: self.theme.border.radius.full
        )

        #expect(border == expectedBorder)
    }

    @Test("Variant filled")
    func variantFilled() throws {
        // GIVEN / WHEN
        let border = self.sut.execute(
            theme: self.theme,
            variant: .filled
        )

        // THEN
        let expectedBorder = ButtonBorder(
            width: 0,
            radius: self.theme.border.radius.full
        )

        #expect(border == expectedBorder)
    }

    @Test("Variant ghost")
    func variantGhost() throws {
        // GIVEN / WHEN
        let border = self.sut.execute(
            theme: self.theme,
            variant: .ghost
        )

        // THEN
        let expectedBorder = ButtonBorder(
            width: 0,
            radius: self.theme.border.radius.full
        )

        #expect(border == expectedBorder)
    }

    @Test("Variant outlined")
    func variantOutlined() throws {
        // GIVEN / WHEN
        let border = self.sut.execute(
            theme: self.theme,
            variant: .outlined
        )

        // THEN
        let expectedBorder = ButtonBorder(
            width: self.theme.border.width.small,
            radius: self.theme.border.radius.full
        )

        #expect(border == expectedBorder)
    }

    @Test("Variant tinted")
    func variantTinted() throws {
        // GIVEN / WHEN
        let border = self.sut.execute(
            theme: self.theme,
            variant: .tinted
        )

        // THEN
        let expectedBorder = ButtonBorder(
            width: 0,
            radius: self.theme.border.radius.full
        )

        #expect(border == expectedBorder)
    }
}

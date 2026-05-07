//
//  ButtonGetBorderUseCaseTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 11/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Button Get Border Use Case Tests")
struct ButtonGetBorderUseCaseTests {

    // MARK: - Properties

    let sut: ButtonGetBorderUseCase
    let featureToggleService: SparkFeatureToggleServicingGeneratedMock

    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.featureToggleService = SparkFeatureToggleServicingGeneratedMock()
        self.sut = ButtonGetBorderUseCase(featureTogglesService: self.featureToggleService)
    }

    // MARK: - Tests

    @Test("Variant contrast with styles and pill shape")
    func variantContrastWithStylesAndPillShape() throws {
        // GIVEN / WHEN
        self.featureToggleService.rebranding = false

        let border = self.sut.execute(
            theme: self.theme,
            shape: .pill,
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

    @Test("Variant filled with styles and pill shape")
    func variantFilledWithStylesAndPillShape() throws {
        // GIVEN / WHEN
        self.featureToggleService.rebranding = false

        let border = self.sut.execute(
            theme: self.theme,
            shape: .pill,
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

    @Test("Variant ghost with styles and pill shape")
    func variantGhostWithStylesAndPillShape() throws {
        // GIVEN / WHEN
        self.featureToggleService.rebranding = false

        let border = self.sut.execute(
            theme: self.theme,
            shape: .pill,
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

    @Test("Variant outlined with styles and pill shape")
    func variantOutlinedWithStylesAndPillShape() throws {
        // GIVEN / WHEN
        self.featureToggleService.rebranding = false

        let border = self.sut.execute(
            theme: self.theme,
            shape: .pill,
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

    @Test("Variant tinted with styles and pill shape")
    func variantTintedWithStylesAndPillShape() throws {
        // GIVEN / WHEN
        self.featureToggleService.rebranding = false

        let border = self.sut.execute(
            theme: self.theme,
            shape: .pill,
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
        self.featureToggleService.rebranding = false

        let border = self.sut.execute(
            theme: self.theme,
            shape: .pill,
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
        self.featureToggleService.rebranding = false

        let borderOutlined = self.sut.execute(
            theme: self.theme,
            shape: .pill,
            variant: .outlined,
            removeStyles: true
        )

        let borderFilled = self.sut.execute(
            theme: self.theme,
            shape: .pill,
            variant: .filled,
            removeStyles: true
        )

        // THEN
        #expect(borderOutlined == borderFilled)
        #expect(borderOutlined.width == 0)
        #expect(borderOutlined.radius == 0)
    }

    // MARK: - Shape Tests

    @Test("Shape square returns zero radius")
    func shapeSquareReturnsZeroRadius() throws {
        // GIVEN / WHEN
        self.featureToggleService.rebranding = false

        let border = self.sut.execute(
            theme: self.theme,
            shape: .square,
            variant: .filled,
            removeStyles: false
        )

        // THEN
        #expect(border.radius == 0)
        #expect(border.width == 0)
    }

    @Test("Shape rounded returns large radius")
    func shapeRoundedReturnsLargeRadius() throws {
        // GIVEN / WHEN
        self.featureToggleService.rebranding = false

        let border = self.sut.execute(
            theme: self.theme,
            shape: .rounded,
            variant: .filled,
            removeStyles: false
        )

        // THEN
        #expect(border.radius == self.theme.border.radius.large)
        #expect(border.width == 0)
    }

    @Test("Shape pill returns full radius")
    func shapePillReturnsFullRadius() throws {
        // GIVEN / WHEN
        self.featureToggleService.rebranding = false

        let border = self.sut.execute(
            theme: self.theme,
            shape: .pill,
            variant: .filled,
            removeStyles: false
        )

        // THEN
        #expect(border.radius == self.theme.border.radius.full)
        #expect(border.width == 0)
    }

    // MARK: - RemoveShapeFeatureToggle Tests

    @Test("RemoveShapeFeatureToggle true with square shape returns full radius")
    func removeShapeFeatureToggleTrueWithSquareShapeReturnsFullRadius() throws {
        // GIVEN / WHEN
        self.featureToggleService.rebranding = true

        let border = self.sut.execute(
            theme: self.theme,
            shape: .square,
            variant: .filled,
            removeStyles: false
        )

        // THEN
        #expect(border.radius == self.theme.border.radius.full)
        #expect(border.width == 0)
    }

    @Test("RemoveShapeFeatureToggle true with rounded shape returns full radius")
    func removeShapeFeatureToggleTrueWithRoundedShapeReturnsFullRadius() throws {
        // GIVEN / WHEN
        self.featureToggleService.rebranding = true

        let border = self.sut.execute(
            theme: self.theme,
            shape: .rounded,
            variant: .filled,
            removeStyles: false
        )

        // THEN
        #expect(border.radius == self.theme.border.radius.full)
        #expect(border.width == 0)
    }

    @Test("RemoveShapeFeatureToggle true with pill shape returns full radius")
    func removeShapeFeatureToggleTrueWithPillShapeReturnsFullRadius() throws {
        // GIVEN / WHEN
        self.featureToggleService.rebranding = true

        let border = self.sut.execute(
            theme: self.theme,
            shape: .pill,
            variant: .filled,
            removeStyles: false
        )

        // THEN
        #expect(border.radius == self.theme.border.radius.full)
        #expect(border.width == 0)
    }

    @Test("RemoveShapeFeatureToggle false respects shape parameter")
    func removeShapeFeatureToggleFalseRespectsShapeParameter() throws {
        // GIVEN / WHEN
        self.featureToggleService.rebranding = false

        let borderSquare = self.sut.execute(
            theme: self.theme,
            shape: .square,
            variant: .filled,
            removeStyles: false
        )

        let borderRounded = self.sut.execute(
            theme: self.theme,
            shape: .rounded,
            variant: .filled,
            removeStyles: false
        )

        let borderPill = self.sut.execute(
            theme: self.theme,
            shape: .pill,
            variant: .filled,
            removeStyles: false
        )

        // THEN
        #expect(borderSquare.radius == 0)
        #expect(borderRounded.radius == self.theme.border.radius.large)
        #expect(borderPill.radius == self.theme.border.radius.full)
    }

    // MARK: - Combined Tests

    @Test("Outlined variant with rounded shape and feature toggle false")
    func outlinedVariantWithRoundedShapeAndFeatureToggleFalse() throws {
        // GIVEN / WHEN
        self.featureToggleService.rebranding = false

        let border = self.sut.execute(
            theme: self.theme,
            shape: .rounded,
            variant: .outlined,
            removeStyles: false
        )

        // THEN
        #expect(border.radius == self.theme.border.radius.large)
        #expect(border.width == self.theme.border.width.small)
    }

    @Test("Outlined variant with square shape and feature toggle false")
    func outlinedVariantWithSquareShapeAndFeatureToggleFalse() throws {
        // GIVEN / WHEN
        self.featureToggleService.rebranding = false

        let border = self.sut.execute(
            theme: self.theme,
            shape: .square,
            variant: .outlined,
            removeStyles: false
        )

        // THEN
        #expect(border.radius == 0)
        #expect(border.width == self.theme.border.width.small)
    }

    @Test("Outlined variant with pill shape and feature toggle true")
    func outlinedVariantWithPillShapeAndFeatureToggleTrue() throws {
        // GIVEN / WHEN
        self.featureToggleService.rebranding = false

        let border = self.sut.execute(
            theme: self.theme,
            shape: .pill,
            variant: .outlined,
            removeStyles: false
        )

        // THEN
        #expect(border.radius == self.theme.border.radius.full)
        #expect(border.width == self.theme.border.width.small)
    }
}

//
//  ButtonGetSizesUseCaseTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 11/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Button Get Sizes Use Case Tests")
struct ButtonGetSizesUseCaseTests {

    // MARK: - Properties

    let sut: ButtonGetSizesUseCase

    // MARK: - Initialization

    init() {
        self.sut = ButtonGetSizesUseCase()
    }

    // MARK: - Tests

    @Test("Size small type button with showAll not loading")
    func sizeSmallTypeButtonShowAllNotLoading() throws {
        // GIVEN / WHEN
        let sizes = self.sut.execute(
            size: .small,
            type: .button,
            contentVisibility: .showAll,
            isLoading: false
        )

        let expectedSizes = ButtonSizes(height: 32, isFixedWidth: false, imageSize: 16)

        // THEN
        #expect(sizes == expectedSizes)
    }

    @Test("Size small type iconButton with showAll not loading")
    func sizeSmallTypeIconButtonShowAllNotLoading() throws {
        // GIVEN / WHEN
        let sizes = self.sut.execute(
            size: .small,
            type: .iconButton,
            contentVisibility: .showAll,
            isLoading: false
        )

        let expectedSizes = ButtonSizes(height: 32, isFixedWidth: true, imageSize: 16)

        // THEN
        #expect(sizes == expectedSizes)
    }

    @Test("Size medium type button with showAll not loading")
    func sizeMediumTypeButtonShowAllNotLoading() throws {
        // GIVEN / WHEN
        let sizes = self.sut.execute(
            size: .medium,
            type: .button,
            contentVisibility: .showAll,
            isLoading: false
        )

        let expectedSizes = ButtonSizes(height: 44, isFixedWidth: false, imageSize: 16)

        // THEN
        #expect(sizes == expectedSizes)
    }

    @Test("Size medium type iconButton with showAll not loading")
    func sizeMediumTypeIconButtonShowAllNotLoading() throws {
        // GIVEN / WHEN
        let sizes = self.sut.execute(
            size: .medium,
            type: .iconButton,
            contentVisibility: .showAll,
            isLoading: false
        )

        let expectedSizes = ButtonSizes(height: 44, isFixedWidth: true, imageSize: 16)

        // THEN
        #expect(sizes == expectedSizes)
    }

    @Test("Size large type button with showAll not loading")
    func sizeLargeTypeButtonShowAllNotLoading() throws {
        // GIVEN / WHEN
        let sizes = self.sut.execute(
            size: .large,
            type: .button,
            contentVisibility: .showAll,
            isLoading: false
        )

        let expectedSizes = ButtonSizes(height: 56, isFixedWidth: false, imageSize: 16)

        // THEN
        #expect(sizes == expectedSizes)
    }

    @Test("Size large type iconButton with showAll not loading")
    func sizeLargeTypeIconButtonShowAllNotLoading() throws {
        // GIVEN / WHEN
        let sizes = self.sut.execute(
            size: .large,
            type: .iconButton,
            contentVisibility: .showAll,
            isLoading: false
        )

        let expectedSizes = ButtonSizes(height: 56, isFixedWidth: true, imageSize: 24)

        // THEN
        #expect(sizes == expectedSizes)
    }

    @Test("Type button with hideLabel not loading has fixed width")
    func typeButtonHideLabelNotLoadingHasFixedWidth() throws {
        // GIVEN / WHEN
        let sizes = self.sut.execute(
            size: .medium,
            type: .button,
            contentVisibility: .hideLabel,
            isLoading: false
        )

        // THEN
        #expect(sizes.isFixedWidth == true)
    }

    @Test("Type button with hideLabel loading does not have fixed width")
    func typeButtonHideLabelLoadingDoesNotHaveFixedWidth() throws {
        // GIVEN / WHEN
        let sizes = self.sut.execute(
            size: .medium,
            type: .button,
            contentVisibility: .hideLabel,
            isLoading: true
        )

        // THEN
        #expect(sizes.isFixedWidth == false)
    }

    @Test("Type button with hideImage does not have fixed width")
    func typeButtonHideImageDoesNotHaveFixedWidth() throws {
        // GIVEN / WHEN
        let sizes = self.sut.execute(
            size: .medium,
            type: .button,
            contentVisibility: .hideImage,
            isLoading: false
        )

        // THEN
        #expect(sizes.isFixedWidth == false)
    }

    @Test("Type iconButton always has fixed width regardless of loading")
    func typeIconButtonAlwaysHasFixedWidth() throws {
        // GIVEN
        let contentVisibilities: [ButtonContentVisibility] = [.showAll, .hideLabel, .hideImage]
        let loadingStates: [Bool] = [true, false]

        for contentVisibility in contentVisibilities {
            for isLoading in loadingStates {
                // WHEN
                let sizes = self.sut.execute(
                    size: .medium,
                    type: .iconButton,
                    contentVisibility: contentVisibility,
                    isLoading: isLoading
                )

                // THEN
                #expect(sizes.isFixedWidth == true)
            }
        }
    }

    @Test("Type button with showAll loading does not have fixed width")
    func typeButtonShowAllLoadingDoesNotHaveFixedWidth() throws {
        // GIVEN / WHEN
        let sizes = self.sut.execute(
            size: .medium,
            type: .button,
            contentVisibility: .showAll,
            isLoading: true
        )

        // THEN
        #expect(sizes.isFixedWidth == false)
    }
}

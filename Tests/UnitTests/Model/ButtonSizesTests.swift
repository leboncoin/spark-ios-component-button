//
//  ButtonSizesTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 10/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentButton

@Suite("Button Sizes Tests")
struct ButtonSizesTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let sizes = ButtonSizes()

        // THEN
        #expect(sizes.height == .zero)
        #expect(sizes.isFixedWidth == false)
        #expect(sizes.imageSize == .zero)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN / WHEN
        let sizes1 = ButtonSizes(height: 44, isFixedWidth: false, imageSize: 16)
        let sizes2 = ButtonSizes(height: 44, isFixedWidth: false, imageSize: 16)

        // THEN
        #expect(sizes1 == sizes2)
    }

    @Test("Inequality when different height")
    func inequalityWhenDifferentHeight() {
        // GIVEN / WHEN
        let sizes1 = ButtonSizes(height: 44, isFixedWidth: false, imageSize: 16)
        let sizes2 = ButtonSizes(height: 56, isFixedWidth: false, imageSize: 16)

        // THEN
        #expect(sizes1 != sizes2)
    }

    @Test("Inequality when different fixed width")
    func inequalityWhenDifferentFixedWidth() {
        // GIVEN / WHEN
        let sizes1 = ButtonSizes(height: 44, isFixedWidth: false, imageSize: 16)
        let sizes2 = ButtonSizes(height: 44, isFixedWidth: true, imageSize: 16)

        // THEN
        #expect(sizes1 != sizes2)
    }

    @Test("Inequality when different image size")
    func inequalityWhenDifferentImageSize() {
        // GIVEN / WHEN
        let sizes1 = ButtonSizes(height: 44, isFixedWidth: false, imageSize: 16)
        let sizes2 = ButtonSizes(height: 44, isFixedWidth: false, imageSize: 20)

        // THEN
        #expect(sizes1 != sizes2)
    }

    @Test("Fixed width is true")
    func isFixedWidthIsTrue() {
        // GIVEN / WHEN
        let sizes = ButtonSizes(height: 44, isFixedWidth: true, imageSize: 16)

        // THEN
        #expect(sizes.isFixedWidth == true)
    }

    @Test("Fixed width is false")
    func isFixedWidthIsFalse() {
        // GIVEN / WHEN
        let sizes = ButtonSizes(height: 44, isFixedWidth: false, imageSize: 16)

        // THEN
        #expect(sizes.isFixedWidth == false)
    }
}

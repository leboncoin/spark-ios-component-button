//
//  ButtonSizeTests.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 17/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentButton

final class ButtonSizeTests: XCTestCase {

    // MARK: - Tests

    func test_all_cases() {
        // GIVEN / WHEN
        let cases = ButtonSize.allCases

        // THEN
        XCTAssertEqual(
            cases,
            [.medium, .large]
        )
    }
}

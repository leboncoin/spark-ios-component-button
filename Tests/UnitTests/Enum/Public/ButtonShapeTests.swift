//
//  ButtonShapeTests.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 17/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentButton

final class ButtonShapeTests: XCTestCase {

    // MARK: - Tests

    func test_all_cases() {
        // GIVEN / WHEN
        let cases = ButtonShape.allCases

        // THEN
        XCTAssertEqual(
            cases,
            [.pill, .rounded]
        )
    }
}

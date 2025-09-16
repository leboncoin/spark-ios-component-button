//
//  ButtonSpacings.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 23/06/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentButton

extension ButtonSpacings {

    // MARK: - Properties

    static func mocked(
        horizontalSpacing: CGFloat = 11,
        horizontalPadding: CGFloat = 12
    ) -> Self {
        return .init(
            horizontalSpacing: horizontalSpacing,
            horizontalPadding: horizontalPadding
        )
    }
}

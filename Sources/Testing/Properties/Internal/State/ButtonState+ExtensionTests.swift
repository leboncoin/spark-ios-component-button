//
//  ButtonState.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 27/06/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentButton

extension ButtonState {

    // MARK: - Properties

    static func mocked(
        isUserInteractionEnabled: Bool = true,
        opacity: CGFloat = 1.0
    ) -> Self {
        return .init(
            isUserInteractionEnabled: isUserInteractionEnabled,
            opacity: opacity
        )
    }
}

//
//  ButtonShape.swift
//  SparkComponentButton
//
//  Created by janniklas.freundt.ext on 08.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

/// Buttons can have different shapes.
@available(*, deprecated, message: "Not used anymore. There is only pill button now.")
public enum ButtonShape: CaseIterable {
    /// Button with pill-like shape.
    case pill

    /// Button with rounded corners.
    case rounded

    /// Square button with no rounded corners.
    @available(*, deprecated, message: "Use instead the .rounded case")
    case square

    // MARK: - Properties

    public static var allCases: [ButtonShape] = [.pill, rounded]
}

//
//  ButtonShape.swift
//  SparkButton
//
//  Created by janniklas.freundt.ext on 08.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

/// Buttons can have different shapes.
public enum ButtonShape: CaseIterable {
    /// Button with pill-like shape.
    case pill

    /// Button with rounded corners.
    case rounded

    /// Square button with no rounded corners.
    case square
}

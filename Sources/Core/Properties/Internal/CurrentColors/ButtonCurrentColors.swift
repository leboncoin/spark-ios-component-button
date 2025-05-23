//
//  ButtonCurrentColors.swift
//  SparkButton
//
//  Created by robin.lemaire on 27/06/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

/// Current Button Colors properties from a button colors and state
struct ButtonCurrentColors {

    // MARK: - Properties

    let imageTintColor: any ColorToken
    let titleColor: (any ColorToken)?
    let backgroundColor: any ColorToken
    let borderColor: any ColorToken
}

// MARK: Hashable & Equatable

extension ButtonCurrentColors: Hashable, Equatable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.imageTintColor)
        if let titleColor = self.titleColor {
            hasher.combine(titleColor)
        }
        hasher.combine(self.backgroundColor)
        hasher.combine(self.borderColor)
    }

    static func == (lhs: ButtonCurrentColors, rhs: ButtonCurrentColors) -> Bool {
        return lhs.imageTintColor.equals(rhs.imageTintColor) &&
        lhs.titleColor.equals(rhs.titleColor) == true &&
        lhs.backgroundColor.equals(rhs.backgroundColor) &&
        lhs.borderColor.equals(rhs.borderColor)
    }
}

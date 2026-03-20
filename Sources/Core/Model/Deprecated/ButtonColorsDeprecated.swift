//
//  ButtonColorsDeprecated.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 27/06/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

/// Current Button Colors properties from a button colors and state
@available(*, deprecated, message: "Not used anymore by SparkButton or SparkUIButton")
struct ButtonColorsDeprecated {

    // MARK: - Properties

    var imageTintColor: any ColorToken
    var titleColor: (any ColorToken)?
    var backgroundColor: any ColorToken
    var borderColor: any ColorToken
}

// MARK: Hashable & Equatable

extension ButtonColorsDeprecated: Hashable, Equatable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.imageTintColor)
        if let titleColor = self.titleColor {
            hasher.combine(titleColor)
        }
        hasher.combine(self.backgroundColor)
        hasher.combine(self.borderColor)
    }

    static func == (lhs: ButtonColorsDeprecated, rhs: ButtonColorsDeprecated) -> Bool {
        return lhs.imageTintColor.equals(rhs.imageTintColor) &&
        lhs.titleColor.equals(rhs.titleColor) == true &&
        lhs.backgroundColor.equals(rhs.backgroundColor) &&
        lhs.borderColor.equals(rhs.borderColor)
    }
}

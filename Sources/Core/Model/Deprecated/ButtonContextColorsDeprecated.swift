//
//  ButtonContextColorsDeprecated.swift
//  SparkComponentButton
//
//  Created by janniklas.freundt.ext on 02.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

/// All Button Colors from a theme, variant and intents
@available(*, deprecated, message: "Not used anymore by SparkButton or SparkUIButton")
struct ButtonContextColorsDeprecated {

    // MARK: - Properties

    var foregroundColor: any ColorToken = ColorTokenClear()
    var backgroundColor: any ColorToken = ColorTokenClear()
    var pressedBackgroundColor: any ColorToken = ColorTokenClear()
    var borderColor: any ColorToken = ColorTokenClear()
    var pressedBorderColor: any ColorToken = ColorTokenClear()
}

// MARK: Hashable & Equatable

extension ButtonContextColorsDeprecated: Hashable, Equatable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.foregroundColor)
        hasher.combine(self.backgroundColor)
        hasher.combine(self.pressedBackgroundColor)
        hasher.combine(self.borderColor)
        hasher.combine(self.pressedBorderColor)
    }

    static func == (lhs: ButtonContextColorsDeprecated, rhs: ButtonContextColorsDeprecated) -> Bool {
        return lhs.backgroundColor.equals(rhs.backgroundColor) &&
        lhs.borderColor.equals(rhs.borderColor) &&
        lhs.foregroundColor.equals(rhs.foregroundColor) &&
        lhs.pressedBorderColor.equals(rhs.pressedBorderColor) &&
        lhs.pressedBackgroundColor.equals(rhs.pressedBackgroundColor)
    }
}

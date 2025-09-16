//
//  ButtonColors.swift
//  Spark
//
//  Created by janniklas.freundt.ext on 02.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming

extension ButtonColors {

    // MARK: - Properties

    static func mocked(
        foregroundColor: any ColorToken = ColorTokenGeneratedMock.random(),
        backgroundColor: any ColorToken = ColorTokenGeneratedMock.random(),
        pressedBackgroundColor: any ColorToken = ColorTokenGeneratedMock.random(),
        borderColor: any ColorToken = ColorTokenGeneratedMock.random(),
        pressedBorderColor: any ColorToken = ColorTokenGeneratedMock.random()
    ) -> Self {
        return .init(
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor,
            pressedBackgroundColor: pressedBackgroundColor,
            borderColor: borderColor,
            pressedBorderColor: pressedBorderColor
        )
    }
}

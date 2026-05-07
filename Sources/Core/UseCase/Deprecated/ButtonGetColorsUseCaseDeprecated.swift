//
//  ButtonGetColorsUseCaseDeprecated.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 27/06/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

// sourcery: AutoMockable, AutoMockTest
@available(*, deprecated, message: "Not used anymore by SparkButton or SparkUIButton")
protocol ButtonGetColorsUseCaseableDeprecated {
    func execute(
        contextColors: ButtonContextColorsDeprecated,
        isPressed: Bool
    ) -> ButtonColorsDeprecated
}

@available(*, deprecated, message: "Not used anymore by SparkButton or SparkUIButton")
struct ButtonGetColorsUseCaseDeprecated: ButtonGetColorsUseCaseableDeprecated {

    // MARK: - Methods

    func execute(
        contextColors: ButtonContextColorsDeprecated,
        isPressed: Bool
    ) -> ButtonColorsDeprecated {
        if isPressed {
            return .init(
                imageTintColor: contextColors.foregroundColor,
                titleColor: contextColors.foregroundColor,
                backgroundColor: contextColors.pressedBackgroundColor,
                borderColor: contextColors.pressedBorderColor
            )
        } else {
            return .init(
                imageTintColor: contextColors.foregroundColor,
                titleColor: contextColors.foregroundColor,
                backgroundColor: contextColors.backgroundColor,
                borderColor: contextColors.borderColor
            )
        }
    }
}

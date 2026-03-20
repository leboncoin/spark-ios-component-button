//
//  ButtonGetBorderUseCaseDeprecated.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 23/06/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
@available(*, deprecated, message: "Not used anymore by SparkButton or SparkUIButton")
protocol ButtonGetBorderUseCaseableDeprecated {
    // sourcery: border = "Identical"
    func execute(
        border: any Border,
        variant: ButtonVariant
    ) -> ButtonBorder
}

@available(*, deprecated, message: "Not used anymore by SparkButton or SparkUIButton")
struct ButtonGetBorderUseCaseDeprecated: ButtonGetBorderUseCaseableDeprecated {

    // MARK: - Methods

    func execute(
        border: any Border,
        variant: ButtonVariant
    ) -> ButtonBorder {
        let width = (variant == .outlined) ? border.width.small : 0

        return .init(
            width: width,
            radius: border.radius.full
        )
    }
}

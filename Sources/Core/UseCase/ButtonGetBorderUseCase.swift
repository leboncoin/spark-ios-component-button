//
//  ButtonGetBorderUseCase.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 23/06/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ButtonGetBorderUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        variant: ButtonVariant
    ) -> ButtonBorder
}

struct ButtonGetBorderUseCase: ButtonGetBorderUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        variant: ButtonVariant
    ) -> ButtonBorder {
        let border = theme.border

        return .init(
            width: (variant == .outlined) ? border.width.small : 0,
            radius: border.radius.full
        )
    }
}

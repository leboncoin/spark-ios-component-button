//
//  ButtonGetBorderUseCase.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 23/06/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SparkCommon
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ButtonGetBorderUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        shape: ButtonShape,
        variant: ButtonVariant,
        removeStyles: Bool
    ) -> ButtonBorder
}

struct ButtonGetBorderUseCase: ButtonGetBorderUseCaseable {

    // MARK: - Properties

    private let featureTogglesService: any SparkFeatureToggleServicing

    // MARK: - Initialization

    init(featureTogglesService: any SparkFeatureToggleServicing = SparkFeatureToggleService.shared) {
        self.featureTogglesService = featureTogglesService
    }

    // MARK: - Methods

    func execute(
        theme: any Theme,
        shape: ButtonShape,
        variant: ButtonVariant,
        removeStyles: Bool
    ) -> ButtonBorder {
        guard !removeStyles else {
            return .init()
        }

        let border = theme.border

        let radius: CGFloat = switch shape {
        case .square: 0
        case .rounded: border.radius.large
        case .pill: border.radius.full
        }

        return .init(
            width: (variant == .outlined) ? border.width.small : 0,
            radius: self.featureTogglesService.rebranding ? border.radius.full : radius
        )
    }
}

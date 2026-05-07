//
//  ButtonGetBorderUseCaseDeprecated.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 23/06/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SparkCommon
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ButtonGetBorderUseCaseableDeprecated {
    // sourcery: border = "Identical"
    func execute(
        border: any Border,
        shape: ButtonShape,
        variant: ButtonVariant
    ) -> ButtonBorder
}

struct ButtonGetBorderUseCaseDeprecated: ButtonGetBorderUseCaseableDeprecated {

    // MARK: - Properties

    private let featureTogglesService: any SparkFeatureToggleServicing

    // MARK: - Initialization

    init(featureTogglesService: any SparkFeatureToggleServicing = SparkFeatureToggleService.shared) {
        self.featureTogglesService = featureTogglesService
    }

    // MARK: - Methods

    func execute(
        border: any Border,
        shape: ButtonShape,
        variant: ButtonVariant
    ) -> ButtonBorder {
        let radius: CGFloat = switch shape {
        case .square: 0
        case .rounded: border.radius.large
        case .pill: border.radius.full
        }

        let width = (variant == .outlined) ? border.width.small : 0

        return .init(
            width: width,
            radius: self.featureTogglesService.rebranding ? border.radius.full : radius
        )
    }
}

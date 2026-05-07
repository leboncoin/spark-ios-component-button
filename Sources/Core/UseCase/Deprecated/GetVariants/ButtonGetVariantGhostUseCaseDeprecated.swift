//
//  ButtonGetVariantGhostUseCaseDeprecated.swift
//  SparkComponentButtonTests
//
//  Created by janniklas.freundt.ext on 16.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

@available(*, deprecated, message: "Not used anymore by SparkButton or SparkUIButton")
struct ButtonGetVariantGhostUseCaseDeprecated: ButtonGetVariantUseCaseableDeprecated {

    // MARK: - Methods

    func execute(
        intent: ButtonIntent,
        colors: any Colors,
        dims: any Dims
    ) -> ButtonContextColorsDeprecated {
        let borderColor = ColorTokenDefault.clear
        let pressedBorderColor = ColorTokenDefault.clear

        let dim5 = dims.dim5

        switch intent {
        case .accent:
            return .init(
                foregroundColor: colors.accent.onAccentContainer,
                backgroundColor: ColorTokenDefault.clear,
                pressedBackgroundColor: colors.accent.accent.opacity(dim5),
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .alert:
            return .init(
                foregroundColor: colors.feedback.onAlertContainer,
                backgroundColor: ColorTokenDefault.clear,
                pressedBackgroundColor: colors.feedback.alert.opacity(dim5),
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .danger:
            return .init(
                foregroundColor: colors.feedback.onErrorContainer,
                backgroundColor: ColorTokenDefault.clear,
                pressedBackgroundColor: colors.feedback.error.opacity(dim5),
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .info:
            return .init(
                foregroundColor: colors.feedback.onInfoContainer,
                backgroundColor: ColorTokenDefault.clear,
                pressedBackgroundColor: colors.feedback.info.opacity(dim5),
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .main:
            return .init(
                foregroundColor: colors.main.onMainContainer,
                backgroundColor: ColorTokenDefault.clear,
                pressedBackgroundColor: colors.main.main.opacity(dim5),
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .neutral:
            return .init(
                foregroundColor: colors.feedback.onNeutralContainer,
                backgroundColor: ColorTokenDefault.clear,
                pressedBackgroundColor: colors.feedback.neutral.opacity(dim5),
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .success:
            return .init(
                foregroundColor: colors.feedback.onSuccessContainer,
                backgroundColor: ColorTokenDefault.clear,
                pressedBackgroundColor: colors.feedback.success.opacity(dim5),
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .support:
            return .init(
                foregroundColor: colors.support.onSupportContainer,
                backgroundColor: ColorTokenDefault.clear,
                pressedBackgroundColor: colors.support.support.opacity(dim5),
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .surface:
            return .init(
                foregroundColor: colors.base.surface,
                backgroundColor: ColorTokenDefault.clear,
                pressedBackgroundColor: colors.base.surface.opacity(dim5),
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .surfaceInverse:
            return .init(
                foregroundColor: colors.base.surfaceInverse,
                backgroundColor: ColorTokenDefault.clear,
                pressedBackgroundColor: colors.base.surfaceInverse.opacity(dim5),
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        }
    }
}

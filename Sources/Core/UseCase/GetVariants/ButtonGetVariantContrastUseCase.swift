//
//  ButtonVariantGetContrastUseCase.swift
//  SparkComponentButton
//
//  Created by janniklas.freundt.ext on 16.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

struct ButtonVariantGetContrastUseCase: ButtonGetVariantUseCaseable {

    // MARK: - Methods

    func execute(
        intent: ButtonIntent,
        colors: any Colors,
        dims: any Dims
    ) -> ButtonColors {
        let borderColor = ColorTokenDefault.clear
        let pressedBorderColor = ColorTokenDefault.clear
        let backgroundColor = colors.base.surface

        switch intent {
        case .accent:
            return .init(
                foregroundColor: colors.accent.onAccentContainer,
                backgroundColor: backgroundColor,
                pressedBackgroundColor: colors.states.accentContainerPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .alert:
            return .init(
                foregroundColor: colors.feedback.onAlertContainer,
                backgroundColor: backgroundColor,
                pressedBackgroundColor: colors.states.alertContainerPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .basic:
            return .init(
                foregroundColor: colors.basic.onBasicContainer,
                backgroundColor: backgroundColor,
                pressedBackgroundColor: colors.states.basicContainerPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .danger:
            return .init(
                foregroundColor: colors.feedback.onErrorContainer,
                backgroundColor: backgroundColor,
                pressedBackgroundColor: colors.states.errorContainerPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .info:
            return .init(
                foregroundColor: colors.feedback.onInfoContainer,
                backgroundColor: backgroundColor,
                pressedBackgroundColor: colors.states.infoContainerPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .main:
            return .init(
                foregroundColor: colors.main.onMainContainer,
                backgroundColor: backgroundColor,
                pressedBackgroundColor: colors.states.mainContainerPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .neutral:
            return .init(
                foregroundColor: colors.feedback.onNeutralContainer,
                backgroundColor: backgroundColor,
                pressedBackgroundColor: colors.states.neutralContainerPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .success:
            return .init(
                foregroundColor: colors.feedback.onSuccessContainer,
                backgroundColor: backgroundColor,
                pressedBackgroundColor: colors.states.successContainerPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .support:
            return .init(
                foregroundColor: colors.support.onSupportContainer,
                backgroundColor: backgroundColor,
                pressedBackgroundColor: colors.states.supportContainerPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .surface:
            return .init(
                foregroundColor: colors.base.onSurface,
                backgroundColor: backgroundColor,
                pressedBackgroundColor: colors.states.surfacePressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .surfaceInverse:
            return .init(
                foregroundColor: colors.base.onSurfaceInverse,
                backgroundColor: colors.base.surfaceInverse,
                pressedBackgroundColor: colors.states.surfaceInversePressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        }
    }
}

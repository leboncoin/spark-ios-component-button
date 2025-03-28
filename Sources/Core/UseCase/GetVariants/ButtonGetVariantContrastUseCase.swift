//
//  ButtonVariantGetContrastUseCase.swift
//  SparkButton
//
//  Created by janniklas.freundt.ext on 16.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

struct ButtonVariantGetContrastUseCase: ButtonGetVariantUseCaseable {

    // MARK: - Methods

    func execute(
        intent: ButtonIntent,
        colors: Colors,
        dims: Dims
    ) -> ButtonColors {
        let borderColor = ColorTokenDefault.clear
        let pressedBorderColor = ColorTokenDefault.clear
        let backgroundColor = colors.base.surface

        switch intent {
        case .accent:
            return .init(
                foregroundColor: colors.accent.accent,
                backgroundColor: backgroundColor,
                pressedBackgroundColor: colors.states.accentContainerPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .basic:
            return .init(
                foregroundColor: colors.basic.basic,
                backgroundColor: backgroundColor,
                pressedBackgroundColor: colors.states.basicContainerPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .main:
            return .init(
                foregroundColor: colors.main.main,
                backgroundColor: backgroundColor,
                pressedBackgroundColor: colors.states.mainContainerPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .support:
            return .init(
                foregroundColor: colors.support.support,
                backgroundColor: backgroundColor,
                pressedBackgroundColor: colors.states.supportContainerPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .neutral:
            return .init(
                foregroundColor: colors.feedback.neutral,
                backgroundColor: backgroundColor,
                pressedBackgroundColor: colors.states.neutralContainerPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .alert:
            return .init(
                foregroundColor: colors.feedback.alert,
                backgroundColor: backgroundColor,
                pressedBackgroundColor: colors.states.alertContainerPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .success:
            return .init(
                foregroundColor: colors.feedback.success,
                backgroundColor: backgroundColor,
                pressedBackgroundColor: colors.states.successContainerPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .danger:
            return .init(
                foregroundColor: colors.feedback.error,
                backgroundColor: backgroundColor,
                pressedBackgroundColor: colors.states.errorContainerPressed,
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
        case .info:
            return .init(
                foregroundColor: colors.feedback.info,
                backgroundColor: backgroundColor,
                pressedBackgroundColor: colors.states.infoContainerPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        }
    }
}

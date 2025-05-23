//
//  ButtonGetVariantFilledUseCase.swift
//  SparkButtonTests
//
//  Created by janniklas.freundt.ext on 16.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

struct ButtonGetVariantFilledUseCase: ButtonGetVariantUseCaseable {

    // MARK: - Methods

    func execute(
        intent: ButtonIntent,
        colors: Colors,
        dims: Dims
    ) -> ButtonColors {
        let borderColor = ColorTokenDefault.clear
        let pressedBorderColor = ColorTokenDefault.clear

        switch intent {
        case .accent:
            return .init(
                foregroundColor: colors.accent.onAccent,
                backgroundColor: colors.accent.accent,
                pressedBackgroundColor: colors.states.accentPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .basic:
            return .init(
                foregroundColor: colors.basic.onBasic,
                backgroundColor: colors.basic.basic,
                pressedBackgroundColor: colors.states.basicPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .main:
            return .init(
                foregroundColor: colors.main.onMain,
                backgroundColor: colors.main.main,
                pressedBackgroundColor: colors.states.mainPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .support:
            return .init(
                foregroundColor: colors.support.onSupport,
                backgroundColor: colors.support.support,
                pressedBackgroundColor: colors.states.supportPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .neutral:
            return .init(
                foregroundColor: colors.feedback.onNeutral,
                backgroundColor: colors.feedback.neutral,
                pressedBackgroundColor: colors.states.neutralPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .alert:
            return .init(
                foregroundColor: colors.feedback.onAlert,
                backgroundColor: colors.feedback.alert,
                pressedBackgroundColor: colors.states.alertPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .success:
            return .init(
                foregroundColor: colors.feedback.onSuccess,
                backgroundColor: colors.feedback.success,
                pressedBackgroundColor: colors.states.successPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .danger:
            return .init(
                foregroundColor: colors.feedback.onError,
                backgroundColor: colors.feedback.error,
                pressedBackgroundColor: colors.states.errorPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .surface:
            return .init(
                foregroundColor: colors.base.onSurface,
                backgroundColor: colors.base.surface,
                pressedBackgroundColor: colors.states.surfacePressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        case .info:
            return .init(
                foregroundColor: colors.feedback.onInfo,
                backgroundColor: colors.feedback.info,
                pressedBackgroundColor: colors.states.infoPressed,
                borderColor: borderColor,
                pressedBorderColor: pressedBorderColor
            )
        }
    }
}

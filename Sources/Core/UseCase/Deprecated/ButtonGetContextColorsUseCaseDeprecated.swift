//
//  ButtonGetContextColorsUseCaseDeprecated.swift
//  SparkComponentButton
//
//  Created by janniklas.freundt.ext on 19.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
@available(*, deprecated, message: "Not used anymore by SparkButton or SparkUIButton")
protocol ButtonGetContextColorsUseCaseableDeprecated {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        intent: ButtonIntent,
        variant: ButtonVariant
    ) -> ButtonContextColorsDeprecated
}

@available(*, deprecated, message: "Not used anymore by SparkButton or SparkUIButton")
struct ButtonGetContextColorsUseCaseDeprecated: ButtonGetContextColorsUseCaseableDeprecated {

    // MARK: - Private properties

    private let getContrastUseCase: any ButtonGetVariantUseCaseableDeprecated
    private let getFilledUseCase: any ButtonGetVariantUseCaseableDeprecated
    private let getGhostUseCase: any ButtonGetVariantUseCaseableDeprecated
    private let getOutlinedUseCase: any ButtonGetVariantUseCaseableDeprecated
    private let getTintedUseCase: any ButtonGetVariantUseCaseableDeprecated

    // MARK: - Initialization

    init(
        getContrastUseCase: any ButtonGetVariantUseCaseableDeprecated = ButtonGetVariantContrastUseCaseDeprecated(),
        getFilledUseCase: any ButtonGetVariantUseCaseableDeprecated = ButtonGetVariantFilledUseCaseDeprecated(),
        getGhostUseCase: any ButtonGetVariantUseCaseableDeprecated = ButtonGetVariantGhostUseCaseDeprecated(),
        getOutlinedUseCase: any ButtonGetVariantUseCaseableDeprecated = ButtonGetVariantOutlinedUseCaseDeprecated(),
        getTintedUseCase: any ButtonGetVariantUseCaseableDeprecated = ButtonGetVariantTintedUseCaseDeprecated()
    ) {
        self.getContrastUseCase = getContrastUseCase
        self.getFilledUseCase = getFilledUseCase
        self.getGhostUseCase = getGhostUseCase
        self.getOutlinedUseCase = getOutlinedUseCase
        self.getTintedUseCase = getTintedUseCase
    }

    // MARK: - Methods
    func execute(
        theme: any Theme,
        intent: ButtonIntent,
        variant: ButtonVariant
    ) -> ButtonContextColorsDeprecated {
        let colors = theme.colors
        let dims = theme.dims

        let useCase: ButtonGetVariantUseCaseableDeprecated
        switch variant {
        case .contrast:
            useCase = self.getContrastUseCase
        case .filled:
            useCase = self.getFilledUseCase
        case .ghost:
            useCase = self.getGhostUseCase
        case .outlined:
            useCase = self.getOutlinedUseCase
        case .tinted:
            useCase = self.getTintedUseCase
        }

        return useCase.execute(
            intent: intent,
            colors: colors,
            dims: dims
        )
    }
}

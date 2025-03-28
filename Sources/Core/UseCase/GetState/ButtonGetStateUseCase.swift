//
//  ButtonGetStateUseCase.swift
//  SparkButton
//
//  Created by robin.lemaire on 27/06/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ButtonGetStateUseCaseable {
    // sourcery: dims = "Identical"
    func execute(isEnabled: Bool,
                 dims: Dims) -> ButtonState
}

struct ButtonGetStateUseCase: ButtonGetStateUseCaseable {

    // MARK: - Methods

    func execute(
        isEnabled: Bool,
        dims: Dims
    ) -> ButtonState {
        let opacity = isEnabled ? dims.none : dims.dim3

        return .init(
            isUserInteractionEnabled: isEnabled,
            opacity: opacity
        )
    }
}

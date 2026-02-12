//
//  IconButtonSUIViewModel.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 15/01/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

final class IconButtonSUIViewModel: IconButtonViewModel, ButtonMainSUIViewModel {

    // MARK: - Properties

    var controlStatus: ControlStatus = .init()

    // MARK: - Published Properties

    @Published private(set) var controlStateImage: ControlStateImage = .init()
    @Published private(set) var controlStateText: ControlStateText?

    // MARK: - Initialization

    init(
        theme: any Theme,
        intent: ButtonIntent,
        variant: ButtonVariant,
        size: ButtonSize
    ) {
        super.init(
            for: .swiftUI,
            theme: theme,
            intent: intent,
            variant: variant,
            size: size
        )
    }
}


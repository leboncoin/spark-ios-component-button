//
//  IconButtonViewModel.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 13/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkCommon
import SparkTheming

class IconButtonViewModel: ButtonMainViewModel {

    // MARK: - Initialization

    init(
        for frameworkType: FrameworkType,
        theme: any Theme,
        intent: ButtonIntent,
        variant: ButtonVariant,
        size: ButtonSize
    ) {
        super.init(
            for: frameworkType,
            type: .iconButton,
            theme: theme,
            intent: intent,
            variant: variant,
            size: size
        )
    }
}

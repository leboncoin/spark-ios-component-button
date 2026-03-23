//
//  ButtonViewModel.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 13/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Combine
@_spi(SI_SPI) import SparkCommon
import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
// sourcery: titleFontToken = "Identical"
class ButtonViewModel: ButtonMainViewModel {

    // MARK: - Properties

    var alignment: ButtonAlignment {
        didSet {
            guard self.alignment != oldValue else { return }
            self.alignmentDidUpdate()
        }
    }

    // MARK: - Published Properties

    @Published private(set) var spacings: ButtonSpacings?
    @Published private(set) var isImageTrailing: Bool = false
    @Published private(set) var titleFontToken: (any TypographyFontToken)?

    // MARK: - Private Properties

    private let getSpacingsUseCase: any ButtonGetSpacingsUseCaseable

    // MARK: - Initialization

    init(
        for frameworkType: FrameworkType,
        theme: any Theme,
        intent: ButtonIntent,
        variant: ButtonVariant,
        size: ButtonSize,
        alignment: ButtonAlignment,
        getSpacingsUseCase: any ButtonGetSpacingsUseCaseable = ButtonGetSpacingsUseCase()
    ) {
        self.alignment = alignment
        self.getSpacingsUseCase = getSpacingsUseCase

        super.init(
            for: frameworkType,
            type: .button,
            theme: theme,
            intent: intent,
            variant: variant,
            size: size
        )
    }

    // MARK: - Update

    override func updateAll() {
        super.updateAll()

        self.alignmentDidUpdate()
        self.spacingsDidUpdate()
        self.titleFontDidUpdate()
    }

    private func alignmentDidUpdate() {
        self.isImageTrailing = self.alignment.isTrailingImage
    }

    private func spacingsDidUpdate() {
        self.spacings = self.getSpacingsUseCase.execute(
            spacing: self.theme.layout.spacing
        )
    }

    private func titleFontDidUpdate() {
        self.titleFontToken = self.theme.typography.callout
    }
}

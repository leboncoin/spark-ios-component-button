//
//  ButtonViewModel.swift
//  SparkButton
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
    @Published private(set) var titleFontToken: TypographyFontToken?

    // MARK: - Private Properties

    private let getSpacingsUseCase: ButtonGetSpacingsUseCaseable

    // MARK: - Initialization

    init(
        for frameworkType: FrameworkType,
        theme: Theme,
        intent: ButtonIntent,
        variant: ButtonVariant,
        size: ButtonSize,
        shape: ButtonShape,
        alignment: ButtonAlignment,
        getSpacingsUseCase: ButtonGetSpacingsUseCaseable = ButtonGetSpacingsUseCase()
    ) {
        self.alignment = alignment
        self.getSpacingsUseCase = getSpacingsUseCase

        super.init(
            for: frameworkType,
            type: .button,
            theme: theme,
            intent: intent,
            variant: variant,
            size: size,
            shape: shape
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

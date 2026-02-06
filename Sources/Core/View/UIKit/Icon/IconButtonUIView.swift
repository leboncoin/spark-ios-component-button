//
//  IconIconButtonUIView.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 10/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Combine
import UIKit
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// The UIKit version for the icon button.
public final class IconButtonUIView: ButtonMainUIView {

    // MARK: - Initialization

    /// Initialize a new button view.
    /// - Parameters:
    ///   - theme: The spark theme of the button.
    ///   - intent: The intent of the button.
    ///   - variant: The variant of the button.
    ///   - size: The size of the button.
    ///   - shape: The shape of the button.
    @available(*, deprecated, message: "There is no shape anymore. There is only pill button.")
    public init(
        theme: any Theme,
        intent: ButtonIntent,
        variant: ButtonVariant,
        size: ButtonSize,
        shape: ButtonShape
    ) {
        let viewModel = IconButtonViewModel(
            for: .uiKit,
            theme: theme,
            intent: intent,
            variant: variant,
            size: size
        )

        super.init(viewModel: viewModel)
    }

    /// Initialize a new button view.
    /// - Parameters:
    ///   - theme: The spark theme of the button.
    ///   - intent: The intent of the button.
    ///   - variant: The variant of the button.
    ///   - size: The size of the button.
    public init(
        theme: any Theme,
        intent: ButtonIntent,
        variant: ButtonVariant,
        size: ButtonSize
    ) {
        let viewModel = IconButtonViewModel(
            for: .uiKit,
            theme: theme,
            intent: intent,
            variant: variant,
            size: size
        )

        super.init(viewModel: viewModel)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    internal override func setupView() {
        // Accessibility
        self.accessibilityIdentifier = ButtonAccessibilityIdentifier.iconButton

        // Add subviews
        self.addSubview(self.imageView)

        super.setupView()
    }

    // MARK: - Constraints

    internal override func setupViewConstraints() {
        super.setupViewConstraints()

        self.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }

    internal override func setupImageViewConstraints() {
        super.setupImageViewConstraints()

        NSLayoutConstraint.activate([
            self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

    // MARK: - Instrinsic Content Size

    public override var intrinsicContentSize: CGSize {
        return CGSize(
            width: self.height, // It is always a square
            height: self.height
        )
    }
}

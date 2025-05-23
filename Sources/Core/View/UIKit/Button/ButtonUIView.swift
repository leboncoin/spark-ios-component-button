//
//  ButtonUIView.swift
//  SparkButton
//
//  Created by robin.lemaire on 10/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Combine
import UIKit
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// The UIKit version for the button.
public final class ButtonUIView: ButtonMainUIView {

    // MARK: - Type alias

    private typealias Animation = ButtonConstants.Animation

    // MARK: - Components

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews:
                [
                    self.imageContentView,
                    self.titleLabel
                ]
        )
        stackView.axis = .horizontal
        stackView.accessibilityIdentifier = ButtonAccessibilityIdentifier.contentStackView
        stackView.isUserInteractionEnabled = false
        return stackView
    }()

    private lazy var imageContentView: UIView = {
        let view = UIView()
        view.addSubview(self.imageView)
        view.accessibilityIdentifier = ButtonAccessibilityIdentifier.imageContentView
        return view
    }()

    public var titleLabel: UILabel {
        return self.titleStateLabel
    }

    private var titleStateLabel: UIControlStateLabel = {
        let label = UIControlStateLabel()
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIdentifier = ButtonAccessibilityIdentifier.text
        label.lineBreakMode = .byTruncatingMiddle
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()

    // MARK: - Public Properties

    /// The alignment of the button.
    public var alignment: ButtonAlignment {
        get {
            return self.viewModel.alignment
        }
        set {
            self.viewModel.alignment = newValue
        }
    }

    /// A Boolean value indicating whether the button is in the enabled state.
    public override var isEnabled: Bool {
        get {
            return super.isEnabled
        }
        set {
            super.isEnabled = newValue
            self.titleStateLabel.updateContent(from: self)
        }
    }

    /// A Boolean value indicating whether the button is in the selected state.
    public override var isSelected: Bool {
        get {
            return super.isSelected
        }
        set {
            super.isSelected = newValue
            self.titleStateLabel.updateContent(from: self)
        }
    }

    /// A Boolean value indicating whether the button draws a highlight.
    public override var isHighlighted: Bool {
        get {
            return super.isHighlighted
        }
        set {
            super.isHighlighted = newValue
            self.titleStateLabel.updateContent(from: self)
        }
    }

    public override var accessibilityLabel: String? {
        get {
            return self.titleLabel.accessibilityLabel
        }
        set {
            self.titleLabel.accessibilityLabel = newValue
        }
    }

    // MARK: - Private Properties

    private let viewModel: ButtonViewModel

    private var contentStackViewLeadingConstraint: NSLayoutConstraint?

    @ScaledUIPadding private var horizontalSpacing: CGFloat = 0
    @ScaledUIPadding private var horizontalPadding: CGFloat = 0

    private var firstContentStackViewAnimation: Bool = true

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Initialization

    /// Initialize a new button view.
    /// - Parameters:
    ///   - theme: The spark theme of the button.
    ///   - intent: The intent of the button.
    ///   - variant: The variant of the button.
    ///   - size: The size of the button.
    ///   - shape: The shape of the button.
    ///   - alignment: The alignment of the button.
    public init(
        theme: Theme,
        intent: ButtonIntent,
        variant: ButtonVariant,
        size: ButtonSize,
        shape: ButtonShape,
        alignment: ButtonAlignment
    ) {
        let viewModel = ButtonViewModel(
            for: .uiKit,
            theme: theme,
            intent: intent,
            variant: variant,
            size: size,
            shape: shape,
            alignment: alignment
        )

        self.viewModel = viewModel

        super.init(viewModel: viewModel)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    internal override func setupView() {
        // Accessibility
        self.accessibilityIdentifier = ButtonAccessibilityIdentifier.button

        // Add subviews
        self.addSubview(self.contentStackView)

        super.setupView()
    }

    // MARK: - Constraints

    internal override func setupConstraints() {
        super.setupConstraints()

        self.setupContentStackViewConstraints()
        self.setupImageContentViewConstraints()
    }

    internal override func setupViewConstraints() {
        super.setupViewConstraints()

        self.widthAnchor.constraint(greaterThanOrEqualTo: self.heightAnchor).isActive = true
    }

    private func setupContentStackViewConstraints() {
        self.contentStackView.translatesAutoresizingMaskIntoConstraints = false

        self.contentStackViewLeadingConstraint = self.contentStackView.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor)
        let contentStackViewTopConstraint = self.contentStackView.topAnchor.constraint(equalTo: self.topAnchor)
        let contentStackViewCenterXAnchor = self.contentStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let contentStackViewBottomConstraint = self.contentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)

        NSLayoutConstraint.activate([
            self.contentStackViewLeadingConstraint,
            contentStackViewTopConstraint,
            contentStackViewCenterXAnchor,
            contentStackViewBottomConstraint,
        ].compactMap { $0 })
    }

    private func setupImageContentViewConstraints() {
        self.imageContentView.translatesAutoresizingMaskIntoConstraints = false
        self.imageContentView.widthAnchor.constraint(greaterThanOrEqualTo: self.imageView.widthAnchor).isActive = true
    }

    internal override func setupImageViewConstraints() {
        super.setupImageViewConstraints()

        NSLayoutConstraint.activate([
            self.imageView.centerXAnchor.constraint(equalTo: self.imageContentView.centerXAnchor),
            self.imageView.centerYAnchor.constraint(equalTo: self.imageContentView.centerYAnchor)
        ])
    }

    // MARK: - Instrinsic Content Size

    public override var intrinsicContentSize: CGSize {
        var width: CGFloat = self.horizontalSpacing * 2

        let isTitle = !self.titleLabel.isHidden
        let isImage = !self.imageContentView.isHidden

        if isTitle {
            width += self.titleLabel.intrinsicContentSize.width
        }
        if isImage {
            width += self.imageHeight // It is always a square
        }
        if isTitle && isImage {
            width += self.contentStackView.spacing
        }

        return CGSize(
            width: width,
            height: self.height
        )
    }

    // MARK: - Setter & Getter

    /// The title of the button for a state.
    /// - parameter state: state of the title
    public func title(for state: ControlState) -> String? {
        return self.titleStateLabel.text(for: state)
    }

    /// Set the title of the button for a state.
    /// - parameter title: new title of the button
    /// - parameter state: state of the title
    public func setTitle(_ title: String?, for state: ControlState) {
        self.titleStateLabel.setText(title, for: state, on: self)
    }

    /// The title of the button for a state.
    /// - parameter state: state of the title
    public func attributedTitle(for state: ControlState) -> NSAttributedString? {
        return self.titleStateLabel.attributedText(for: state)
    }

    /// Set the attributedTitle of the button for a state.
    /// - parameter attributedTitle: new attributedTitle of the button
    /// - parameter state: state of the attributedTitle
    public func setAttributedTitle(_ attributedTitle: NSAttributedString?, for state: ControlState) {
        self.titleStateLabel.setAttributedText(attributedTitle, for: state, on: self)
    }

    // MARK: - Update UI

    private func updateSpacings() {
        // Reload spacing only if value changed
        let horizontalSpacing = self._horizontalSpacing.wrappedValue
        let horizontalPadding = self._horizontalPadding.wrappedValue

        if horizontalSpacing != self.contentStackViewLeadingConstraint?.constant ||
            horizontalPadding != self.contentStackView.spacing {

            let isAnimated = self.isAnimated && !self.firstContentStackViewAnimation
            let animationType: UIExecuteAnimationType = isAnimated ? .animated(duration: Animation.slowDuration) : .unanimated

            UIView.execute(animationType: animationType) { [weak self] in
                guard let self else { return }

                self.firstContentStackViewAnimation = false

                self.contentStackViewLeadingConstraint?.constant = horizontalSpacing
                self.contentStackView.updateConstraintsIfNeeded()

                self.contentStackView.spacing = horizontalPadding
            }
        }
    }

    // MARK: - Data Did Update

    private func spacingsDidUpdate(_ spacings: ButtonSpacings) {
        self.horizontalSpacing = spacings.horizontalSpacing
        self.horizontalPadding = spacings.horizontalPadding

        self.updateSpacings()
    }

    internal override func colorsDidUpdate(_ colors: ButtonCurrentColors) {
        super.colorsDidUpdate(colors)

        if let titleColor = colors.titleColor {
            self.titleLabel.textColor = titleColor.uiColor
        }
    }

    internal override func isImageOnStateViewDidUpdate(_ isImage: Bool) {
        super.isImageOnStateViewDidUpdate(isImage)

        self.imageContentView.isHidden = !isImage
    }

    // MARK: - Subscribe

    internal override func setupSubscriptions() {
        super.setupSubscriptions()

        // **
        // Spacings
        self.viewModel.$spacings.subscribe(in: &self.subscriptions) { [weak self] spacings in
            guard let self, let spacings else { return }

            self.spacingsDidUpdate(spacings)
        }
        // **

        // **
        // Content
        self.viewModel.$isImageTrailing.subscribe(in: &self.subscriptions) { [weak self] isImageTrailing in
            guard let self else { return }

            self.contentStackView.semanticContentAttribute = isImageTrailing ? .forceRightToLeft : .forceLeftToRight
        }
        // **

        // **
        // Title Font
        self.viewModel.$titleFontToken.subscribe(in: &self.subscriptions) { [weak self] titleFontToken in
            guard let self, let titleFontToken else { return }

            self.titleLabel.font = titleFontToken.uiFont
        }
        // **

        // **
        // Is Text ?
        self.titleStateLabel.$isText.subscribe(in: &self.subscriptions) { [weak self] isText in
            self?.titleLabel.isHidden = !isText
        }
        // **

        // **
        // Text changed ?
        self.titleStateLabel.$textChanged.subscribe(in: &self.subscriptions) { [weak self] _ in
            guard let self else { return }
            self.largeContentTitle = self.titleStateLabel.text
        }
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        // Update spacings
        self._horizontalSpacing.update(traitCollection: self.traitCollection)
        self._horizontalPadding.update(traitCollection: self.traitCollection)
        self.updateSpacings()
    }
}

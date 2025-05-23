//
//  ButtonMainUIView.swift
//  SparkButton
//
//  Created by robin.lemaire on 10/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Combine
import UIKit
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// This ButtonMainUIView view contains all communs subviews (imageView), rules, styles, constraints, ... for all buttons.
/// This view doesn't have a public init.
public class ButtonMainUIView: UIControl {

    // MARK: - Type alias

    private typealias Animation = ButtonConstants.Animation

    // MARK: - Components

    public var imageView: UIImageView {
        return self.imageStateView
    }

    private var imageStateView: UIControlStateImageView = {
        let imageView = UIControlStateImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintAdjustmentMode = .normal
        imageView.accessibilityIdentifier = ButtonAccessibilityIdentifier.imageView
        imageView.setContentCompressionResistancePriority(.required, for: .vertical)
        imageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        imageView.setContentHuggingPriority(.defaultLow, for: .vertical)
        imageView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return imageView
    }()

    // MARK: - Public Properties

    /// The tap publisher. Alternatively, you can use the native **action** (addAction) or **target** (addTarget).
    public var tapPublisher: UIControl.EventPublisher {
        return self.publisher(for: .touchUpInside)
    }

    /// Publishes when a touch was cancelled (e.g. by the system).
    public var touchCancelPublisher: UIControl.EventPublisher {
        return self.publisher(for: .touchCancel)
    }

    /// Publishes when a touch was started but the touch ended outside of the button view bounds.
    public var touchUpOutsidePublisher: UIControl.EventPublisher {
        return self.publisher(for: .touchUpOutside)
    }

    /// Publishes instantly when the button is touched down.
    /// - warning: This should not trigger a user action and should only be used for things like tracking.
    public var touchDownPublisher: UIControl.EventPublisher {
        return self.publisher(for: .touchDown)
    }

    /// The spark theme of the button.
    public var theme: Theme {
        get {
            return self.viewModel.theme
        }
        set {
            self.viewModel.theme = newValue
        }
    }

    /// The intent of the button.
    public var intent: ButtonIntent {
        get {
            return self.viewModel.intent
        }
        set {
            self.viewModel.intent = newValue
        }
    }

    /// The variant of the button.
    public var variant: ButtonVariant {
        get {
            return self.viewModel.variant
        }
        set {
            self.viewModel.variant = newValue
        }
    }

    /// The size of the button.
    public var size: ButtonSize {
        get {
            return self.viewModel.size
        }
        set {
            self.viewModel.size = newValue
        }
    }

    /// The shape of the button.
    public var shape: ButtonShape {
        get {
            return self.viewModel.shape
        }
        set {
            self.viewModel.shape = newValue
        }
    }

    /// A Boolean value indicating whether the button is in the enabled state.
    public override var isEnabled: Bool {
        get {
            return self.viewModel.isEnabled
        }
        set {
            super.isEnabled = newValue
            self.viewModel.isEnabled = newValue

            self.imageStateView.updateContent(from: self)
        }
    }

    /// A Boolean value indicating whether the button is in the selected state.
    public override var isSelected: Bool {
        didSet {
            self.imageStateView.updateContent(from: self)
        }
    }

    /// A Boolean value indicating whether the button draws a highlight.
    public override var isHighlighted: Bool {
        didSet {
            self.imageStateView.updateContent(from: self)
            self.viewModel.pressedAction(self.isHighlighted)
        }
    }

    /// Button modifications should be animated or not. **False** by default.
    public var isAnimated: Bool = false

    // MARK: - Internal Properties

    private let viewModel: ButtonMainViewModel

    // MARK: - Private Properties

    private var heightConstraint: NSLayoutConstraint?
    private var imageViewHeightConstraint: NSLayoutConstraint?

    @ScaledUIFrame var height: CGFloat = 0
    @ScaledUIFrame var imageHeight: CGFloat = 0

    @ScaledUIBorderRadius private var cornerRadius: CGFloat = 0
    @ScaledUIBorderWidth private var borderWidth: CGFloat = 0

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Initialization

    internal init(viewModel: ButtonMainViewModel) {
        self.viewModel = viewModel

        super.init(frame: .zero)

        // Setup
        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    /// Setup the all needed data for this view and all subviews.
    /// This method is internal because it can be overriden by the view that inherits from this class.
    internal func setupView() {
        // Accessibility
        self.accessibilityTraits = [.button]
        self.isAccessibilityElement = true
        self.scalesLargeContentImage = true
        self.showsLargeContentViewer = true
        self.addInteraction(UILargeContentViewerInteraction())
        self.minimumContentSizeCategory = .large
        self.maximumContentSizeCategory = .extraExtraExtraLarge

        // Needed values from viewModel (important for superview)
        self.height = self.viewModel.sizes?.height ?? 0

        // Setup constraints
        self.setupConstraints()

        // Setup gesture
        self.enableTouch()

        // Setup publisher subcriptions
        self.setupSubscriptions()

        // Load view model
        self.viewModel.load()
    }

    // MARK: - Layout

    public override func layoutSubviews() {
        super.layoutSubviews()

        self.updateBorderRadius()
    }

    // MARK: - Constraints

    /// Setup the constraints for this view and all subviews.
    /// This method is internal because it can be overriden by the view that inherits from this class.
    internal func setupConstraints() {
        self.setupViewConstraints()
        self.setupImageViewConstraints()
    }

    /// Setup the size constraints for this view.
    /// This method is internal because it can be overriden by the view that inherits from this class.
    internal func setupViewConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.heightConstraint = self.heightAnchor.constraint(equalToConstant: self.height)
        self.heightConstraint?.isActive = true
    }

    /// Setup the imageView constraints.
    /// This method is internal because it can be overriden by the view that inherits from this class.
    internal func setupImageViewConstraints() {
        self.imageView.translatesAutoresizingMaskIntoConstraints = false

        self.imageViewHeightConstraint = self.imageView.heightAnchor.constraint(equalToConstant: self.imageHeight)
        self.imageViewHeightConstraint?.isActive = true

        self.imageView.widthAnchor.constraint(equalTo: self.imageView.heightAnchor).isActive = true
    }

    // MARK: - Setter & Getter

    /// The image of the button for a state.
    /// - parameter state: state of the image
    public func image(for state: ControlState) -> UIImage? {
        return self.imageStateView.image(for: state)
    }

    /// Set the image of the button for a state.
    /// - parameter image: new image of the button
    /// - parameter state: state of the image
    public func setImage(_ image: UIImage?, for state: ControlState) {
        self.imageStateView.setImage(image, for: state, on: self)
    }

    // MARK: - Update UI

    private func updateBorderRadius() {
        self.setCornerRadius(self.cornerRadius)
    }

    private func updateBorderWidth() {
        self.setBorderWidth(self.borderWidth)
    }

    private func updateHeight() {
        // Reload height only if value changed
        if self.heightConstraint?.constant != self.height {
            self.heightConstraint?.constant = self.height
            self.updateConstraintsIfNeeded()
        }
    }

    private func updateImageViewHeight() {
        // Reload height only if value changed
        if self.imageViewHeightConstraint?.constant != self.imageHeight {
            self.imageViewHeightConstraint?.constant = self.imageHeight
            self.imageView.updateConstraintsIfNeeded()
        }
    }

    // MARK: - Data Did Update

    func stateDidUpdate(_ state: ButtonState) {
        // Update the user interaction enabled
        self.isUserInteractionEnabled = state.isUserInteractionEnabled
        if !state.isUserInteractionEnabled {
            self.accessibilityTraits.insert(.notEnabled)
        } else {
            self.accessibilityTraits.remove(.notEnabled)
        }

        // Animate only if new alpha is different from current alpha
        let alpha = state.opacity

        let isAnimated = self.isAnimated && self.alpha != alpha
        let animationType: UIExecuteAnimationType = isAnimated ? .animated(duration: Animation.slowDuration) : .unanimated

        UIView.execute(animationType: animationType) { [weak self] in
            self?.alpha = alpha
        }
    }

    /// UI must be update when colors are updated on ViewModel.
    /// This method is internal because it can be overriden by the view that inherits from this class.
    internal func colorsDidUpdate(_ colors: ButtonCurrentColors) {
        // Background Color
        let isAnimated = self.isAnimated && self.backgroundColor != colors.backgroundColor.uiColor
        let animationType: UIExecuteAnimationType = isAnimated ? .animated(duration: Animation.fastDuration) : .unanimated

        UIView.execute(animationType: animationType) { [weak self] in
            self?.backgroundColor = colors.backgroundColor.uiColor
        }

        // Border Color
        self.borderColorDidUpdate(from: colors)

        // Foreground Color
        self.imageView.tintColor = colors.imageTintColor.uiColor
    }

    private func borderColorDidUpdate(from colors: ButtonCurrentColors? = nil) {
        guard let colors = colors ?? self.viewModel.currentColors else {
            return
        }

        // Border Color
        self.setBorderColor(from: colors.borderColor)
    }

    /// UI must be update when image change on imageStateView.
    /// This method is internal because it can be overriden by the view that inherits from this class.
    internal func isImageOnStateViewDidUpdate(_ isImage: Bool) {
    }

    private func sizesDidUpdate(_ sizes: ButtonSizes) {
        // Height
        self.height = sizes.height
        self.updateHeight()

        // ImageView height
        self.imageHeight = sizes.imageSize
        self.updateImageViewHeight()
    }

    private func borderDidUpdate(_ border: ButtonBorder) {
        // Radius
        self.cornerRadius = border.radius
        self.updateBorderRadius()

        // Width
        self.borderWidth = border.width
        self.updateBorderWidth()
    }

    // MARK: - Subscribe

    /// Subscribe to the published properties on ViewModel.
    /// This method is internal because it can be overriden by the view that inherits from this class.
    internal func setupSubscriptions() {
        // **
        // State
        self.viewModel.$state.subscribe(in: &self.subscriptions) { [weak self] state in
            guard let self, let state else { return }

            self.stateDidUpdate(state)
        }
        // **

        // **
        // Colors
        self.viewModel.$currentColors.subscribe(in: &self.subscriptions) { [weak self] colors in
            guard let self, let colors else { return }

            self.colorsDidUpdate(colors)
        }

        // **
        // Sizes
        self.viewModel.$sizes.subscribe(in: &self.subscriptions) { [weak self] sizes in
            guard let self, let sizes else { return }

            self.sizesDidUpdate(sizes)
        }
        // **

        // **
        // Border
        self.viewModel.$border.subscribe(in: &self.subscriptions) { [weak self] border in
            guard let self, let border else { return }

            self.borderDidUpdate(border)
        }
        // **

        // **
        // Is Image ?
        self.imageStateView.$isImage.subscribe(in: &self.subscriptions) { [weak self] isImage in
            guard let self else { return }
            self.isImageOnStateViewDidUpdate(isImage)
        }

        // **
        // Image changed ?
        self.imageStateView.$imageChanged.subscribe(in: &self.subscriptions) { [weak self] _ in
            guard let self else { return }
            self.largeContentImage = self.imageStateView.image
        }
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        // Reload colors ?
        if self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            self.borderColorDidUpdate()
        }

        // Update heights
        self._height.update(traitCollection: self.traitCollection)
        self.updateHeight()
        self._imageHeight.update(traitCollection: self.traitCollection)
        self.updateImageViewHeight()

        // Corner
        self._cornerRadius.update(traitCollection: self.traitCollection)
        self.updateBorderRadius()
        self._borderWidth.update(traitCollection: self.traitCollection)
        self.updateBorderWidth()
    }
}

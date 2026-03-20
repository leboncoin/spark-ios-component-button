//
//  SparkButton.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 24/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkComponentSpinner

// TODO: Add a environement pour supprimer la règle de la hauteur et les radius (même chose coté UIKit) (used for TextField)

/// Spark Buttons are clickable elements used to trigger actions.
///
/// Buttons communicate calls to action to the user and allow users
/// to interact with pages in a variety of ways.
/// Button labels express what action will occur when the user interacts with it.
///
/// ## Example of usage
///
/// ### Text Only Button
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkButton("Click Me") {
///             // Your action
///         }
///         .sparkTheme(self.theme)
///         .sparkButtonIntent(.main)
///         .sparkButtonVariant(.filled)
///         .sparkButtonSize(.medium)
///     }
/// }
/// ```
///
/// ### Button with Icon
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkButton(
///             "Save",
///             image: Image(systemName: "checkmark")
///         ) {
///             // Your action
///         }
///         .sparkTheme(self.theme)
///         .sparkButtonIntent(.support)
///         .sparkButtonVariant(.outlined)
///         .sparkButtonSize(.medium)
///         .sparkButtonAlignment(.leadingImage)
///     }
/// }
/// ```
///
/// ### Icon Only Button
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkButton(Image(systemName: "heart.fill")) {
///             // Your action
///         }
///         .sparkTheme(self.theme)
///         .sparkButtonIntent(.support)
///         .sparkButtonVariant(.ghost)
///         .sparkButtonSize(.small)
///     }
/// }
/// ```
///
/// ### Custom Label Button
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkButton(action: {
///             // Your action
///         }) {
///             VStack {
///                 Text("Custom")
///                 Text("Label")
///             }
///         }
///         .sparkTheme(self.theme)
///         .sparkButtonIntent(.main)
///         .sparkButtonVariant(.tinted)
///         .sparkButtonSize(.large)
///     }
/// }
/// ```
///
/// ### Loading State
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State private var isLoading = false
///
///     var body: some View {
///         SparkButton("Submit") {
///             self.isLoading = true
///             // Perform async operation
///         }
///         .sparkTheme(self.theme)
///         .sparkButtonIntent(.main)
///         .sparkButtonVariant(.filled)
///         .sparkButtonIsLoading(self.isLoading)
///     }
/// }
/// ```
///
/// ### Full width State
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State private var isLoading = false
///
///     var body: some View {
///         SparkButton("Share") {
///             // Your action
///          }
///         .sparkTheme(self.theme)
///         .sparkButtonIsInfiniteWidth(true)
///     }
/// }
/// ```
///
/// ## EnvironmentValues
///
/// This component uses some EnvironmentValues:
/// - **theme**: ``sparkTheme(_:)`` (View extension)
/// - **intent**: ``sparkButtonIntent(_:)`` (View extension)
/// - **variant**: ``sparkButtonVariant(_:)`` (View extension)
/// - **size**: ``sparkButtonSize(_:)`` (View extension)
/// - **alignment**: ``sparkButtonAlignment(_:)`` (View extension)
/// - **contentVisibility**: ``sparkButtonContentVisibility(_:)`` (View extension)
/// - **isLoading**: ``sparkButtonIsLoading(_:)`` (View extension)
/// - **isInfiniteWidth**: ``sparkButtonIsInfiniteWidth(_:)`` (View extension)
///
/// > If these values are not set, default values will be applied.
///
/// > **YOU MUST PROVIDE ``sparkTheme(_:)``**
///
/// ## Accessibility
///
/// SparkButton automatically supports:
/// - VoiceOver with proper button traits
/// - Dynamic Type up to xxxLarge
/// - Large Content Viewer for accessibility
/// - Haptic feedback on button press
///
/// If you only provide a image, you must set the **accessibilityLabel**.
///
/// ## Rendering
///
/// ### Title
///
/// ![Button rendering.](button_title.png)
///
/// ### Icon only
///
/// ![Button rendering.](button_icon.png)
///
/// ### All content (image + title)
///
/// ![Button rendering.](button_all.png)
///
public struct SparkButton<Label, ImageLabel>: View where Label: View, ImageLabel: View {

    // MARK: - Properties

    private var image: () -> ImageLabel
    private var label: () -> Label
    private var role: ButtonRole?
    private var action: () -> Void

    @Environment(\.theme) private var theme
    @Environment(\.buttonAlignment) private var alignment
    @Environment(\.buttonContentVisibility) private var contentVisibility
    @Environment(\.buttonIntent) private var intent
    @Environment(\.buttonIsLoading) private var isLoading
    @Environment(\.buttonIsInfiniteWidth) private var isInfiniteWidth
    @Environment(\.buttonSize) private var size
    @Environment(\.buttonVariant) private var variant
    @Environment(\.isSelected) private var isSelected
    @Environment(\.isEnabled) private var isEnabled

    private let type: ButtonType

    @StateObject private var viewModel = ButtonViewModel()

    @State private var feedbackID: UUID = UUID()

    // MARK: - Initialization

    init(
        type: ButtonType,
        role: ButtonRole? = nil,
        action: @escaping @MainActor () -> Void,
        label: @escaping () -> Label,
        image: @escaping () -> ImageLabel
    ) {
        self.type = type
        self.role = role
        self.action = action
        self.label = label
        self.image = image
    }

    // MARK: - View

    public var body: some View {
        Button(role: self.role, action: {
            self.action()
            self.feedbackID = .init()
        }) {
            SparkHStack(spacing: self.viewModel.layout.horizontalSpacing) {
                // Loading
                if self.isLoading {
                    SparkSpinner()
                        .sparkSpinnerSize(.onButton)
                        .sparkSpinnerIntent(.custom(self.viewModel.colors.tintColor))
                }

                // Content
                if self.viewModel.showContent {
                     self.content()
                }
            }
            .sparkPadding(.horizontal, self.viewModel.layout.horizontalPadding)
            .sparkFrame(
                width: self.viewModel.sizes.isFixedWidth ? self.viewModel.sizes.height : nil,
                height: self.viewModel.sizes.height
            )
            .sparkFrame(minWidth: self.viewModel.sizes.height)
            .frame(maxWidth: self.isInfiniteWidth ? .infinity : nil)
            .background(self.viewModel.colors.backgroundColor)
            .contentShape(Rectangle())
            .sparkBorder(
                width: self.viewModel.border.width,
                radius: self.viewModel.border.radius,
                colorToken: self.viewModel.colors.borderColor
            )
        }
        .buttonStyle(PressedButtonStyle(
            isPressed: self.$viewModel.isPressed
        ))
        .opacity(self.viewModel.dim)
        .sparkSensoryFeedback(.impact, trigger: self.feedbackID)
        .accessibilityIdentifier(ButtonAccessibilityIdentifier.button)
        .accessibilityShowsLargeContentViewer() {
            self.image()
            self.label()
        }
        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
        .onAppear() {
            self.viewModel.setup(
                theme: self.theme.value,
                intent: self.intent,
                variant: self.variant,
                size: self.size,
                type: self.type,
                contentVisibility: self.contentVisibility,
                isEnabled: self.isEnabled,
                isLoading: self.isLoading
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = theme.value
        }
        .onChange(of: self.intent) { intent in
            self.viewModel.intent = intent
        }
        .onChange(of: self.variant) { variant in
            self.viewModel.variant = variant
        }
        .onChange(of: self.size) { size in
            self.viewModel.size = size
        }
        .onChange(of: self.type) { type in
            self.viewModel.type = type
        }
        .onChange(of: self.contentVisibility) { contentVisibility in
            self.viewModel.contentVisibility = contentVisibility
        }
        .onChange(of: self.isEnabled) { isEnabled in
            self.viewModel.isEnabled = isEnabled
        }
    }

    @ViewBuilder
    private func content() -> some View {
        let image = self.image()
            .sparkFrame(
                size: self.viewModel.sizes.imageSize,
                alignment: .center
            )
            .foregroundStyle(self.viewModel.colors.tintColor)

        let label = self.label()
            .foregroundStyle(self.viewModel.colors.tintColor)
            .font(self.viewModel.titleFontToken)
            .transition(
                .move(edge: self.alignment.isTrailingImage ? .trailing : .leading)
                .combined(with: .opacity)
            )
            .fixedSize()

        // Display the content from the current visibility
        // and the position.
        if self.alignment.isTrailingImage {
            if self.contentVisibility.showLabel {
                label
            }

            if self.contentVisibility.showImage {
                image
            }

        } else {
            if self.contentVisibility.showImage {
                image
            }

            if self.contentVisibility.showLabel {
                label
            }
        }
    }
}

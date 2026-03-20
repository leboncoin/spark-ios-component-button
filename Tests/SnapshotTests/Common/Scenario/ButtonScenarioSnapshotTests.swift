//
//  ButtonScenarioSnapshotTests.swift
//  SparkComponentButtonSnapshotTests
//
//  Created by robin.lemaire on 17/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheme
import UIKit
import SwiftUI

enum ButtonScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case test5
    case test6
    case test7
    case test8
    case test9
    case documentation

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    var isDocumentation: Bool {
        self == .documentation
    }

    // MARK: - Configurations

    func configuration() -> [ButtonConfigurationSnapshotTests] {
        switch self {
        case .test1:
            return self.test1()
        case .test2:
            return self.test2()
        case .test3:
            return self.test3()
        case .test4:
            return self.test4()
        case .test5:
            return self.test5()
        case .test6:
            return self.test6()
        case .test7:
            return self.test7()
        case .test8:
            return self.test8()
        case .test9:
            return self.test9()
        case .documentation:
            return self.documentation()
        }
    }

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description: To test all intents
    ///
    /// Content:
    ///  - intents: all
    ///  - variant: default
    ///  - size: default
    ///  - alignment: default
    ///  - contentType: default
    ///  - content default
    ///  - mode: all
    private func test1() -> [ButtonConfigurationSnapshotTests] {
        let intents = ButtonIntent.allCases

        return intents.map { intent in
            .init(
                scenario: self,
                intent: intent,
                modes: Constants.Modes.all
            )
        }
    }

    /// Test 2
    ///
    /// Description: To test all variants
    ///
    /// Content:
    ///  - intents: default
    ///  - variant: all
    ///  - size: default
    ///  - alignment: default
    ///  - contentType: default
    ///  - content default
    ///  - mode: default
    private func test2() -> [ButtonConfigurationSnapshotTests] {
        let variants = ButtonVariant.allCases

        return variants.map { variant in
            .init(
                scenario: self,
                variant: variant
            )
        }
    }

    /// Test 3
    ///
    /// Description: To test all sizes
    ///
    /// Content:
    ///  - intents: default
    ///  - variant: default
    ///  - size: all
    ///  - alignment: default
    ///  - contentType: default
    ///  - content default
    ///  - mode: default
    private func test3() -> [ButtonConfigurationSnapshotTests] {
        let sizes = ButtonSize.allCases

        return sizes.map { size in
            .init(
                scenario: self,
                size: size
            )
        }
    }

    /// Test 4
    ///
    /// Description: To test all alignments
    ///
    /// Content:
    ///  - intents: default
    ///  - variant: default
    ///  - size: default
    ///  - alignment: all
    ///  - content all
    ///  - mode: default
    private func test4() -> [ButtonConfigurationSnapshotTests] {
        let alignments = ButtonAlignment.allCases

        return alignments.map { alignment in
            .init(
                scenario: self,
                alignment: alignment
            )
        }
    }

    /// Test 5
    ///
    /// Description: To test all contents
    ///
    /// Content:
    ///  - intents: default
    ///  - variant: default
    ///  - size: default
    ///  - alignment: default
    ///  - contentType: all
    ///  - content all
    ///  - mode: default
    private func test5() -> [ButtonConfigurationSnapshotTests] {
        let titleContentTypes = ButtonContentType.allCases
        let iconContentTypes = ButtonContentType.allCases

        return titleContentTypes.flatMap { titleContentType in
            iconContentTypes.compactMap { iconContentType in
                guard !(titleContentType == .none && iconContentType == .none) else {
                    return nil
                }

                return .init(
                    scenario: self,
                    titleType: titleContentType,
                    iconType: iconContentType
                )
            }
        }
    }

    /// Test 6
    ///
    /// Description: To test all content visibility
    ///
    /// Content:
    ///  - intents: default
    ///  - variant: default
    ///  - size: default
    ///  - alignment: default
    ///  - contentType: default
    ///  - content all
    ///  - contentVisibility: all
    ///  - mode: default
    private func test6() -> [ButtonConfigurationSnapshotTests] {
        let contentVisibilities = ButtonContentVisibility.allCases

        return contentVisibilities.map { contentVisibility in
            .init(
                scenario: self,
                contentVisibility: contentVisibility
            )
        }
    }

    /// Test 7
    ///
    /// Description: To test infinite width
    ///
    /// Content:
    ///  - intents: default
    ///  - variant: default
    ///  - size: default
    ///  - alignment: default
    ///  - contentType: default
    ///  - content default
    ///  - isInfiniteWidth: true and false
    ///  - mode: default
    private func test7() -> [ButtonConfigurationSnapshotTests] {
        let isInfiniteWidths = Bool.allCases

        return isInfiniteWidths.map { isInfiniteWidth in
            .init(
                scenario: self,
                isInfiniteWidth: isInfiniteWidth
            )
        }
    }

    /// Test 8
    ///
    /// Description: To test disabled state
    ///
    /// Content:
    ///  - intents: default
    ///  - variant: default
    ///  - size: default
    ///  - alignment: default
    ///  - contentType: default
    ///  - content default
    ///  - isDisabled: true
    ///  - mode: default
    private func test8() -> [ButtonConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                isDisabled: true
            )
        ]
    }

    /// Test 9
    ///
    /// Description: To test a11y sizes
    ///
    /// Content:
    ///  - intents: default
    ///  - variant: default
    ///  - size: default
    ///  - alignment: default
    ///  - contentType: default
    ///  - content default
    ///  - mode: default
    ///  - size: all
    private func test9() -> [ButtonConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                sizes: Constants.Sizes.all
            )
        ]
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [ButtonConfigurationSnapshotTests] {
        var items: [ButtonConfigurationSnapshotTests] = []

        // Only icon
        items.append(.init(
            scenario: self,
            titleType: .none,
            documentationName: "icon"
        ))

        // Only title
        items.append(.init(
            scenario: self,
            iconType: .none,
            documentationName: "title"
        ))

        // All
        items.append(.init(
            scenario: self,
            documentationName: "all"
        ))

        return items
    }
}

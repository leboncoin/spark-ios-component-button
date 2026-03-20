//
//  ButtonIsInfiniteWidthEnvironmentValues.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 13/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var buttonIsInfiniteWidth: Bool = false
}

public extension View {

    /// Set the **max width to infinity** on the Button if the value is true.
    /// Do nothing either.
    ///
    /// The default value for this property is *false*.
    func sparkButtonIsInfiniteWidth(_ isInfiniteWidth: Bool) -> some View {
        self.environment(\.buttonIsInfiniteWidth, isInfiniteWidth)
    }
}

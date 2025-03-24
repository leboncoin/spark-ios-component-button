//
//  ButtonGetVariantUseCaseable.swift
//  SparkButtonTests
//
//  Created by janniklas.freundt.ext on 16.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ButtonGetVariantUseCaseable {
    // sourcery: colors = "Identical", dims = "Identical"
    func execute(intent: ButtonIntent, colors: Colors, dims: Dims) -> ButtonColors
}

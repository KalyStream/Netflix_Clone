//
//  Extensions.swift
//  Netflix_Clone
//
//  Created by Kalybay Zhalgasbay on 20.04.2022.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased()+self.lowercased().dropFirst()
    }
}

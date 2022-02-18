//
//  Extension+String.swift
//  8BallWithoutActualBall
//
//  Created by pioner on 16.01.2022.
//

import Foundation

extension String {
    
    var urlEncoded: String? {
        return addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: ":=\"#%/<>?@\\^`{|} ").inverted)
    }
    
}

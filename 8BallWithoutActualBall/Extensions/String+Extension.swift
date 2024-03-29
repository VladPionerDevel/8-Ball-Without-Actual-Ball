//
//  Extension+String.swift
//  8BallWithoutActualBall
//
//  Created by pioner on 16.01.2022.
//

import Foundation

extension String {
    
    var urlEncode: String? {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: ":=\"#%/<>?@\\^`{|} ").inverted)
    }
    
}

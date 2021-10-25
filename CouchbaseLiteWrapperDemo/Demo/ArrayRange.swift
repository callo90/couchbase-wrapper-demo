//
//  ArrayRange.swift
//  MudflapCore
//
//  Created by Carlos Lopez Reales on 1/3/17.
//  Copyright © 2017 Koombea. All rights reserved.
//

import Foundation

public extension Array {
    
    subscript(safeIndex index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    func element(at index: Int) -> Element? {
        guard index >= 0 && index < count else { return nil }
        return self[index]
    }
    
    mutating func removeElement(at index: Int) {
        guard index >= 0 && index < count else { return }
        self.remove(at: index)
    }
    
    mutating func replaceElement(_ element: Element, at index: Int) {
        guard index >= 0 && index < count else { return }
        self[index] = element
    }
    
    func element(from range: CountableClosedRange<Int>) -> [Element] {
        var newRange = range
        if range.lowerBound < count && range.lowerBound < range.upperBound {
            if range.upperBound > count - 1 {
                newRange = newRange.lowerBound...(count - 1)
            }
            return self[newRange].compactMap{$0}
        }
        return []
    }
}

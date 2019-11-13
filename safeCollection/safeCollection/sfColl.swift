//
//  sfColl.swift
//  safeCollection
//
//  Created by Арсений Ермилов   on 13/11/2019.
//  Copyright © 2019 ArsIndustries. All rights reserved.
//


import UIKit
public class sfColl : NSObject {
    var arrNumbers : [Int] = []
    let isolationQueue = DispatchQueue(label:"myQueue",attributes:.concurrent)
    public func add(number : Int){
        isolationQueue.async(flags: .barrier){
            self.arrNumbers.append(number)
        }
    }
    public func delete(position : Int){
        if self.arrNumbers.isEmpty {
            return
        }
        if position >= self.arrNumbers.count {
            return
        }
        isolationQueue.async(flags: .barrier){
            self.arrNumbers.remove(at: position)
        }
    }
    public func printArr(){
        
        for  a in self.arrNumbers {
            print(a)
        }
    }
}




//
//  InputSourceDetector.swift
//  IS
//
//  Created by Jaeyoung Choi on 2020/05/29.
//  Copyright © 2020 Jaeyoung. All rights reserved.
//

import Foundation
import Carbon

public class InputSourceDetector {
    public init() {}
    
    public var currentInputSource: TISInputSource {
        TISCopyCurrentKeyboardInputSource().takeRetainedValue()
    }
    
    private var inputSourceObserveHandler: ((TISInputSource) -> Void)?
    
    public func observeChangeInputSource(handler: @escaping (TISInputSource) -> Void) {
        inputSourceObserveHandler = handler

        DistributedNotificationCenter.default().addObserver(self, selector: #selector(reloadAuto(_:)), name: kTISNotifySelectedKeyboardInputSourceChanged.notificationName, object: nil)
    }
    
    @objc func reloadAuto(_ notification: Notification) {
        inputSourceObserveHandler?(currentInputSource)
    }
}

public extension String {
    var notificationName: NSNotification.Name {
        NSNotification.Name.init(self)
    }
}

public extension CFString {
    var notificationName: NSNotification.Name {
        (self as String).notificationName
    }
}

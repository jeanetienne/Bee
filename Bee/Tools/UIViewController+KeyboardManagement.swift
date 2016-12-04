//
//  UIViewController+KeyboardManagement.swift
//  Copyright © 2016 Jean-Étienne. All rights reserved.
//

import UIKit

extension UIViewController {

    static func observeKeyboardWillShowNotification(completion: @escaping (Notification) -> ()) {
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow,
                                               object: nil,
                                               queue: nil,
                                               using: completion)
    }

    static func observeKeyboardWillHideNotification(completion: @escaping (Notification) -> ()) {
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide,
                                               object: nil,
                                               queue: nil,
                                               using: completion)
    }

    static func handleKeyboardWillShow(withNotification notification: Notification, onScrollView scrollView: UIScrollView) {
        if let info = notification.userInfo {
            let keyboardSizeDictionary = info[UIKeyboardFrameBeginUserInfoKey] as! NSValue
            let keyboardSize = keyboardSizeDictionary.cgRectValue.size
            let animationDurationNumber = info[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
            let animationDuration = animationDurationNumber.doubleValue as TimeInterval
            let animationOptionsNumber = info[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
            let animationOptions = UIViewAnimationOptions(rawValue: animationOptionsNumber.uintValue)

            var contentInset = UIEdgeInsets.zero
            contentInset.bottom += keyboardSize.height

            UIView.animate(withDuration: animationDuration,
                           delay: 0,
                           options: animationOptions,
                           animations: { 
                            scrollView.contentInset = contentInset
                            scrollView.scrollIndicatorInsets = contentInset
            },
                           completion: nil)
        }
    }

    static func handleKeyboardWillHide(withNotification notification: Notification, onScrollView scrollView: UIScrollView) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

}

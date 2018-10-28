//
//  CardAnimator.swift
//  CardPresentationController
//
//  Copyright © 2018 Aleksandar Vacić, Radiant Tap
//  MIT License · http://choosealicense.com/licenses/mit/
//

import UIKit

final class CardAnimator: NSObject, UIViewControllerAnimatedTransitioning {

	func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
		return 0.3
	}

	func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
	}
}





private extension UIViewControllerContextTransitioning {
	var fromContentController: UIViewController? {
		guard let topVC = viewController(forKey: .from) else { return nil }
		return recognize(topVC)
	}

	var toContentController: UIViewController? {
		guard let topVC = viewController(forKey: .to) else { return nil }
		return recognize(topVC)
	}

	func recognize(_ vc: UIViewController) -> UIViewController? {
		switch vc {
		case let nc as UINavigationController:
			return nc.topViewController

		case let tbc as UITabBarController:
			guard let vc = tbc.selectedViewController else { return tbc }
			return recognize(vc)

		default:
			return vc
		}
	}
}
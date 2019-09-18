//
// Created by Young Mo Kang on 9/17/19.
// Copyright (c) 2019 unixnme. All rights reserved.
//

import UIKit

class RatingControl {

    static let BUTTON_HEIGHT: CGFloat = 44.0
    static let BUTTON_WIDTH: CGFloat = 44.0
    static let spacing: CGFloat = 8

    private var ratingButtons = [UIButton]()
    var rating = 0

    func setupButtons(view: UIView, leftAnchor: NSLayoutXAxisAnchor, topAnchor: NSLayoutYAxisAnchor) {
        var left = leftAnchor
        var offset: CGFloat = 0
        for _ in 0..<5 {
            let button = UIButton()
            button.backgroundColor = .red
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)

            NSLayoutConstraint.activate([
                button.leftAnchor.constraint(equalTo: left, constant: offset),
                button.topAnchor.constraint(equalTo: topAnchor, constant: RatingControl.spacing),
                button.heightAnchor.constraint(equalToConstant: RatingControl.BUTTON_HEIGHT),
                button.widthAnchor.constraint(equalToConstant: RatingControl.BUTTON_WIDTH)
            ])
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            ratingButtons.append(button)
            left = button.rightAnchor
            offset = RatingControl.spacing
        }
    }

    @objc private func ratingButtonTapped(button: UIButton) {
        print("Button pressed!")
    }
}

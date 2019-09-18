//
// Created by Young Mo Kang on 9/17/19.
// Copyright (c) 2019 unixnme. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

    static let BUTTON_HEIGHT: CGFloat = 44.0
    static let BUTTON_WIDTH: CGFloat = 44.0



    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedSetup()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        sharedSetup()
    }

    private func sharedSetup() {
        axis = .horizontal
        setupButtons()
    }

    private func setupButtons() {
        let button = UIButton()
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: RatingControl.BUTTON_HEIGHT),
            button.widthAnchor.constraint(equalToConstant: RatingControl.BUTTON_WIDTH)
        ])

        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        addSubview(button)
    }

    @objc private func ratingButtonTapped(button: UIButton) {
        print("Button pressed!")
    }
}

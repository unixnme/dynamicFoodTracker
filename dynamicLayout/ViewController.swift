//
//  ViewController.swift
//  dynamicLayout
//
//  Created by Young Mo Kang on 9/16/19.
//  Copyright © 2019 unixnme. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    let spacing: CGFloat = 16

    let mealTextView: UITextView = {
        let mealTextView = UITextView()
        mealTextView.text = "Meal Name"
        mealTextView.font = .boldSystemFont(ofSize: 15)
        mealTextView.isEditable = false
        mealTextView.isScrollEnabled = false
        mealTextView.translatesAutoresizingMaskIntoConstraints = false
        return mealTextView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mealTextView)

        positionViews()

    }

    func positionViews() {
        NSLayoutConstraint.activate([
            mealTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: spacing),
            mealTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: spacing),
            mealTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -spacing),
            mealTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -spacing)
        ])
    }

}

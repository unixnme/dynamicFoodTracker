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
        mealTextView.textAlignment = .left
        mealTextView.isEditable = false
        mealTextView.isScrollEnabled = false
        mealTextView.translatesAutoresizingMaskIntoConstraints = false
        return mealTextView
    }()

    let mealTextField: UITextField = {
        let mealTextField = UITextField()
        mealTextField.placeholder = "Enter meal name"
        mealTextField.font = .systemFont(ofSize: 15)
        mealTextField.textAlignment = .left
        mealTextField.returnKeyType = .done
        mealTextField.translatesAutoresizingMaskIntoConstraints = false
        return mealTextField
    }()

    let mealImageView: UIButton = {
        let mealImageView = UIButton()
        mealImageView.setImage(#imageLiteral(resourceName: "defaultPhoto.png"), for: .normal)
        mealImageView.translatesAutoresizingMaskIntoConstraints = false
        return mealImageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mealTextView)
        view.addSubview(mealTextField)
        view.addSubview(mealImageView)

//        mealTextField.backgroundColor = .red
//        mealTextView.backgroundColor = .blue
        positionViews()

    }

    func positionViews() {
        NSLayoutConstraint.activate([
            mealTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: spacing),
            mealTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: spacing),
            mealTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -spacing),
            mealTextView.heightAnchor.constraint(equalToConstant: 30)
        ])

        NSLayoutConstraint.activate([
            mealTextField.topAnchor.constraint(equalTo: mealTextView.bottomAnchor, constant: spacing),
            mealTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: spacing),
            mealTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -spacing),
            mealTextField.heightAnchor.constraint(equalToConstant: 30)
        ])

        NSLayoutConstraint.activate([
            mealImageView.topAnchor.constraint(equalTo: mealTextField.bottomAnchor, constant: spacing),
            mealImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: spacing),
            mealImageView.widthAnchor.constraint(equalToConstant: 240),
            mealImageView.heightAnchor.constraint(equalToConstant: 240)
        ])
    }

}

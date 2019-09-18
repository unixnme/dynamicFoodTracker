//
//  ViewController.swift
//  dynamicLayout
//
//  Created by Young Mo Kang on 9/16/19.
//  Copyright © 2019 unixnme. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

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
        mealImageView.addTarget(self, action: #selector(imageClicked(_:)), for: .touchUpInside)
        return mealImageView
    }()

    let ratingControl: RatingControl = {
        let ratingControl = RatingControl()
        ratingControl.translatesAutoresizingMaskIntoConstraints = false
        return ratingControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mealTextView)
        view.addSubview(mealTextField)
        view.addSubview(mealImageView)
        view.addSubview(ratingControl)
        mealTextField.delegate = self

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

        NSLayoutConstraint.activate([
            ratingControl.topAnchor.constraint(equalTo: mealImageView.bottomAnchor, constant: spacing),
            ratingControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: spacing),
            ratingControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -spacing),
            ratingControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -spacing)
        ])
    }

    @objc func imageClicked(_ sender: UIButton) {
        self.mealTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        mealImageView.setImage(selectedImage, for: .normal)
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mealTextField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        mealTextView.text = mealTextField.text
    }
}

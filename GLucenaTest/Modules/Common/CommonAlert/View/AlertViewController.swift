//
//  AlertViewController.swift
//  GLucenaTest
//
//  Created by Graciela on 27/09/2020.
//  Copyright © 2020 Graciela. All rights reserved.
//

import UIKit

enum ActionType {
    case ok
    case ko
}

protocol AlertViewProtocol: BaseViewProtocol {
    func configureView(title: String?, description: String?)
    func configureButtons(okButtonTitle: String?, koButtonTitle: String?)
    func applyBackgroundColor()
    func hideNavigationBar()
}

class AlertViewController: BaseViewController {
    // -------------------------------------
    // MARK: Section - Properties
    // -------------------------------------
    var presenter: AlertPresenterProtocol!

    // -------------------------------------
    // MARK: Section - IBOutlets
    // -------------------------------------
    @IBOutlet weak var alertContainerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var koButton: UIButton!

    // -------------------------------------
    // MARK: Section - View Life-Cycle Methods
    // -------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setUpView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }

    // -------------------------------------
    // MARK: Section - IBActions
    // -------------------------------------
    @IBAction func didTapTopButton(_ sender: Any) {
        presenter.didTapButton(ActionType.ok)
    }

    @IBAction func didTapBottomButton(_ sender: Any) {
        presenter.didTapButton(ActionType.ko)
    }

    // -------------------------------------
    // MARK: Section - Private Methods
    // -------------------------------------
    private func setUpView() {
        alertContainerView.clipsToBounds = true
        alertContainerView.layer.cornerRadius = 4
    }
}

// MARK: Extension - CustomAlertViewProtocol
extension AlertViewController: AlertViewProtocol {
    func configureView(title: String?, description: String?) {
        titleLabel.text = title
        descriptionLabel.text = description
    }

    func configureButtons(okButtonTitle: String? = nil, koButtonTitle: String? = nil) {
        if let okButtonTitle = okButtonTitle {
            okButton.setTitle(okButtonTitle, for: .normal)
        } else {
            okButton.removeFromSuperview()
        }
        if let koButtonTitle = koButtonTitle {
            koButton.setTitle(koButtonTitle, for: .normal)
        } else {
            koButton.removeFromSuperview()
        }
    }

    func applyBackgroundColor() {
        UIView.animate(withDuration: 0.5, animations: {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        })
    }

    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

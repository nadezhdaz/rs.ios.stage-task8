//
//  DrawingsViewController.swift
//  RSSchool_T8
//
//  Created by Надежда Зенкова on 20.07.2021.
//

import UIKit

class DrawingsViewController: UIViewController {
    var stackView: UIStackView!
    let edgeInsets = UIEdgeInsets(top: 9.0, left: 47.0, bottom: 9.0, right: 47.0)
    var planetButton: OpenButton  = {
        let button = OpenButton()
        button.setTitle("Planet", for: .normal)
        button.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
        return button
    }()
    var headButton: OpenButton  = {
        let button = OpenButton()
        button.setTitle("Head", for: .normal)
        button.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
        return button
    }()
    var treeButton: OpenButton  = {
        let button = OpenButton()
        button.setTitle("Tree", for: .normal)
        button.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
        return button
    }()
    var landscapeButton: OpenButton  = {
        let button = OpenButton()
        button.setTitle("Landscape", for: .normal)
        button.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
        return button
    }()
    
    var buttons: [OpenButton]!
    
    @objc var delegate: DrawingViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        self.setupView();
        self.buttons = [planetButton, headButton, treeButton, landscapeButton]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupButtons()
    }
    
    @objc func handleButton(_ sender: OpenButton) {
        guard let buttonIndex = buttons.firstIndex(of: sender) else { return }
        self.delegate?.setImagePattern?(buttonIndex)
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setCurrentBorderForButton(_ sender: OpenButton, _ selected: Bool) {
        if (selected) {
            sender.layer.borderColor = UIColor.colorLightGreenSea().cgColor;
            sender.layer.shadowColor = UIColor.colorLightGreenSea().cgColor;
            sender.layer.shadowRadius = 2.0;
        }
        else {
            sender.layer.borderColor =  UIColor.colorPale().cgColor;
            sender.layer.shadowColor = UIColor.colorPale().cgColor;
            sender.layer.shadowRadius = 1.0;
        }
    }
    
    /*@objc */private func setupButtons() {
        for index in 0..<buttons.count {
            if index == self.delegate?.pattern {
                setCurrentBorderForButton(buttons[index], true)
            } else {
                setCurrentBorderForButton(buttons[index], false)
            }
        }
    }
    
    func setupView() {
        view.backgroundColor = UIColor.white
        navigationItem.title = "Drawings";
                
        stackView = UIStackView(frame: CGRect(x: 200, y: 50, width: 200, height: 205))
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15.0
        stackView.addArrangedSubview(planetButton)
        stackView.addArrangedSubview(headButton)
        stackView.addArrangedSubview(treeButton)
        stackView.addArrangedSubview(landscapeButton)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50.0),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200.0)
        ])
    }
}

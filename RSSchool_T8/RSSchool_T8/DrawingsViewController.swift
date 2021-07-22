//
//  DrawingsViewController.swift
//  RSSchool_T8
//
//  Created by Надежда Зенкова on 20.07.2021.
//

import UIKit

class DrawingsViewController: UIViewController {
    @IBOutlet weak var planetButton: OpenButton!
    @IBOutlet weak var headButton: OpenButton!
    @IBOutlet weak var treeButton: OpenButton!
    @IBOutlet weak var landscapeButton: OpenButton!
    
    var selectedButton: OpenButton?
    //var buttonsDictionary: Dictionary<Int, OpenButton>
    
    @objc var delegate: DrawingViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedButton?.isSelected = true
        self.view.backgroundColor = UIColor.white;
        self.setup();
        //self.buttonsDictionary = [0:planetButton, 1:headButton, 2:treeButton, 3:landscapeButton]
    }
    
    func setup() {
        self.navigationItem.title = "Drawings";
    }
    
    @IBAction func planetButtonTapped(_ sender: OpenButton) {
        self.selectedButton = sender
        self.delegate?.setImagePattern?(0)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func headButtonTapped(_ sender: OpenButton) {
        self.selectedButton = sender
        self.delegate?.setImagePattern?(1)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func treeButtonTapped(_ sender: OpenButton) {
        self.selectedButton = sender
        self.delegate?.setImagePattern?(2)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func landscapeButtonTapped(_ sender: OpenButton) {
        self.selectedButton = sender
        self.delegate?.setImagePattern?(3)
        self.navigationController?.popViewController(animated: true)
    }
}

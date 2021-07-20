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
    
    var selectedButton: UIButton?
    @objc var canvasView: CanvasView = CanvasView();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.selectedButton = headButton
        self.view.backgroundColor = UIColor.white;
        self.setup();
    }
    
    func setup() {
        self.navigationItem.title = "Drawings";
    }
    
    @IBAction func planetButtonTapped(_ sender: Any) {
        self.selectedButton = planetButton
        self.canvasView.pattern = 0
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func headButtonTapped(_ sender: Any) {
        self.selectedButton = planetButton
        self.canvasView.pattern = 1
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func treeButtonTapped(_ sender: Any) {
        self.selectedButton = planetButton
        self.canvasView.pattern = 2
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func landscapeButtonTapped(_ sender: Any) {
        self.selectedButton = planetButton
        self.canvasView.pattern = 3
        self.navigationController?.popViewController(animated: true)
    }
}

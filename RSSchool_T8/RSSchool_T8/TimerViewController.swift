//
//  TimerViewController.swift
//  RSSchool_T8
//
//  Created by Надежда Зенкова on 19.07.2021.
//

import UIKit

class TimerViewController: UIViewController {
    
    var slider: UISlider?
    var saveButton = OpenButton(frame: CGRect(x: 250, y: 20, width: 85, height: 32))
    var currentValue: Float = 1.00
    var currentValueLabel = UILabel(frame: CGRect(x: 162, y: 161, width: 54, height: 22));
    
    @objc var timer = Timer();
    @objc var delegate: TimerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSlider()
        self.setupView()
        self.setupButton()
    }
    
    func setupSlider() {
        slider = UISlider(frame: CGRect(x: 74, y: 112, width: 223, height: 28))
        if (slider != nil) {
            slider!.value = 1
            slider!.isContinuous = true
            slider!.minimumValue = 1.0;
            slider!.maximumValue = 5.0;
            slider!.tintColor = UIColor.colorLightGreenSea();
            slider!.addTarget(self, action: #selector(self.sliderValueChanged), for: .valueChanged);
            
            let minimumTimeLabel: UILabel = UILabel(frame: CGRect(x: 26, y: 103, width: 7, height: 22));
            let maximumTimeLabel: UILabel = UILabel(frame: CGRect(x: 338, y: 103, width: 11, height: 22));
            minimumTimeLabel.text = "\(self.slider!.minimumValue)";
            maximumTimeLabel.text = "\(self.slider!.maximumValue)";
            maximumTimeLabel.font = UIFont(name: "Montserrat-Regular", size: 18)
            minimumTimeLabel.font = UIFont(name: "Montserrat-Regular", size: 18)
            self.currentValueLabel.text = String(format: "%.02f s", slider!.value)
            self.currentValueLabel.font = UIFont(name: "Montserrat-Regular", size: 18)
            
            self.view.addSubview(slider!);
            self.view.addSubview(minimumTimeLabel);
            self.view.addSubview(maximumTimeLabel);
            self.view.addSubview(self.currentValueLabel)
        }
    }
    
    @objc func setupView() {
        self.view.backgroundColor = .white
        self.view.layer.cornerRadius = 40
        self.view.layer.shadowColor = UIColor.colorPale().cgColor
        self.view.layer.shadowRadius = 4.0
        self.view.layer.shadowOffset = CGSize.zero;
        self.view.layer.shadowOpacity = 1.0
        self.view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    @objc func setupButton() {
        self.saveButton.setTitle("Save", for: .normal)
        saveButton.widthAnchor.constraint(equalToConstant: 85).isActive = true
        self.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        self.view.addSubview(self.saveButton)
    }
    
    @objc func saveButtonTapped() {
        delegate?.setTimeForTimer?(currentValue)
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
    @objc func sliderValueChanged(_ sender:UISlider!) {
        currentValueLabel.font = UIFont(name: "Montserrat-Regular", size: 18.0);
        currentValueLabel.text = String(format: "%.02f s", sender.value);
        currentValueLabel.textAlignment = .center;
        currentValue = sender.value
    }
}

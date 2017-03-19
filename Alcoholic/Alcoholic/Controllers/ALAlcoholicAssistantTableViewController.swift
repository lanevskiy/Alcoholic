//
//  ALAlcoholicAssistantTableViewController.swift
//  Alcoholic
//
//  Created by Admin on 19/03/2017.
//  Copyright © 2017 home. All rights reserved.
//

import UIKit

class ALAlcoholicAssistantTableViewController: UITableViewController {
    
    @IBOutlet weak var intoxicationImageView: UIImageView!
    @IBOutlet weak var menCountTextField: UITextField!
    @IBOutlet weak var womenCountTextField: UITextField!
    @IBOutlet weak var intoxicationStageSegmentedControl: UISegmentedControl!
    
    private var menCount : Int {
        get {
            return Int(menCountTextField.text!)!
        }
    }
    
    private var womenCount : Int {
        get {
            return Int(womenCountTextField.text!)!
        }
    }
    
    private var intoxicationStage : IntoxicationStage {
        get {
            return IntoxicationStage(rawValue: Int(intoxicationStageSegmentedControl.selectedSegmentIndex))!
        }
    }
    
    private lazy var images : [UIImage] = {
        var imageArray = [UIImage]()
        let greenImage = UIImage.init(color: .green, size: .init(width: 1, height: 1))
        let blueImage = UIImage.init(color: .blue, size: .init(width: 1, height: 1))
        let redImage = UIImage.init(color: .red, size: .init(width: 1, height: 1))
        imageArray.append(greenImage!)
        imageArray.append(blueImage!)
        imageArray.append(redImage!)
        return imageArray
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ALAlcoholicAssistantTableViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        intoxicationImageView.image = images.first
    }

    @IBAction func intoxicationStageChanged(_ sender: UISegmentedControl) {
        intoxicationImageView.image = images[sender.selectedSegmentIndex]
    }
    
    @IBAction func calculateButtonTouched(_ sender: Any) {
        
    }
    
    func dismissKeyboard() {
        menCountTextField.resignFirstResponder()
        womenCountTextField.resignFirstResponder()
    }

}

extension ALAlcoholicAssistantTableViewController : UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text! == "" {
            textField.text = String(0)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
}

public extension UIImage {
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}

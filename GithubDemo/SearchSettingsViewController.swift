//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Suyeon Kang on 2/25/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class SearchSettingsViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!

    @IBOutlet weak var starsCount: UILabel!
    var settings: GithubRepoSearchSettings!
    weak var delegate: SettingsPresentingViewControllerDelegate?

    
    @IBAction func sliderValueChanged(sender: UISlider) {
        var currentValue = Int(sender.value)
        
        starsCount.text = "\(currentValue)"
        settings.minStars = Int(currentValue)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        starsCount.text = "\(settings.minStars)"
        slider.value = Float(settings.minStars)
    }
    
    
    
    @IBAction func goBackToTable(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        self.delegate?.didCancelSettings()
    }
    @IBAction func saveButtonTapped(sender: AnyObject) {
        self.delegate?.didSaveSettings(settings)
    }
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        print("asdf")
//        let navController = segue.destinationViewController as! UINavigationController
//        let vc = navController.topViewController as! RepoResultsViewController
//        var currentValue = Int(slider.value)
//       
//        vc.searchSettings.minStars = currentValue
//    }
}

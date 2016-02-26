//
//  SettingsPresentingViewControllerDelegate.swift
//  GithubDemo
//
//  Created by Suyeon Kang on 2/25/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

protocol SettingsPresentingViewControllerDelegate: class {
    func didSaveSettings(settings: GithubRepoSearchSettings)
    func didCancelSettings()

}

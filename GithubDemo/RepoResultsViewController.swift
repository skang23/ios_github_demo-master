//
//  ViewController.swift
//  GithubDemo
//
//  Created by Nhan Nguyen on 5/12/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit
import MBProgressHUD
import AFNetworking

// Main ViewController
class RepoResultsViewController: UIViewController {

    var searchBar: UISearchBar!
    var settings = GithubRepoSearchSettings()
    @IBOutlet weak var tableView: UITableView!

    
    var repos: [GithubRepo]!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        // Initialize the UISearchBar
        searchBar = UISearchBar()
        searchBar.delegate = self

        // Add SearchBar to the NavigationBar
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        
        
        tableView.dataSource = self
        
        

    }
    
    override func viewDidAppear(animated: Bool) {
        // Perform the first search when the view controller first loads
        doSearch()

    }

    // Perform the search.
    private func doSearch() {

        MBProgressHUD.showHUDAddedTo(self.view, animated: true)

        // Perform request to GitHub API to get the list of repositories
        GithubRepo.fetchRepos(settings, successCallback: { (newRepos) -> Void in

            // Print the returned repositories to the output window
            for repo in newRepos {
                print(repo)
            }
            
            // Store repos
            self.repos = newRepos
            self.tableView.reloadData()

            MBProgressHUD.hideHUDForView(self.view, animated: true)
            }, error: { (error) -> Void in
                print(error)
        })
    }
}

extension RepoResultsViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! RepoResultsCell
        
        cell.nameLabel!.text = repos[indexPath.row].name
        cell.authorLabel!.text = "By \(repos[indexPath.row].ownerHandle!)"
        cell.discriptionLabel!.text = repos[indexPath.row].repoDescription
        cell.starsLabel!.text = "\(repos[indexPath.row].stars!)"
        cell.forksLabel!.text = "\(repos[indexPath.row].forks!)"
        cell.avatarView.setImageWithURL(NSURL(string: repos[indexPath.row].ownerAvatarURL!)!)
        



        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if repos != nil {
            return repos.count
        }
        return 0
    }
}

// SearchBar methods
extension RepoResultsViewController: UISearchBarDelegate {

    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true;
    }

    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true;
    }

    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        settings.searchString = searchBar.text
        searchBar.resignFirstResponder()
        doSearch()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navController = segue.destinationViewController as! UINavigationController
        let vc = navController.topViewController as! SearchSettingsViewController
        vc.settings = settings
        print("Settings: \(settings.minStars)")
        vc.delegate = self
    }
}

extension RepoResultsViewController: SettingsPresentingViewControllerDelegate {
    func didSaveSettings(settings: GithubRepoSearchSettings) {
        
        print("save")
        self.dismissViewControllerAnimated(true, completion: nil)
        	
        self.settings = settings
        tableView.reloadData()
    }
    func didCancelSettings() {
        print("cancel")

        self.dismissViewControllerAnimated(true, completion: nil)

    }
}
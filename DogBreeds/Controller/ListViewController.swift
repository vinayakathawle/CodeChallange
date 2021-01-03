//
//  ListViewController.swift
//  DogBreeds
//
//  Created by Vinayak Kakade on 03/01/21.
//

import UIKit

class ListViewController: UITableViewController
{
    private var breeds  = [BreedsList]()
    private let viewModel = BreedsViewModel()
    @IBOutlet weak var breedTableView: UITableView!
    private var errorMsg: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loadData()
    }
    
    private func setupView() {
        self.title = Constants.aTitle
        
        breedTableView.tableFooterView = UIView()
        breedTableView.register(UINib(nibName:Constants.customCell,bundle:nil), forCellReuseIdentifier: Constants.customCellIdentifier)
        breedTableView.estimatedRowHeight = CGFloat(Constants.estimatedRowHeight)
        breedTableView.rowHeight = UITableViewAutomaticDimension
        
        self.refreshControl?.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
    }
    
    @objc func refresh(sender:AnyObject)
    {
        // Updating your data here...
        loadData()
    }
    
    private func loadData() {
        showActivityIndicator()
        viewModel.getDogBreeds(limit: Constants.limit) { [weak self] (type, errorMessage) in
            switch (type) {
            case .success:
                if let breedObjs = self?.viewModel.breeds {
                    self?.breeds = breedObjs
                }
            case .faliure:
                self?.breeds  = [BreedsList]()
                self?.errorMsg = errorMessage
            }
            
            DispatchQueue.main.async {
                self?.hideActivityIndicator()
                self?.refreshControl?.endRefreshing()
                self?.breedTableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if breeds.count == 0 {
            tableView.setEmptyView(title: Constants.pullToRefresh, message: errorMsg)
        } else {
            tableView.restore()
        }
        
        return breeds.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellFrame = tableView.frame.size
        cellFrame.height =  Constants.estimatedRowHeight - Constants.spacing
        cellFrame.width =  cellFrame.width - Constants.spacing
        
        let heightForBreedName = LabelHeight.getHeightForBreedName(width: cellFrame.width, breeds: breeds[indexPath.row])
        
        let heightForBreedLifeSpan = LabelHeight.getHeightForBreedLifeSpan(width: cellFrame.width, breeds: breeds[indexPath.row])
        
        return heightForBreedName + heightForBreedLifeSpan + ImageRatio.getAspectRatioAccordingToDeviceSize(cellImageFrame: cellFrame, imageWidth: self.breeds[indexPath.row].width ?? Constants.zeroValue, imageHeigth: self.breeds[indexPath.row].height ?? Constants.zeroValue)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.customCellIdentifier) as! CustomCell
        
        let cellWidth = cell.frame.size.width - CGFloat(Constants.spacing)
        cell.breedNameHeightConstraint.constant = LabelHeight.getHeightForBreedName(width: cellWidth, breeds: breeds[indexPath.row])
        cell.breedNameLabel.text = breeds[indexPath.row].breeds?.first?.name
        
        cell.breedLifeSpanHeightConstraint.constant = LabelHeight.getHeightForBreedLifeSpan(width: cellWidth, breeds: breeds[indexPath.row])
        cell.lifespanLabel.text = breeds[indexPath.row].breeds?.first?.life_span
        
        if let iconURL = self.breeds[indexPath.row].url {
            guard let url = URL(string: iconURL) else { return  cell }
            cell.breedImageView.loadImageWithUrl(url: url) { image in
                cell.breedImageView.image = image
            }
        }
        
        return cell
    }
}

extension ListViewController {
    @IBAction func accendingClick(sender:UIBarButtonItem) {
        let sorted = breeds.sorted {($0.breeds?.first?.life_span ?? Constants.blankSpace).localizedStandardCompare($1.breeds?.first?.life_span ?? Constants.blankSpace) == .orderedAscending}
        breeds = sorted
        breedTableView.reloadData()
    }
    
    @IBAction func decendignClick(sender:UIBarButtonItem) {
        let sorted = breeds.sorted {($0.breeds?.first?.life_span ?? Constants.blankSpace).localizedStandardCompare($1.breeds?.first?.life_span ?? Constants.blankSpace) == .orderedDescending}
        breeds = sorted
        breedTableView.reloadData()
    }
}

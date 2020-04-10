//
//  MovieListVC.swift
//  MovieApplicationFG
//
//  Created by Filip Glavica on 08/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import UIKit

class MovieListVC: UIViewController {
    
    
    override func viewDidLoad() {
        tableView.backgroundColor = .init(red: 0.221, green: 0.221, blue: 0.221, alpha: 1)
        super.viewDidLoad()
        view.backgroundColor = .init(red: 0.221, green: 0.221, blue: 0.221, alpha: 1)
        configureTableView()
        setupTableView()
        getData()
        
    }
    
    
    
    var tableView = UITableView()
    
    //placeholder image
    let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    var dataSource = [MovieAPIListView]()
    private let networkManager: NetworkManager
    
    
    //nema sintetizirane inicijalizatore i zato trebamo networkManager init
    
    init(networkManager: NetworkManager){
        self.networkManager = networkManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // da me ne zezne string
    struct Cells{
        static let movieCell = "MovieCell"
    }
    

    
    
    
    
    func configureTableView(){
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.register(MovieCell.self, forCellReuseIdentifier: Cells.movieCell)
        tableView.rowHeight = 155

    }
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
        
    
    
    
    
    func getData(){
        indicator.startAnimating()
        networkManager.getData(from: "https://api.themoviedb.org/3/movie/now_playing") {   [unowned self](movieList) in
            self.indicator.stopAnimating()
            if let safeMovieList = movieList {
                self.dataSource = self.createScreenData(from: safeMovieList)
                self.tableView.reloadData()
            }else {
                
            }
        }
    }
    
    private func createScreenData (from data: [MovieAPIInfo]) -> [MovieAPIListView]{
        return data.map { (data) -> MovieAPIListView in
            let year = DateUtils.getYearFromDate(stringDate: data.releaseDate)
            return MovieAPIListView(id: data.id, title: data.title, imageURL: data.posterPath, description: data.overview, year: year)
        }
    }
}







//MARK: tableView config

extension MovieListVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.movieCell) as! MovieCell
        
        let movie = dataSource[indexPath.row]
        cell.set(movie: movie)
        
        return cell
    }
    

}

//
//  MovieListVC.swift
//  MovieApplicationFG
//
//  Created by Filip Glavica on 08/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import UIKit
import SnapKit

class MovieListVC: UIViewController {
    
    var tableView = UITableView()
    
    //placeholder image
    let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    var dataSource = [MovieAPIListView]()
    
    private let networkManager: NetworkManager
    
    // da me ne zezne string
    struct Cells{
        static let movieCell = "MovieCell"
    }
    
    override func viewDidLoad() {
        tableView.backgroundColor = .init(red: 0.221, green: 0.221, blue: 0.221, alpha: 1)
        super.viewDidLoad()
        view.backgroundColor = .init(red: 0.221, green: 0.221, blue: 0.221, alpha: 1)
        configureTableView()
        setupTableViewConstraints()
        getData()
        
    }
    
    //nema sintetizirane inicijalizatore i zato trebamo networkManager init
    
    init(networkManager: NetworkManager){
        self.networkManager = networkManager
        //self.director = Director
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.register(MovieCell.self, forCellReuseIdentifier: Cells.movieCell)
        tableView.estimatedRowHeight = 180
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none

    }
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
   
    func getData(){
        indicator.startAnimating()
        networkManager.getData(from: "https://api.themoviedb.org/3/movie/now_playing") {   [unowned self](movieList) in
            self.indicator.stopAnimating()
            if let safeMovieList = movieList {
                self.dataSource = self.createScreenData(from: safeMovieList)
                self.tableView.reloadData()
            }else {}
        }
    }
    
    func getGenres(){
        indicator.startAnimating()
        networkManager.getData(from: "https://api.themoviedb.org/3/genre/movie/list") { [unowned self](genres) in
            self.indicator.stopAnimating()
            if let safeGenreList = genres{
                self.dataSource = self.createScreenData(from: safeGenreList)
                self.tableView.reloadData()
            }else{
                
            }
        }
    }
    
    private func createScreenData (from data: [MovieAPIInfo]) -> [MovieAPIListView]{
        return data.map { (data) -> MovieAPIListView in
            let year = DateUtils.getYearFromDate(stringDate: data.releaseDate)
            let watched = DatabaseManager.isMovieWatched(with: data.id)
            let favourite = DatabaseManager.isMovieFavourited(with: data.id)
            return MovieAPIListView(id: data.id, title: data.title, imageURL: data.posterPath, description: data.overview, year: year, watched: watched, favourite: favourite)
        }
    }
    
    //MARK: CONSTRAINTS
    func setupTableViewConstraints(){
        tableView.snp.makeConstraints{ (maker) in
            maker.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}







//MARK: tableView config

extension MovieListVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.movieCell) as! MovieCell
        
        let movie = dataSource[indexPath.row]
        cell.set(movie: movie)
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = dataSource[indexPath.row]
        let viewC = SingleMovieViewController(movie: item, networkManager: networkManager)
        viewC.delegate = self
        
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    

}

extension MovieListVC: UserInteraction{
    func watchedMoviePressed(with id: Int) {
        guard let movie = dataSource.enumerated().first(where: {(movie) -> Bool in
            return movie.element.id == id
        }) else {return}
        !movie.element.watched ? DatabaseManager.watchedMovie(with: movie.element.id) :
            DatabaseManager.removeMovieFromWatched(with: movie.element.id)
        dataSource[movie.offset].watched = !movie.element.watched
        tableView.reloadRows(at: [IndexPath(row: movie.offset, section: 0)], with: .none)
    }
    func favouritedMoviePressed(with id: Int) {
            guard let movie = dataSource.enumerated().first(where: { (movie) -> Bool in
                return movie.element.id == id
            }) else {return}
            !movie.element.favourite ? DatabaseManager.favouritedMovie(with: movie.element.id) :
                DatabaseManager.removeMovieFromFavourite(with: movie.element.id)
            dataSource[movie.offset].favourite = !movie.element.favourite
            tableView.reloadRows(at: [IndexPath(row: movie.offset, section: 0)], with: .none)
    }
}

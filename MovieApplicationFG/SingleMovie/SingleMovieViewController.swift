//
//  SingleMovieViewController.swift
//  MovieApplicationFG
//
//  Created by Filip Glavica on 15/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import UIKit
import SnapKit

class SingleMovieViewController: UIViewController {

    var tableView = UITableView()
    
    var backButton = UIButton()
    
    let movie: MovieAPIListView
    
    let director: Director
    
    var screenData = [MovieCellObject]()
    
    let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    private var dataSource = [MovieAPIListView]()
    
    private let networkManager: NetworkManager
    
    weak var delegate: UserInteraction?
    
    init(movie: MovieAPIListView, networkManager: NetworkManager){
        self.movie = movie
        self.networkManager = networkManager
        self.director =
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.addSubview(backButton)
        
        
        configureTableView()
        configureBackButton()
        
        backButton.addTarget(self, action: #selector(popToPreviousVC(sender:)), for: .touchUpInside)
        self.screenData = createScreenData(movie: movie, director: director)
        tableView.reloadData()
        
        setupSingleMovieTableViewConstraints()
        setupBackButtonConstraints()
        insertDirector(movieId: movie.id)

    }
    
    //MARK: configuration
    func configureTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .init(red: 0.221, green: 0.221, blue: 0.221, alpha: 1)
        
        setTableViewDelegates()
        tableView.estimatedRowHeight = 255
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(ImageCell.self, forCellReuseIdentifier: "ImageCell")
        tableView.register(TitleCell.self, forCellReuseIdentifier: "TitleCell")
        tableView.register(GenreCell.self, forCellReuseIdentifier: "GenreCell")
        tableView.register(DirectorCell.self, forCellReuseIdentifier: "DirectorCell")
        tableView.register(DescriptionCell.self, forCellReuseIdentifier: "DescriptionCell")
    }
    
    func configureBackButton(){
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(Images.backButton, for: .normal)
    }
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func insertDirector(movieId: Int){
        networkManager.getMovieDirector(from: "https://api.themoviedb.org/3/movie/\(movieId)/credits", movieId: movieId){
            (director) in
            if let safeDirector = director {
                self.screenData = self.createScreenData(movie: self.movie, director: safeDirector)
                self.tableView.reloadData()
            } else {}
        }
    }
    
    func createScreenData(movie: MovieAPIListView, director: Director) -> [MovieCellObject] {
        var screenData: [MovieCellObject] = []
        screenData.append(MovieCellObject(type: .image, data: movie.imageURL))
        screenData.append(MovieCellObject(type: .title, data: movie.title))
        //screenData.append(MovieCellObject(type: .genre, data: genre.))
        screenData.append(MovieCellObject(type: .director, data: director.name))
        screenData.append(MovieCellObject(type: .description, data: movie.description))
        return screenData
    }
   
//MARK: button logic
    @objc func popToPreviousVC(sender: UIButton){
        _ = navigationController?.popViewController(animated: true)
    }
    
    func setupSingleMovieTableViewConstraints(){
        tableView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setupBackButtonConstraints(){
        backButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(view.safeAreaLayoutGuide).inset(35)
            maker.leading.equalTo(view.safeAreaLayoutGuide).inset(21)
            maker.trailing.equalTo(view.safeAreaLayoutGuide).inset(330)
        }
    }
    
    
}


//MARK: Conformance and dequeing

extension SingleMovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return screenData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = screenData[indexPath.row]
        
        switch item.type {
            
        case .image:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageCell
            cell.configureCell(image: movie.imageURL, movie: movie)
            cell.delegate = self
            
            return cell
            
        case .title:
            guard let safeData = item.data as? String else {return UITableViewCell()}
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as! TitleCell
            cell.configureCell(title: safeData)
            
            return cell
        
        case .director:
            guard let safeData = item.data as? String else {return UITableViewCell()}
            let cell = tableView.dequeueReusableCell(withIdentifier: "DirectorCell", for: indexPath) as! DirectorCell
            cell.configureCell(director: safeData)
            
            return cell
            
        case .description:
            guard let safeData = item.data as? String else {return UITableViewCell()}
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath) as! DescriptionCell
            cell.configureCell(description: safeData)
            
            return cell
            }
        }
        
        
    }

extension SingleMovieViewController: UserInteraction{
    
    
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


//
//  TaskControllerViewController.swift
//  SuperAwesomeTodoApp
//
//  Created by Carlos on 27/02/21.
//

import UIKit

class TaskControllerViewController: UIViewController {

    //Variables
    var todaysTasks: [TaskModel]   = []
    var upcomingTasks: [TaskModel] = []
    
    
    //Outlets
    @IBOutlet weak var TasksCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func configureCollectionView(){
        
    }
    
    private func configureTableView(){
        
    }
    

  
}

extension TaskControllerViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todaysTasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.TASK_COLLECTION_VIEW_CELL_ID, for: indexPath) as? TaskCollectionCell{
            
        }
        return UICollectionViewCell()
    }
    
    
}

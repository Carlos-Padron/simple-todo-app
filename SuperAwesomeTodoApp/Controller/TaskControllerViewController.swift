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
    var colorIndex: Int            = 0
    
    
    //Outlets
    @IBOutlet weak var TasksCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        // Do any additional setup after loading the view.
    }
    
    private func configureCollectionView(){
        TasksCollectionView.delegate = self
        TasksCollectionView.dataSource = self
    }
    
    private func configureTableView(){
        
    }
    
    @IBAction func addTaskOnTap(_ sender: UIButton) {
        print("Tapped")
        
        let storyboard = UIStoryboard(name: "Modal", bundle: nil)
        let modal = storyboard.instantiateViewController(withIdentifier: "AddTaskModal")
        modal.modalTransitionStyle = .crossDissolve
        modal.modalPresentationStyle = .overFullScreen
        self.present(modal, animated: true)
        
        
    }
    
  
}

extension TaskControllerViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todaysTasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.TASK_COLLECTION_VIEW_CELL_ID, for: indexPath) as? TaskCollectionCell{
            
            let totalColors = Constants.colorArray.count;
            
            if indexPath.row % totalColors == 0 && indexPath.row > 0 {
                colorIndex = 0
                cell.configure(task: todaysTasks[indexPath.row], colorIndex: colorIndex)
            }else{
                cell.configure(task: todaysTasks[indexPath.row], colorIndex: colorIndex)
            }
            
            colorIndex += 1

            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
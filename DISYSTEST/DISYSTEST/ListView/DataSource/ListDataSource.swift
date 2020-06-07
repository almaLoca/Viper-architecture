
import UIKit

class ListDataSource: NSObject,UITableViewDataSource, UITableViewDelegate {
    
    var tblView:UITableView!
    
    public var ListModel  : [ListModel]?
    var utility = Utility()
    
    
    //Declare matches Viewcontroller--//
    var listVC: ListViewController?
    var viewController : AnyObject? {
        get {
            return ListViewController()
        }
    }
    
    //Initial Setup--//
    init(viewController : ListViewController){
        super.init()
        
        self.listVC = viewController
        tblView?.estimatedRowHeight = 135
        tblView?.rowHeight = UITableView.automaticDimension
        tblView?.setNeedsLayout()
        tblView?.layoutIfNeeded()
        
    }
    //MARK: - TablewView DataSource and Delegates Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if let count = listVC?.ListFinalArray.count,count > 0 {
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let count = listVC?.ListFinalArray.count,count > 0 {
            
            let noOfSectionDic =  listVC?.ListFinalArray[section] as! [String : AnyObject]
            return  (noOfSectionDic.first?.value.count)!
        }
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListTableViewCell
        
        
        return cell
        
    }
    
    
}



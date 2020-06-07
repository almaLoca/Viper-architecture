
import UIKit
import ObjectMapper

class ListViewController: UIViewController {

    var presenter:ListPresenterProtocol?
    @IBOutlet weak var tblView: UITableView!
    //--Model Declaration--//
    var listDataSource: ListDataSource?
    var ListFinalArray = [AnyObject]()
    var responseDictionary = [String: AnyObject]()
    
    //--set Activity Indicator--//
    var activityIndicator = UIActivityIndicatorView()
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(ListViewController.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //--set ActivityIndicator--//
        //createActivityIndicator(indicator: activityIndicator)
        self.navigationController?.navigationBar.isHidden = false
        
        //--set Datasource Model
        setTableViewDataSource()
    }
    
    func setTableViewDataSource() {
        
        listDataSource = ListDataSource.init(viewController: self)
        listDataSource?.tblView = tblView
        tblView?.delegate = listDataSource
        tblView?.dataSource = listDataSource
        tblView?.estimatedRowHeight = 135
        tblView?.rowHeight = UITableView.automaticDimension
        self.tblView.addSubview(self.refreshControl)
        activityIndicator.startAnimating()
        ListRouter.createListModule(ListRef: self)
        presenter?.loadList(view: self)
    }
    
    @IBAction func back(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    //MARK: REFRESH ACTION
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        self.tblView.reloadData()
        refreshControl.endRefreshing()
    }

}

extension ListViewController:ListViewProtocol {
    
    func listPresenterApiResponse(List: [AnyObject], serviceString: String) {
        
    }
    func lsitPresenterApiResponse(ListModel: [AnyObject],serviceString: String){
        activityIndicator.stopAnimating()
        if serviceString == "LTConstants.STRICTPPAPI" {
            print("FINAL STRICT ARRYA: \(ListFinalArray)")
            ListFinalArray = ListModel
            tblView.reloadData()
        }else{
            //Utility.showToastView(toastString:"STRICTFILTERUPDATE", view:self.view)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}





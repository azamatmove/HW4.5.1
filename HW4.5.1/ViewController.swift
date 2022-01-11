import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDataSource{
    
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    
    private var friends = [
        "Aza","Aidai","Gera","Beka","Beishekan","Talgar","Sam","One"
    ]
    
    private func setupSubviews(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let index = indexPath.row
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = friends[index]
        
        return cell
    }
    
    
}

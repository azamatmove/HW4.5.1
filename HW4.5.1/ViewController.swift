import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    private lazy var nameField: UITextField = {
        let view = UITextField()
        view.placeholder = "Имя"
        return view
    }()
    
    private lazy var numberField: UITextField = {
        let view = UITextField()
        view.placeholder = "Номер"
        return view
    }()
    
    private lazy var buttonToAdd: UIButton = {
        let view = UIButton()
        view.setTitle("+", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.addTarget(nil, action: #selector(addContact(sender:)), for: .touchUpInside)
        view.backgroundColor = .systemGray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        

        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    
    var friends = [
        "Aza","Aidai","Gera","Beka","Beishekan","Talgar","Sam","One"
    ]
    
    var numbers = ["0700900800","0700900800","0700900800","0700900800","0700900800","0700900800","0700900800","0700900800"]
    
    private func setupSubviews(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(view.frame.height / 5)
            make.left.bottom.right.equalToSuperview()
        }
        
        view.addSubview(nameField)
        nameField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(view.frame.height / 10)
            make.height.equalToSuperview().multipliedBy(0.05)
            make.left.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.6)
        }
        view.addSubview(numberField)
        numberField.snp.makeConstraints { make in
            make.top.equalTo(nameField.snp.bottom)
            make.height.equalToSuperview().multipliedBy(0.05)
            make.left.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.6)
        }
        view.addSubview(buttonToAdd)
        buttonToAdd.snp.makeConstraints { make in
            make.left.equalTo(nameField.snp.right)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.bottom.equalTo(numberField)
            make.top.equalTo(numberField)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let index = indexPath.row
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "\(friends[index])  \(numbers[index])"
        
        return cell
    }
    @objc func addContact(sender: UIButton) {
        let name1 = nameField.text
        let number1 = numberField.text
        friends.append("\(name1!)")
        numbers.append("\(number1!)")
        tableView.reloadData()
    }
        

}

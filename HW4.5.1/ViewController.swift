import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addContact))
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
            make.edges.equalToSuperview()
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
    
    
    @objc func addContact(){
        let alert = UIAlertController(title: "Добавить контакт", message: "Введите данные", preferredStyle: .alert)
        
        alert.addTextField { field in
            field.placeholder = "Имя"
            field.returnKeyType = .next
            field.keyboardType = .namePhonePad
        }
        
        alert.addTextField { field in
            field.placeholder = "Номер"
            field.returnKeyType = .next
            field.keyboardType = .numberPad
        }
        
        alert.addAction(UIAlertAction(title: "Отменить", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Добавить", style: .default, handler: { _ in
            guard let fields = alert.textFields, fields.count == 2 else {
                    return
                }
            let nameField = fields[0]
            let numberField = fields[1]
            
            guard let name1 = nameField.text , !name1.isEmpty,
                  let number1 = numberField.text, !number1.isEmpty else{
                      print("Ошибка")
                      return
                  }
            self.friends.append("\(name1)")
            self.numbers.append("\(number1)")
            self.tableView.reloadData()
        }))
        present(alert, animated: true)
    }
}

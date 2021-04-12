//
//  feedController.swift
//  Bridge
//
//  Created by William Roland Hernando on 03/04/21.
//

import UIKit

class ViewControllerPostDetail: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet var table : UITableView!
    
    var models = [Model]()
    @IBOutlet weak var textView : UITextField!
    var activeField: UITextField?
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var bottomContraint: NSLayoutConstraint?
    var bottomBlockContraint: NSLayoutConstraint?

    var bottomContraintChat: NSLayoutConstraint?
    var bottomContraintPic: NSLayoutConstraint?
    var bottomContraintButton: NSLayoutConstraint?
    
    let newView = UIView()
    let newViewBlock = UIView()

    let newTextField = UITextField()
    let newProfileComment = UIImageView()
    let postButton = UIButton()
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.tableView.rowHeight = UITableViewAutomaticDimension;
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        models.append(Model(text: "Lisa" , imageName: "Lisa"))
        models.append(Model(text: "Blink" , imageName: "Lisa"))
        models.append(Model(text: "Blink" , imageName: "Lisa"))
        models.append(Model(text: "Blink" , imageName: "Lisa"))

        //self.view.backgroundColor = .red
        
//        table.register(FeedCollectionTableViewCell.nib(), forCellReuseIdentifier: FeedCollectionTableViewCell.identifier)
        table.register(CommentTableViewCell.nib(), forCellReuseIdentifier: CommentTableViewCell.identifier)
        
        table.register(ProfilePostTableViewCell.nib(), forCellReuseIdentifier: ProfilePostTableViewCell.identifier)

        table.delegate = self
        table.dataSource = self
        
        
 
        setupBorderBlockChat()
        setupPostButton()
        setupBorderChat()
        setupInputCompenent()
        setupProfilPic()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillchange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillchange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillchange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        

        print("ini naik")
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    var tinggikibords = 0
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            tinggikibords = Int(keyboardHeight)
        }
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @objc func keyboardWillchange(notification: Notification){
        print("Keyboard will show pepegaclap: \(notification.name.rawValue)")
        
        if notification.name.rawValue == "UIKeyboardWillHideNotification"{
            bottomContraint?.constant = -50
            bottomContraintChat?.constant = -50
            bottomContraintPic?.constant = -50
            bottomContraintButton?.constant = -50


            
        }
        else if notification.name.rawValue == "UIKeyboardWillShowNotification"{
            bottomContraint?.constant = -CGFloat(tinggikibords)+50
            bottomContraintChat?.constant = -CGFloat(tinggikibords)+50
            bottomContraintPic?.constant = -CGFloat(tinggikibords)+50
            bottomContraintButton?.constant = -CGFloat(tinggikibords)+50

        }
    }
    
    private func setupInputCompenent(){
      //  newView.addSubview(newTextField)
        //newTextField.backgroundColor = UIColor.red
        view.addSubview(newTextField)
        newTextField.placeholder = "Type Here..."
        newTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: newTextField, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 60).isActive = true
        NSLayoutConstraint(item: newTextField, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: screenHeight/2-50).isActive = true
        NSLayoutConstraint(item: newTextField, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: screenWidth-50).isActive = true
        NSLayoutConstraint(item: newTextField, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50).isActive = true
        bottomContraintChat = NSLayoutConstraint(item: newTextField, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -50)
        view.addConstraint(bottomContraintChat!)
    }
    
    private func setupBorderChat(){
        newView.backgroundColor = nil
    newView.layer.borderWidth = 2
    newView.layer.cornerRadius = 20
    newView.layer.borderColor = UIColor.orange.cgColor
        view.addSubview(newView)
        newView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 30).isActive = true
        NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: screenHeight/2-50).isActive = true
        NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: screenWidth-80).isActive = true
        NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50).isActive = true
        bottomContraint = NSLayoutConstraint(item: newView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -50)
        view.addConstraint(bottomContraint!)

    }
    private func setupBorderBlockChat(){
        newViewBlock.backgroundColor = nil
//        newViewBlock.layer.borderWidth = 2
//        newViewBlock.layer.cornerRadius = 20
        newViewBlock.backgroundColor = UIColor.init(named: "Color")
        view.addSubview(newViewBlock)
        newViewBlock.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: newViewBlock, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: newViewBlock, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: screenHeight/2-50).isActive = true
        NSLayoutConstraint(item: newViewBlock, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: screenWidth).isActive = true
        NSLayoutConstraint(item: newViewBlock, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50).isActive = true
        bottomBlockContraint = NSLayoutConstraint(item: newViewBlock, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -50)
        view.addConstraint(bottomBlockContraint!)

    }
    
    
    private func setupPostButton(){
      //  postButton.backgroundColor = nil
        postButton.setTitleColor(.orange, for: .normal)
        view.addSubview(postButton)
        //titleLabel!.font = UIFont(name: "AppleSDGothicNeo-Thin" , size: 25)
        postButton.setTitle("Post", for: .normal)
        postButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: postButton, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: screenWidth/2-50).isActive = true
        NSLayoutConstraint(item: postButton, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: screenHeight/2-50).isActive = true
        NSLayoutConstraint(item: postButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: screenWidth-80).isActive = true
        NSLayoutConstraint(item: postButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50).isActive = true
        bottomContraintButton = NSLayoutConstraint(item: postButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -50)
        view.addConstraint(bottomContraintButton!)
    }
    
    private func setupProfilPic(){
        newProfileComment.layer.cornerRadius = 25
        newProfileComment.clipsToBounds = true
        view.addSubview(newProfileComment)
        newProfileComment.backgroundColor = .red
        newProfileComment.image = UIImage(named: "profileImage")
        newProfileComment.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: newProfileComment, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: -screenWidth/2+40).isActive = true
        NSLayoutConstraint(item: newProfileComment, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: screenHeight/2-50).isActive = true
        NSLayoutConstraint(item: newProfileComment, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50).isActive = true
        NSLayoutConstraint(item: newProfileComment, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50).isActive = true
 
        bottomContraintPic = NSLayoutConstraint(item: newProfileComment, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -50)
        view.addConstraint(bottomContraintPic!)
        
    }
    
    //Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.newTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        newTextField.resignFirstResponder()
        return true
    }
    
    
    //setting masukin ke tabble
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row < 0 {
//
//            let cell = table.dequeueReusableCell(withIdentifier: FeedCollectionTableViewCell.identifier, for: indexPath) as! FeedCollectionTableViewCell
//            cell.configure(with: models)
//            return cell
//        }
        
        if indexPath.row < 1 {
            let cell = table.dequeueReusableCell(withIdentifier: ProfilePostTableViewCell.identifier, for: indexPath) as! ProfilePostTableViewCell
            cell.configure()
            return cell
        }
        
        let cell = table.dequeueReusableCell(withIdentifier: CommentTableViewCell.identifier, for: indexPath) as! CommentTableViewCell
        cell.configure()
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < 1 {
            return 250
        }
        return 60.0
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
}
//===========================================struct isi
struct Model {
    let text: String
    let imageName: String
    
    init(text: String, imageName: String){
        self.text = text
        self.imageName = imageName
        
    }
}

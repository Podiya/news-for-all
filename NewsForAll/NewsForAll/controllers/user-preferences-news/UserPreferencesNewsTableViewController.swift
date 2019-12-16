import UIKit

class UserPreferencesNewsTableViewController: BaseArticleTableViewController {

    private let service = ArticleService.shared
    private var pickerView: UIPickerView!
    private let pickerViewData = ["Bitcoin", "Apple", "Earthquake", "Animal"]
    private var selectedCategory: String = ""
    private var rightButtonImage = "filter-blue"
    
    fileprivate func initNavBarItems() {
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(named: rightButtonImage), style: .plain, target: self, action: #selector(didSelectFilert))]
    }
    
    fileprivate func initPickerView() {
        let currentWindow: UIWindow? = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
        pickerView = UIPickerView(frame: CGRect(x: 0, y: (navigationController?.navigationBar.frame.height ?? 0) + (currentWindow?.safeAreaInsets.top ?? 0), width: dWidth, height: 100))
        currentWindow?.addSubview(pickerView)
        pickerView.backgroundColor = .white
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.isHidden = true
        pickerView.isUserInteractionEnabled = true
        selectedCategory = pickerViewData[0]
    }
    
    fileprivate func fetch() {
        service.artiticles(bySelection: selectedCategory) { articles in
            self.articles = articles
        }
    }
    
    @objc func didSelectFilert() {
        pickerView.isHidden = !pickerView.isHidden
        pickerView.reloadAllComponents()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavBarItems()
        initPickerView()
        baseArticleDelegate = self
        fetch()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = selectedCategory
    }
}

extension UserPreferencesNewsTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        navigationItem.title = pickerViewData[row]
        selectedCategory = pickerViewData[row]
        fetch()
    }
}

extension UserPreferencesNewsTableViewController: BaseArticleTableViewControllerDelegate {
    func refreshed() {
        self.fetch()
    }
    
    func didSelectRow() {
        pickerView.isHidden = true
    }
}

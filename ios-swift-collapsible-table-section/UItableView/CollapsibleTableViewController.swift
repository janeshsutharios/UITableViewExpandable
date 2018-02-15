import UIKit
class CollapsibleTableViewController: UIViewController {
    var sections = sectionsData
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        self.title = "Apple Products"
        tableView.register(UINib(nibName: "CollapsibleTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}
extension CollapsibleTableViewController: UITableViewDataSource,UITableViewDelegate {

     func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // print(" \(sections[section].collapsed)  rows \(sections[section].items.count)")
        return sections[section].collapsed ? 0 : sections[section].items.count
    }

    // Cell
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CollapsibleTableViewCell
        cell.webDelegate = self
        //let item: Item = sections[indexPath.section].items[indexPath.row]
        //cell.nameLabel.text = item.name
        return cell
    }



    // Header
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header =  CollapsibleTableViewHeader.loadNib()

        header.titleLabel.text = "iOS"
        //header.titleLabel.text = sections[section].name

        header.arrowLabel.text = ">"
        header.setCollapsed(sections[section].collapsed)

        header.section = section
        header.delegate = self

        return header
    }

     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }

   
}
extension CollapsibleTableViewController: CollapsibleTableViewHeaderDelegate {

    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
        let collapsed = !sections[section].collapsed
        sections[section].collapsed = collapsed
        header.setCollapsed(collapsed)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
       // tableView.reloadSections(IndexSet(integer: section), with: .automatic)

    }

}
extension CollapsibleTableViewController: WebViewListner {
    func webViewFinishedLoad() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

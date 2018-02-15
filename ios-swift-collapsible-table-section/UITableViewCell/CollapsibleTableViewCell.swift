import UIKit
protocol WebViewListner {
    func webViewFinishedLoad()
}
class CollapsibleTableViewCell: UITableViewCell {
    var webDelegate: WebViewListner!
    @IBOutlet var uiWebView: UIWebView!
    let htmlString = """
<!DOCTYPE html>
<html>
<head>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
</head>
<body>

<h2>HTML Table</h2>

<table>
  <tr>
    <th>Company</th>
    <th>Contact</th>
    <th>Country</th>
    <th>Hello</th>
    <th>Shubham</th>

  </tr>
  <tr>
    <td>Alfreds Futterkiste</td>
    <td>Maria Anders</td>
    <td>Germany</td>
    <td>hhh</td>
    <td>asdas</td>

  </tr>
  <tr>
    <td>Centro comercial Moctezuma</td>
    <td>Francisco Chang</td>
    <td>Mexico</td>
<td>hhh</td>
    <td>asda</td>

  </tr>
  <tr>
    <td>Ernst Handel</td>
    <td>Roland Mendel</td>
    <td>Austria</td>
    <td>asd</td>

<td>hhh</td>
  </tr>
  <tr>
    <td>Island Trading</td>
    <td>Helen Bennett</td>
    <td>UK</td>
    <td>asd</td>

<td>hhh</td>
  </tr>
  <tr>
    <td>Laughing Bacchus Winecellars</td>
    <td>Yoshi Tannamuri</td>
    <td>Canada</td>
    <td>asdsad</td>

<td>hhh</td>
  </tr>
  <tr>
    <td>Magazzini Alimentari Riuniti</td>
    <td>Giovanni Rovelli</td>
    <td>asasd</td>
    <td>hhdsadh</td>

<td>hhh</td>
  </tr>
</table>

</body>
</html>
"""
    @IBOutlet var webViewHeightConstant: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        uiWebView.scrollView.bounces = false
        uiWebView.delegate = self
        setuiWebview()
    }
}

extension CollapsibleTableViewCell: UIWebViewDelegate {
    func setuiWebview() {
        uiWebView.loadHTMLString(htmlString, baseURL: nil)
        
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        let fittingSize = webView.sizeThatFits(.zero)
        print("\(fittingSize.width, fittingSize.height) ")
        webViewHeightConstant.constant = fittingSize.height
        webDelegate.webViewFinishedLoad()
    }
}

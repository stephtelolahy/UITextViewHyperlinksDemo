//
//  ViewController.swift
//  UITextViewHyperlinksDemo
//
//  Created by Hugues Stéphano TELOLAHY on 9/18/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
        let titleText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
        let contentHtml = """
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sodales risus nibh, eget rhoncus tellus congue ut. Suspendisse potenti. In ligula risus, elementum in consequat sit amet, vulputate eu nisi. Ut a felis molestie, bibendum velit sed, tristique magna. Phasellus sem ex, accumsan vel iaculis ut, viverra maximus sapien. Mauris non metus diam. Curabitur tellus eros, congue quis malesuada quis, porttitor a enim. Nullam ac nisl nisi. Ut aliquam, augue ut mattis condimentum, diam ligula fringilla lectus, id malesuada sapien tellus a libero, go to <a href="http://www.google.com">google</a> and search for it</p>
            """
        cell.update(title: titleText, contentHtml: contentHtml)
        cell.actionTapped = { sender in
            print("Tapped \(sender)")
        }
        return cell
    }
}

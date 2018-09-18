//
//  ViewController.swift
//  UITextViewHyperlinksDemo
//
//  Created by Hugues Stéphano TELOLAHY on 9/18/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: IBOutlet
    
    @IBOutlet weak var textView: UITextView!
    
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set these properties in interface builder
        assert(textView.isSelectable)
        assert(textView.dataDetectorTypes == .link)
        
        let html = """
            <html>
            <body>
            <h1>Hello, go to <a href="http://www.google.com">google</a> and search for it</h1>
            </body>
            </html>
            """
        let data = Data(html.utf8)
        guard let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) else {
            return
        }
        textView.attributedText = attributedString
        textView.delegate = self
    }
}

extension ViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        // check for the url string for performing your own custom actions here
        print("Interact with  \(URL.absoluteString)")
        // Return NO if you don't want iOS to open the link
        return true
    }
}


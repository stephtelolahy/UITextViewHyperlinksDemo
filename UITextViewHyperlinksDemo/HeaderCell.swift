//
//  HeaderCell.swift
//  UITextViewHyperlinksDemo
//
//  Created by Hugues Stéphano TELOLAHY on 10/16/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var contentTextViewHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        // Set these properties in interface builder
        assert(contentTextView.isSelectable)
        assert(contentTextView.dataDetectorTypes == .link)
        assert(!contentTextView.isScrollEnabled)
    }
    
    func update(title: String, contentHtml: String) {
        
        titleLabel.text = title
        
        let data = Data(contentHtml.utf8)
        guard let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) else {
            return
        }
        contentTextView.attributedText = attributedString
        contentTextViewHeightConstraint.constant = contentTextView.heightThatFitsContent
    }
}

extension UITextView {
    var heightThatFitsContent: CGFloat {
        let size = self.sizeThatFits(CGSize(width: self.frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        let insets = self.textContainerInset
        return size.height + insets.top + insets.bottom
    }
}

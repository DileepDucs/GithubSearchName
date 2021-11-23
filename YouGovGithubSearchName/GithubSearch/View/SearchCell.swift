//
//  SearchCell.swift
//  YouGovGithubSearchName
//
//  Created by Dileep Jaiswal on 21/11/21.
//

import UIKit

protocol SearchCellDelegate {
    func increaseNumber(cell: SearchCell,number : Int)
    func decreaseNumber(cell: SearchCell,number : Int)
}

class SearchCell: UITableViewCell {
    let padding: CGFloat = 5
    var background: UIView!
    var nameLabel: UILabel!
    var languageLabel: UILabel!
    var stargazersCount: UILabel!

    var search: SearchItem? {
        didSet {
            nameLabel.text = search?.name
            languageLabel.text = search?.language
            stargazersCount.text = String(search?.stargazers_count ?? 0)
            setNeedsLayout()
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.clear
        selectionStyle = .none
            
        background = UIView(frame: CGRect.zero)
        background.backgroundColor = .red
        background.alpha = 0.6
        contentView.addSubview(background)

        nameLabel = UILabel(frame: CGRect.zero)
        nameLabel.textAlignment = .left
        nameLabel.textColor = .black
        contentView.addSubview(nameLabel)

        languageLabel = UILabel(frame: CGRect.zero)
        languageLabel.textAlignment = .center
        languageLabel.textColor = .black
        contentView.addSubview(languageLabel)

        stargazersCount = UILabel(frame: CGRect.zero)
        stargazersCount.textAlignment = .center
        stargazersCount.textColor = .black
        contentView.addSubview(stargazersCount)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        background.frame = CGRect(x: 0, y: padding, width: frame.width, height: frame.height - 2 * padding)
        nameLabel.frame = CGRect(x: padding, y: (frame.height - 25)/2, width: 40, height: 25)
        languageLabel.frame = CGRect(x: frame.width - 100, y: padding, width: 100, height: frame.height - 2 * padding)
        stargazersCount.frame = CGRect(x: 50 + 10, y: 0, width: frame.width - stargazersCount.frame.width - 40 + 10, height: frame.height)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

}

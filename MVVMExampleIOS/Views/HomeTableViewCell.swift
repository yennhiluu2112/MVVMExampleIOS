//
//  HomeTableViewCell.swift
//  MVVMExampleIOS
//
//  Created by nhi.luu on 20/12/2023.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let identifier = "HomeTableViewCell"
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var prodImageView: UIImageView!
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: .main)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindData(title: String, category: String, imageURL: String) {
        
        titleLabel.text = title
        nameLabel.text = category
        
        let url = URL(string: imageURL)!
        DispatchQueue.main.async {
            let data = try? Data(contentsOf: url)
            if let imageData = data {
                let image = UIImage(data: imageData)
                self.prodImageView.image = image
            }
        }
        
    }
    
    
}

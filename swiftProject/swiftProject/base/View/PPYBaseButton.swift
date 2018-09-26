//
//  PPYBaseButton.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/9/26.
//  Copyright © 2018年 杭州拼便宜网络科技有限公司. All rights reserved.
//

import UIKit

extension UIButton {

    func setNormal(title: String?){
        self.setTitle(title, for: UIControlState.normal)
    }
    func normalTitle() -> String? {
        
        return title(for: UIControlState.normal)
    }
    func setSelected(title: String?){
       
        self.setTitle(title, for: UIControlState.selected)
        
    }
    func selectedTitle() -> String?{
       
        return title(for: UIControlState.selected)
        
    }
    func setHighlighted(title: String?){
        
        self.setTitle(title, for: UIControlState.highlighted)
        
    }
    func highlightedTitle() -> String? {
       
        return title(for: UIControlState.highlighted)
        
    }
    //MARK: - TitleColor
    func setNormal(titleColor: UIColor?){
       
        self.setTitleColor(titleColor, for: UIControlState.normal)
        
    }
    func normalTitleColor() -> UIColor? {
        
        return titleColor(for: UIControlState.normal)
        
    }
    func setSelected(titleColor: UIColor?) {
        
        self.setTitleColor(titleColor, for: UIControlState.selected)
        
    }
    func selectedTitleColor() -> UIColor?{
        
        return titleColor(for: UIControlState.selected)
        
    }
    func setHighlighted(titleColor: UIColor?){
        
        self.setTitleColor(titleColor, for: UIControlState.highlighted)
        
    }
    func highlightedTitleColor() -> UIColor? {
       
        return titleColor(for: UIControlState.highlighted)
        
    }
    //MARK: - Image
    func setNormal(image: UIImage?){
       
        self.setImage(image, for: UIControlState.normal)
        
    }
    func normalImage() -> UIImage? {
       
        return image(for: UIControlState.normal)
        
    }
    func setSelected(image: UIImage?){
       
        self.setImage(image, for: UIControlState.selected)
        
    }
    func selectedImage() -> UIImage?{
        
        return image(for: UIControlState.selected)
        
    }
    func setHighlighted(image: UIImage?){
        
        self.setImage(image, for: UIControlState.highlighted)
        
    }
    func highlightedImage() -> UIImage?{
        
        return image(for: UIControlState.highlighted)
        
    }
    //MARK: - BackgroundImage
    func setNormal(backgroundImage: UIImage?){
        
        self.setBackgroundImage(backgroundImage, for: UIControlState.normal)
        
    }
    func normalBackgroundImage() -> UIImage? {
        return backgroundImage(for: UIControlState.normal)
        
    }
    func setSelected(backgroundImage: UIImage?) {
        self.setBackgroundImage(backgroundImage, for: UIControlState.selected)
        
    }
    func selectedBackgroundImage() -> UIImage?{
        return backgroundImage(for: UIControlState.selected)
        
    }
    func setHighlighted(backgroundImage: UIImage?) {
        self.setBackgroundImage(backgroundImage, for: UIControlState.highlighted)
        
    }
     func highlightedBackgroundImage() -> UIImage?{
        
        return backgroundImage(for: UIControlState.highlighted)
    
    }
    /// 圆角
    ///
    /// - Parameters:
    ///   - borderWidth: 边框宽度
    ///   - borderColor: 边框颜色
    ///   - cornerRadius: 圆角半径
    func set(borderWidth: CGFloat?, borderColor: UIColor?, cornerRadius: CGFloat?) {        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.masksToBounds = true
        layer.borderWidth = borderWidth!
        layer.borderColor = borderColor?.cgColor
        layer.cornerRadius = cornerRadius!
        
    }
     static  func buttonWith(imageName: String?, titleColor: UIColor?, titleFont: UIFont?, backgroundColor: UIColor?, title: String?) -> UIButton {
        let button = UIButton(type: .custom)
        button.backgroundColor = backgroundColor
        if title?.count != nil {
            button.setTitle(title, for: UIControlState.normal);          button.setTitleColor(titleColor, for: UIControlState.normal)
            
        }
        if titleFont != nil {
            button.titleLabel?.font = titleFont
            
        }
        if (imageName?.count) != nil {
            button.setImage(UIImage(named: imageName!), for: UIControlState.normal);            if title?.count != nil {
                button.titleEdgeInsets = UIEdgeInsetsMake(0, UIScreen.main.bounds.size.width / 375, 0, 0)
                button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, UIScreen.main.bounds.size.width / 375)
                
            }
            
        }
        return button
        
    }
    
    static func buttonWith( titleColor: UIColor?, titleFont: UIFont?, backgroundColor: UIColor?, title: String?,cornerRadius:CGFloat) -> UIButton {
        let button = UIButton(type: .custom)
        button.backgroundColor = backgroundColor
        if title?.count != nil {
            button.setTitle(title, for: UIControlState.normal);
            button.setTitleColor(titleColor, for: UIControlState.normal)
            
        }
        if titleFont != nil {
            button.titleLabel?.font = titleFont
            
        }
       button.layer.masksToBounds = true
       button.layer.cornerRadius = cornerRadius
       return button
        
    }

    
}

//
//  PPYWaterFlowLayout.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/27.
//  Copyright © 2018年 YC科技有限公司. All rights reserved.
//

import UIKit
@objc protocol PPYWaterFlowLayoutDelegate : NSObjectProtocol {
    
    func waterFlowLayout(layout : PPYWaterFlowLayout,indexPath : NSIndexPath,itemWidth : CGFloat) -> CGFloat
    @objc optional func columnCountInWaterFlowLayout(layout : PPYWaterFlowLayout) -> Int
    
    @objc optional func columnMarginInWaterFlowLayout(layout : PPYWaterFlowLayout) -> CGFloat
    @objc optional func rowMarginInWaterFlowLayout(layout : PPYWaterFlowLayout) -> CGFloat
    @objc optional func edgeInsetsInWaterFlowLayout(layout : PPYWaterFlowLayout) -> UIEdgeInsets
}
class PPYWaterFlowLayout: UICollectionViewLayout {
   
    weak open var delegate : PPYWaterFlowLayoutDelegate?
    fileprivate let PPYDefaultColumnCount : Int = 3 //默认列数
    fileprivate let PPYDefaultColumnMargin : CGFloat = 10
    fileprivate let PPYDefaultRowMargin : CGFloat = 10
    fileprivate let PPYDefaultEdgeInsets : UIEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
    /*懒加载创建存放属性的数组*/
    fileprivate lazy var attrs : [UICollectionViewLayoutAttributes] = []
    fileprivate lazy var columnHeights : [CGFloat] = []
    fileprivate var contentHeight : CGFloat?
    
    fileprivate func columnCount() -> Int {
        if self.delegate != nil && (self.delegate?.responds(to: #selector(self.delegate?.columnCountInWaterFlowLayout(layout:))))!{
            return (self.delegate?.columnCountInWaterFlowLayout!(layout: self))!
        }else{
            return PPYDefaultColumnCount
        }
    }
    
    fileprivate func columnMargin() -> CGFloat {
        if self.delegate != nil && (self.delegate?.responds(to: #selector(self.delegate?.columnMarginInWaterFlowLayout(layout:))))!{
            return (self.delegate?.columnMarginInWaterFlowLayout!(layout: self))!
        }else{
            return PPYDefaultColumnMargin
        }
    }
    
    fileprivate func rowMargin() -> CGFloat {
        if self.delegate != nil && (self.delegate?.responds(to: #selector(self.delegate?.rowMarginInWaterFlowLayout(layout:))))!{
            return (self.delegate?.rowMarginInWaterFlowLayout!(layout: self))!
        }else{
            return PPYDefaultRowMargin
        }
    }
    
    fileprivate func edgeInsets() -> UIEdgeInsets {
        if self.delegate != nil && (self.delegate?.responds(to: #selector(self.delegate?.edgeInsetsInWaterFlowLayout(layout:))))!{
            return (self.delegate?.edgeInsetsInWaterFlowLayout!(layout: self))!
        }else{
            return PPYDefaultEdgeInsets
        }
    }
    //设置初始化参数
    override func prepare() {
        super.prepare()
        
        if self.collectionView == nil {
            return
        }
        
        self.columnHeights.removeAll()
        self.contentHeight = 0
        
        for  _ in 0 ..< self.columnCount() {
            self.columnHeights.append(self.edgeInsets().top)
        }
        
        self.attrs.removeAll()
        let count : Int = (self.collectionView?.numberOfItems(inSection: 0))!
        let width : CGFloat = (self.collectionView?.frame.size.width)!
        let colMagin = (CGFloat)(self.columnCount() - 1) * self.columnMargin()
        
        let cellWidth : CGFloat = (width - self.edgeInsets().left - self.edgeInsets().right - colMagin) / CGFloat(self.columnCount())
        
        for i in 0 ..< count {
            let indexPath : NSIndexPath = NSIndexPath(item: i, section: 0)
            let attr : UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath as IndexPath)
            
            //获取高度
            let cellHeight : CGFloat =  (self.delegate?.waterFlowLayout(layout: self, indexPath: indexPath as NSIndexPath, itemWidth: cellWidth))!
            
            var minColumnHeight = self.columnHeights[0]
            var minColumn : Int = 0
            for i in 1 ..< self.columnCount() {
                let colHeight = self.columnHeights[i]
                
                if colHeight < minColumnHeight {
                    minColumnHeight = colHeight
                    minColumn = i
                }
            }
            
            let cellX : CGFloat = self.edgeInsets().left + CGFloat(minColumn) * (self.columnMargin() + cellWidth)
            var cellY = minColumnHeight
            if cellY != self.edgeInsets().top {
                cellY = self.rowMargin() + cellY
            }
            
            attr.frame = CGRect(x: cellX, y: cellY, width: cellWidth, height: cellHeight)
            let maxY = cellY + cellHeight;
            
            
            self.columnHeights[minColumn] = maxY
            let maxContentHeight = self.columnHeights[minColumn]
            if CGFloat(self.contentHeight!) < CGFloat(maxContentHeight) {
                self.contentHeight = maxContentHeight
            }
            self.attrs.append(attr)
        }
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.attrs
    }
    
    override var collectionViewContentSize: CGSize{
        get {
            return CGSize(width: 0, height: CGFloat(self.contentHeight!) + CGFloat(self.edgeInsets().bottom))
        }
        set {
            self.collectionViewContentSize = newValue
        }
    }
}

//
//  FSPagerCollectionView.swift
//  FSPagerView
//
//  Created by Wenchao Ding on 24/12/2016.
//  Copyright © 2016 Wenchao Ding. All rights reserved.
//
//  1. Reject -[UIScrollView(UIScrollViewInternal) _adjustContentOffsetIfNecessary]
//  2. Group initialized features

import UIKit

class FSPagerCollectionView: UICollectionView {
    
#if !os(tvOS)
    override var scrollsToTop: Bool {
        set {
            super.scrollsToTop = false
        }
        get {
            return false
        }
    }
#endif
    
    override var contentInset: UIEdgeInsets {
        set {
            super.contentInset = .zero
            if (newValue.top > 0) {
                let contentOffset = CGPoint(x:self.contentOffset.x, y:self.contentOffset.y+newValue.top);
                self.contentOffset = contentOffset
            }
        }
        get {
            return super.contentInset
        }
    }
    
    override init(frame: CGRect, collectionViewLayout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionViewLayout)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    fileprivate func commonInit() {
        self.contentInset = .zero
        self.decelerationRate = .fast
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.isPrefetchingEnabled = false
        self.contentInsetAdjustmentBehavior = .never
#if !os(tvOS)
        self.scrollsToTop = false
        self.isPagingEnabled = false
#endif
    }
    
}

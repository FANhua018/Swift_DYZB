//
//  HomeViewController.swift
//  Swift_DYZB
//
//  Created by ivan on 2018/6/13.
//  Copyright © 2018年 ivan. All rights reserved.
//

import UIKit

private let kTitleViewH:CGFloat = 40
class HomeViewController: UIViewController {

    //MARK:- 懒加载属性
    private lazy var pageTitleView:PageTitleView = {[weak self] in
        let frame = CGRect(x: 0, y: kStatusBarH+kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = PageTitleView(frame: frame, titles: titles)
        titleView.delegate = self
        return titleView
    }()
    
    private lazy var pageContentView:PageContentView = {[weak self] in
        let contentViewH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: kScreenH)
        
        var childVcs = [UIViewController]()
        for _ in 0..<4{
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVcs.append(vc)
        }
        
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        contentView.delegate = self
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置UI界面
        setupUI()
    }
}

// MARK:- 设置UI界面
extension HomeViewController{
    private func setupUI(){
        //不要自动调整ScrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        //1.设置导航栏
        setupNavigationBar()
        
        //2.添加TitleView
        view.addSubview(pageTitleView)
        
        //3.添加ContentView
        view.addSubview(pageContentView)
        pageContentView.backgroundColor = UIColor.purple
    }
    
    private func setupNavigationBar(){
        //设置左侧Item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        //设置右侧Item
        let size = CGSize(width: 40, height: 40)
        
//        let historyBtn = UIButton()
//        historyBtn.setImage(UIImage(named: "image_my_history"), for: .normal)
//        historyBtn.setImage(UIImage(named: "Image_my_history_click"), for: .highlighted)
//        historyBtn.frame = CGRect(origin: CGPoint.zero, size: size)
//        let historyItem = UIBarButtonItem(customView: historyBtn)
//
//        let serachBtn = UIButton()
//        serachBtn.setImage(UIImage(named: "btn_search"), for: .normal)
//        serachBtn.setImage(UIImage(named: "btn_search_clicked"), for: .highlighted)
//        serachBtn.frame = CGRect(origin: CGPoint.zero, size: size)
//        let serachItem = UIBarButtonItem(customView: serachBtn)
//
//        let qrcodeBtn = UIButton()
//        qrcodeBtn.setImage(UIImage(named: "Image_scan"), for: .normal)
//        qrcodeBtn.setImage(UIImage(named: "Image_scan_click"), for: .highlighted)
//        qrcodeBtn.frame = CGRect(origin: CGPoint.zero, size: size)
//        let qrcodeItem = UIBarButtonItem(customView: qrcodeBtn)
        
        //扩展类方法
//        let historyItem = UIBarButtonItem.createItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
//        let serachItem = UIBarButtonItem.createItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
//        let qrcodeItem = UIBarButtonItem.createItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        
        //扩展构造方法
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let serachItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        
        navigationItem.rightBarButtonItems = [historyItem,serachItem,qrcodeItem]
    }
}

//MARK:- 遵守PageTitleViewDelegate协议
extension HomeViewController:PageTitleViewDelegate{
    func pageTitleView(_ titleView: PageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
    }
}

//MARK:- 遵守PageContentViewDelegate协议
extension HomeViewController:PageContentViewDelegate{
    func pageContentView(contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}

//
//  PPYLoginVC.swift
//  swiftProject
//
//  Created by wuyongchao on 2018/10/10.
//  Copyright © 2018年 YC科技有限公司. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
fileprivate let minimalUsernameLength=5
fileprivate let minimalpasswordLength=5

class PPYLoginVC: PPYBaseViewController {

    @IBOutlet weak var usernameOutlet: UITextField!
    
    @IBOutlet weak var passwordOutlet: UITextField!
    
    @IBOutlet weak var usernameValidOutlet: UILabel!
    
    @IBOutlet weak var passwordValidOutlet: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
      // 用户名是否有效
        let usernameValid = usernameOutlet.rx.text.orEmpty
            .map { $0.count >= minimalUsernameLength }
            .share(replay: 1)
        // 密码是否有效
        let passwordValid = passwordOutlet.rx.text.orEmpty
            .map { $0.count >= minimalpasswordLength }
            .share(replay: 1)
        // 所有输入是否有效
        let everythingValid = Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }
            .share(replay: 1)
        // 用户名是否有效 -> 密码输入框是否可用
        usernameValid
            .bind(to: passwordOutlet.rx.isEnabled)
            .disposed(by: disposeBag)
         // 用户名是否有效 -> 用户名提示语是否隐藏
        usernameValid
            .bind(to: usernameValidOutlet.rx.isHidden)
            .disposed(by: disposeBag)
         // 密码是否有效 -> 密码提示语是否隐藏
        passwordValid
            .bind(to: passwordValidOutlet.rx.isHidden)
            .disposed(by: disposeBag)
        // 所有输入是否有效 -> 按钮是否可点击
        everythingValid
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        loginButton.rx.tap
            .subscribe(onNext: { [weak self] _ in self?.showAlert() })
            .disposed(by: disposeBag)
        
    }
    
    @IBAction func loginbtnClick(_ sender: Any) {
        
        
    }
    func showAlert() {
       
        UIAlertController.alert(title: "验证通过", message: "登录成功") {
            let userDefault = UserDefaults.standard
            userDefault.set(self.usernameOutlet.text, forKey: "userName")
            userDefault .synchronize()
            let tabbar = PPYBaseTabBarController.init()
            UIApplication.shared.keyWindow?.rootViewController?=tabbar
        }

    }

}

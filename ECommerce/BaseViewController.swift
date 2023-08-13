//
//  BaseViewController.swift
//  ECommerce
//
//  Created by aditya sharma on 13/08/23.
//

import UIKit

class BaseViewController: UIViewController {
    static let shared = BaseViewController()
//     var rightDrawerTransition: DrawerTransition!
    var userLoginStatus: Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        userLoginStatus = UserDefaults.standard.value(forKey: "isUserLoggedIn") as? Bool

        addMenuBarButton()
        // Do any additional setup after loading the view.
    }

    func addMenuBarButton() {
        //Add SideMenu Button to the Navigation Bar
        let image = UIImage(named: "menu")
        let backItem = UIBarButtonItem(image: image,
                                       style: .plain,
                                       target: self,
                                       action: #selector(leftButton))
        self.navigationItem.leftBarButtonItem = backItem
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.black

        //Add Notification Icon to the Navigation Bar
        let bellImage = UIImage(systemName: "magnifyingglass")
        let bellBtn = UIBarButtonItem(image: bellImage,
                                       style: .plain,
                                       target: self,
                                       action: #selector(rightButton))
        self.navigationItem.rightBarButtonItem = bellBtn
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
//        title = ""

        //Add Navigation Title
//        let titleImage = UIImage(named: "logopng")
//        let imageView = UIImageView(image: titleImage)
//        self.navigationItem.titleView = imageView
    }
    @objc func rightButton() { }
    //MARK: SideMenu Button Action
//        @objc func showSideMenu() {
//
//            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let objVC = storyBoard.instantiateViewController(withIdentifier: "SideMenuVC") as! SideMenuVC
//            objVC.sideMenuDelegate = self
//            let navigationC = UINavigationController(rootViewController: objVC)
//
//            self.rightDrawerTransition = DrawerTransition(target: self, drawer: navigationC)
//            self.rightDrawerTransition.setPresentCompletion {
//                print("11111 PresentCompletion...") }
//            self.rightDrawerTransition.setDismissCompletion {
//                print("22222 DismissCompletion...")
//                self.rightDrawerTransition.dismissDrawerViewController(animated: true)
//            }
//            self.rightDrawerTransition.edgeType = .left
//            self.rightDrawerTransition.presentDrawerViewController(animated: true)
//        }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
    }


    //MARK: Notification Button Action
    @objc func leftButton() {

//        let objVC = self.storyboard!.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
//            self.navigationController?.pushViewController(objVC, animated: true)
          }

    //MARK: navigateToHomePage Function to manage SideMenu Button's Navigation
//    func navigateToHomePage(_indexath indexath: IndexPath) {
//        self.rightDrawerTransition.dismissDrawerViewController(animated: true)
//        switch indexath.row {
//        case 0 :
//            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//            let objVC = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//            self.navigationController?.pushViewController(objVC, animated: true)
//        case 1:
//
//            if userLoginStatus ?? false {
//                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//                let objVC = storyBoard.instantiateViewController(withIdentifier: "TransPortViewController") as! TransPortViewController
//                self.navigationController?.pushViewController(objVC, animated: true)
//                    }else{
//                        self.navigateToLogin()
//                    }
////            let loginValue = UserDefaults.standard.value(forKey: "LOGINUSERID")
////            if loginValue as! Int != 0 {
////                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
////                let viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
////                let navViewController = UINavigationController(rootViewController: viewController)
////                UIApplication.shared.windows.first?.rootViewController = navViewController
////                UIApplication.shared.windows.first?.makeKeyAndVisible()
////
////            }else {
////                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
////                let objVC = storyBoard.instantiateViewController(withIdentifier: "TransPortViewController") as! TransPortViewController
////                self.navigationController?.pushViewController(objVC, animated: true)
////            }
//
//        case 2:
//            if userLoginStatus ?? false {
//                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//                let objVC = storyBoard.instantiateViewController(withIdentifier: "BookingDetailVC") as! BookingDetailVC
//                self.navigationController?.pushViewController(objVC, animated: true)
//                    }else{
//                        self.navigateToLogin()
//                    }
//        case 3:
//            if userLoginStatus ?? false {
//                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//                let objVC = storyBoard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
//                self.navigationController?.pushViewController(objVC, animated: true)
//                    }else{
//                        self.navigateToLogin()
//                    }
//        case 4:
//            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//            let objVC = storyBoard.instantiateViewController(withIdentifier: "PrivacyViewController") as! PrivacyViewController
//            self.navigationController?.pushViewController(objVC, animated: true)
//        case 5:
////            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//            let objVC = self.storyboard!.instantiateViewController(withIdentifier: "TermsViewController") as! TermsViewController
//            self.navigationController?.pushViewController(objVC, animated: true)
//        case 6:
//            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//            let objVC = storyBoard.instantiateViewController(withIdentifier: "VisitViewController") as! VisitViewController
//            self.navigationController?.pushViewController(objVC, animated: true)
//        case 7:
//            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//            let objVC = storyBoard.instantiateViewController(withIdentifier: "SubscriptionDetailViewController") as! SubscriptionDetailViewController
//            self.navigationController?.pushViewController(objVC, animated: true)
//        case 8:
//            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//            let objVC = storyBoard.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
//            self.navigationController?.pushViewController(objVC, animated: true)
//
//        default:
//            print("default case ")
//        }
//
//        }
//    func navigateToLogin() {
//
//        let rootVC = (UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController)!
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let navigationBar = UINavigationController(rootViewController: rootVC)
//        navigationBar.setNavigationBarHidden(true, animated: true)
//        UIApplication.shared.windows.first?.rootViewController = navigationBar
//        UIApplication.shared.windows.first?.makeKeyAndVisible()
//
//    }
//    func gotoHomeScreen() {
//        let rootVC = (UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController)!
//        _ = UIApplication.shared.delegate as! AppDelegate
//        let navigationBar = UINavigationController(rootViewController: rootVC)
//        navigationBar.setNavigationBarHidden(true, animated: true)
//        UIApplication.shared.windows.first?.rootViewController = navigationBar
//        UIApplication.shared.windows.first?.makeKeyAndVisible()
//    }
}
extension String {

    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

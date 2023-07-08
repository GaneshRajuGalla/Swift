//
//  ViewController.swift
//  PropertyWrapper
//
//  Created by Ganesh on 08/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    private let imageView:UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let bgView:UIView = {
        let bgView = UIView()
        return bgView
    }()
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ///with @(PropertyWrapper)
        let user = UserModel(firstName: "ganesh", lastName: "galla")
        print(user.firstName)
        print(user.lastName)
        print(user.$firstName)
        print(user.$lastName)
        
        ///without @(PropertyWrapper)
        let newWrapper = WrappedUserModel(firstName: "ios", lastName: "developer")
        print(newWrapper.firstName)
        print(newWrapper.lastName)
        
        ///Get PlainUserDefaultsBacked
        print(UserDefaultsDataSource.isFirstLaunch)
        print(UserDefaultsDataSource.userName)
        print(UserDefaultsDataSource.counter)
        
        ///Set PlainUserDefaultsBacked
        UserDefaultsDataSource.isFirstLaunch = false
        UserDefaultsDataSource.userName = "galla"
        UserDefaultsDataSource.counter += 1
        
        ///Get PlainUserDefaultsBacked
        print(UserDefaultsDataSource.isFirstLaunch)
        print(UserDefaultsDataSource.userName)
        print(UserDefaultsDataSource.counter)
        
        ///CodableUserDefaultsBacked
        print(UserDefaultsDataSource.notes)
        UserDefaultsDataSource.notes = [NoteModel(title: "First Note")]
        print(UserDefaultsDataSource.notes)
        
        UserDefaultsDataSource.notes?.append(NoteModel(title: "Second Note"))
        print(UserDefaultsDataSource.notes)
        
        ///ImageAsset
        imageView.image = Assets.menuIcon
        imageView.image = Assets.plusIcon
        imageView.image = Assets.searchIcon
        imageView.image = Assets.settingIcon
        
        ///Color
        bgView.backgroundColor = Colors.mainRed2
        let lightColor:UIColor = Colors.$mainRed2.light
        let darkColor:UIColor = Colors.$mainRed2.dark
        
    }
}




//
//  RepositoryManageObject.swift
//  GetFavReposFromGithub
//
//  Created by NewMac on 12/5/22.
//

import Foundation
import CoreData

@objc(Repository)
class RepositoryManageObject: NSManagedObject {
    @NSManaged var name: String
}

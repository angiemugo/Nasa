//
//  CoordinatorTests.swift
//  NasaTests
//
//  Created by Angie Mugo on 24/11/2021.
//

import Foundation
import XCTest
@testable import Nasa

class TestCoordinator: XCTestCase {
    var sut: NasaCoordinator?

    override func setUp() {
        super.setUp()
        let nav = UINavigationController()
        sut = NasaCoordinator(nav)
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testHasNavigation() {
        guard let nav = sut?.navigationController else {
            return
        }
        XCTAssertEqual(nav.viewControllers.count, 0)
    }

    func testRoot() {
        let vc = sut?.start()
        XCTAssert(vc is ImagesListViewController)
    }

    func testRoutesToItem() {
        let item = UIModel(imageUrl: "ARC-2002-ACD02-0056-22",
                           title: "Tom Trower | 02 Mar, 20",
                           subtitle: "https://images-assets.nasa.gov/image/ARC-2002-ACD02-0056-22/ARC-2002-ACD02-0056-22~thumb.jpg",
                           description: "VSHAIP test in 7x10ft#1 W.T. (multiple model configruations) V-22 helicopter shipboard aerodynamic interaction program: L-R seated Allen Wadcox, (standind) Mark Betzina, seated in front of computer Gloria Yamauchi, in background Kurt Long.")
        guard let nav = sut?.navigationController else {
            return
        }
        sut?.showDetail(item, nav)
        XCTAssert(nav.viewControllers.last is ImageDetailViewController)
        let lastVC = nav.viewControllers.last as! ImageDetailViewController
        XCTAssertEqual(lastVC.model.title, item.title)
        XCTAssertEqual(lastVC.model.subtitle, item.subtitle)
        XCTAssertEqual(lastVC.model.imageUrl, item.imageUrl)
        XCTAssertEqual(lastVC.model.description, item.description)
    }
}

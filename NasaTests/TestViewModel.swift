//
//  TestViewModel.swift
//  NasaTests
//
//  Created by Angie Mugo on 23/11/2021.
//

import Foundation
import XCTest
@testable import Nasa

class TestViewModel: XCTestCase {
    var sut: ImagesListViewModel?
    var mockClient: MockAPIClient?

    override func setUp() {
        super.setUp()
        mockClient = MockAPIClient()
        let dataSource = MockRemoteDataSource(mockClient!)
        sut = ImagesListViewModel(dataSource)
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testGetItems() {
        mockClient?.fetchSuccess = true
        sut?.fetch()
        let items = sut?.items.value
        let firstItem = items!.first!
        XCTAssertEqual(items?.count, 4)
        XCTAssertEqual(firstItem.title, "ARC-2002-ACD02-0056-22")
        XCTAssertEqual(firstItem.subtitle, "Tom Trower | 02 Mar, 20")
        XCTAssertEqual(firstItem.imageUrl, "https://images-assets.nasa.gov/image/ARC-2002-ACD02-0056-22/ARC-2002-ACD02-0056-22~thumb.jpg")
        XCTAssertEqual(firstItem.description, "VSHAIP test in 7x10ft#1 W.T. (multiple model configruations) V-22 helicopter shipboard aerodynamic interaction program: L-R seated Allen Wadcox, (standind) Mark Betzina, seated in front of computer Gloria Yamauchi, in background Kurt Long.")
    }

    func testFailure() {
        sut?.fetch()
        let items = sut?.items.value
        XCTAssertEqual(items?.count, 0)
    }
}

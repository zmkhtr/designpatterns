//
//  designpatternsTests.swift
//  designpatternsTests
//
//  Created by Azam Mukhtar on 09/12/20.
//

import XCTest
@testable import designpatterns

class designpatternsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCourseViewModel() {
        let viewModel = MainViewModel()
        var memeFromApiService = [Meme]()
        var memeFromViewModel = [Meme]()
        ApiService().getMemesData { (result) in
            switch result {
            case .success(let meme):
                memeFromApiService = meme.memes
            case .failure(_):
                break
            }
        }
        
        viewModel.fetchMemes {
            memeFromViewModel = viewModel.memes
        }
        
        XCTAssertEqual(memeFromApiService, memeFromViewModel)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

@testable import AdaptiveCards
import AdaptiveCards_bridge
import XCTest

class ViewTests: XCTestCase {
    var imageView: ACRBackgroundImageView!
    
    override func setUp() {
        super.setUp()
<<<<<<< HEAD
        imageView = ACRBackgroundImageView()
    }
    
    // Test Cases are named as testBGImage<fillmode><horizontalAlignment><verticalAlignment>
=======
        imageView = ACRBackgroundImageView(frame: NSRect(x: 0, y: 0, width: 200, height: 600))
    }
    
    // Test Cases are named as testBGImage<fillmode><horizontalAlignment><verticalAlignment>
    // Test Image dimensions are 100x57, so all calculations are done accordingly
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    
    func testBGImageCoverLeftTop() {
        imageView.fillMode = .cover
        imageView.horizontalAlignment = .left
        imageView.verticalAlignment = .top
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = CGFloat(0)
        let yOrigin = CGFloat(0)
        XCTAssertEqual(imageLayer.frame.minX, xOrigin)
        XCTAssertEqual(imageLayer.frame.minY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.minX, 0)
        XCTAssertEqual(imageLayer.frame.minY, 0)
        // 1052.63 in the next line is because when the image of height (57) is increased to 600, the proportional new width is 1052.63
        XCTAssertEqual(imageLayer.frame.width, 1052.6315789473686)
        XCTAssertEqual(imageLayer.frame.height,600)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageCoverLeftBottom() {
        imageView.fillMode = .cover
        imageView.horizontalAlignment = .left
        imageView.verticalAlignment = .bottom
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = CGFloat(0)
        let yOrigin = imageView.layer?.bounds.maxY
        XCTAssertEqual(imageLayer.frame.minX, xOrigin)
        XCTAssertEqual(imageLayer.frame.maxY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 1052.6315789473686)
        XCTAssertEqual(imageLayer.frame.height, 600)
        XCTAssertEqual(imageLayer.frame.minX, 0)
        XCTAssertEqual(imageLayer.frame.maxY, 600)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageCoverLeftCenter() {
        imageView.fillMode = .cover
        imageView.horizontalAlignment = .left
        imageView.verticalAlignment = .center
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = CGFloat(0)
        let yOrigin = imageView.layer?.frame.midY
        XCTAssertEqual(imageLayer.frame.minX, xOrigin)
        XCTAssertEqual(imageLayer.frame.midY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 1052.6315789473686)
        XCTAssertEqual(imageLayer.frame.height, 600)
        XCTAssertEqual(imageLayer.frame.minX, 0)
        XCTAssertEqual(imageLayer.frame.maxY, 600)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageCoverRightTop() {
        imageView.fillMode = .cover
        imageView.horizontalAlignment = .right
        imageView.verticalAlignment = .top
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.bounds.maxX
        let yOrigin = CGFloat(0)
        XCTAssertEqual(imageLayer.frame.maxX, xOrigin)
        XCTAssertEqual(imageLayer.frame.minY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 1052.6315789473686)
        XCTAssertEqual(imageLayer.frame.height, 600)
        XCTAssertEqual(imageLayer.frame.maxX, 200)
        XCTAssertEqual(imageLayer.frame.minY, 0)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageCoverRightBottom() {
        imageView.fillMode = .cover
        imageView.horizontalAlignment = .right
        imageView.verticalAlignment = .bottom
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.bounds.maxX
        let yOrigin = imageView.layer?.bounds.maxY
        XCTAssertEqual(imageLayer.frame.maxX, xOrigin)
        XCTAssertEqual(imageLayer.frame.maxY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 1052.6315789473686)
        XCTAssertEqual(imageLayer.frame.height, 600)
        XCTAssertEqual(imageLayer.frame.maxX, 200)
        XCTAssertEqual(imageLayer.frame.maxY, 600)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageCoverRightCenter() {
        imageView.fillMode = .cover
        imageView.horizontalAlignment = .right
        imageView.verticalAlignment = .center
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.bounds.maxX
        let yOrigin = imageView.layer?.frame.midY
        XCTAssertEqual(imageLayer.frame.maxX, xOrigin)
        XCTAssertEqual(imageLayer.frame.midY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 1052.6315789473686)
        XCTAssertEqual(imageLayer.frame.height, 600)
        XCTAssertEqual(imageLayer.frame.maxX, 200)
        XCTAssertEqual(imageLayer.frame.midY, 300)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageCoverCenterTop() {
        imageView.fillMode = .cover
        imageView.horizontalAlignment = .center
        imageView.verticalAlignment = .top
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.frame.midX
        let yOrigin = CGFloat(0)
        XCTAssertEqual(imageLayer.frame.midX, xOrigin)
        XCTAssertEqual(imageLayer.frame.minY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 1052.6315789473686)
        XCTAssertEqual(imageLayer.frame.height, 600)
        XCTAssertEqual(imageLayer.frame.midX, 100)
        XCTAssertEqual(imageLayer.frame.minY, 0)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageCoverCenterBottom() {
        imageView.fillMode = .cover
        imageView.horizontalAlignment = .center
        imageView.verticalAlignment = .bottom
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.frame.midX
        let yOrigin = imageView.layer?.bounds.maxY
        XCTAssertEqual(imageLayer.frame.midX, xOrigin)
        XCTAssertEqual(imageLayer.frame.maxY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 1052.6315789473686)
        XCTAssertEqual(imageLayer.frame.height, 600)
        XCTAssertEqual(imageLayer.frame.midX, 100)
        XCTAssertEqual(imageLayer.frame.maxY, 600)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageCoverCenterCenter() {
        imageView.fillMode = .cover
        imageView.horizontalAlignment = .center
        imageView.verticalAlignment = .center
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.frame.midX
        let yOrigin = imageView.layer?.frame.midY
        XCTAssertEqual(imageLayer.frame.midX, xOrigin)
        XCTAssertEqual(imageLayer.frame.midY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 1052.6315789473686)
        XCTAssertEqual(imageLayer.frame.height, 600)
        XCTAssertEqual(imageLayer.frame.midX, 100)
        XCTAssertEqual(imageLayer.frame.midY, 300)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRpthorizontallyLeftTop() {
        imageView.fillMode = .repeatHorizontally
        imageView.horizontalAlignment = .left
        imageView.verticalAlignment = .top
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = CGFloat(0)
        let yOrigin = CGFloat(0)
        XCTAssertEqual(imageLayer.frame.minX, xOrigin)
        XCTAssertEqual(imageLayer.frame.minY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 300)
        XCTAssertEqual(imageLayer.frame.height, 57)
        XCTAssertEqual(imageLayer.frame.minX, 0)
        XCTAssertEqual(imageLayer.frame.maxY, 57)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRpthorizontallyLeftBottom() {
        imageView.fillMode = .repeatHorizontally
        imageView.horizontalAlignment = .left
        imageView.verticalAlignment = .bottom
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = CGFloat(0)
        let yOrigin = imageView.layer?.bounds.maxY
        XCTAssertEqual(imageLayer.frame.minX, xOrigin)
        XCTAssertEqual(imageLayer.frame.maxY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 300)
        XCTAssertEqual(imageLayer.frame.height, 57)
        XCTAssertEqual(imageLayer.frame.minX, 0)
        XCTAssertEqual(imageLayer.frame.maxY, 600)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRpthorizontallyLeftCenter() {
        imageView.fillMode = .repeatHorizontally
        imageView.horizontalAlignment = .left
        imageView.verticalAlignment = .center
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = CGFloat(0)
        let yOrigin = imageView.layer?.frame.midY
        XCTAssertEqual(imageLayer.frame.minX, xOrigin)
        XCTAssertEqual(imageLayer.frame.midY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 300)
        XCTAssertEqual(imageLayer.frame.height, 57)
        XCTAssertEqual(imageLayer.frame.minX, 0)
        XCTAssertEqual(imageLayer.frame.midY, 300)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRpthorizontallyRightTop() {
        imageView.fillMode = .repeatHorizontally
        imageView.horizontalAlignment = .right
        imageView.verticalAlignment = .top
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.bounds.maxX
        let yOrigin = CGFloat(0)
        XCTAssertEqual(imageLayer.frame.maxX, xOrigin)
        XCTAssertEqual(imageLayer.frame.minY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 300)
        XCTAssertEqual(imageLayer.frame.height, 57)
        XCTAssertEqual(imageLayer.frame.maxX, 200)
        XCTAssertEqual(imageLayer.frame.minY, 0)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRpthorizontallyRightBottom() {
        imageView.fillMode = .repeatHorizontally
        imageView.horizontalAlignment = .right
        imageView.verticalAlignment = .bottom
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.bounds.maxX
        let yOrigin = imageView.layer?.bounds.maxY
        XCTAssertEqual(imageLayer.frame.maxX, xOrigin)
        XCTAssertEqual(imageLayer.frame.maxY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 300)
        XCTAssertEqual(imageLayer.frame.height,57)
        XCTAssertEqual(imageLayer.frame.maxX, 200)
        XCTAssertEqual(imageLayer.frame.maxY, 600)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRpthorizontallyRightCenter() {
        imageView.fillMode = .repeatHorizontally
        imageView.horizontalAlignment = .right
        imageView.verticalAlignment = .center
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.bounds.maxX
        let yOrigin = imageView.layer?.frame.midY
        XCTAssertEqual(imageLayer.frame.maxX, xOrigin)
        XCTAssertEqual(imageLayer.frame.midY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 300)
        XCTAssertEqual(imageLayer.frame.height,57)
        XCTAssertEqual(imageLayer.frame.maxX, 200)
        XCTAssertEqual(imageLayer.frame.midY, 300)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRpthorizontallyCenterTop() {
        imageView.fillMode = .repeatHorizontally
        imageView.horizontalAlignment = .center
        imageView.verticalAlignment = .top
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.frame.midX
        let yOrigin = CGFloat(0)
        XCTAssertEqual(imageLayer.frame.midX, xOrigin)
        XCTAssertEqual(imageLayer.frame.minY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 300)
        XCTAssertEqual(imageLayer.frame.height,57)
        XCTAssertEqual(imageLayer.frame.midX, 100)
        XCTAssertEqual(imageLayer.frame.minY, 0)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRpthorizontallyCenterBottom() {
        imageView.fillMode = .repeatHorizontally
        imageView.horizontalAlignment = .center
        imageView.verticalAlignment = .bottom
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.frame.midX
        let yOrigin = imageView.layer?.bounds.maxY
        XCTAssertEqual(imageLayer.frame.midX, xOrigin)
        XCTAssertEqual(imageLayer.frame.maxY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 300)
        XCTAssertEqual(imageLayer.frame.height,57)
        XCTAssertEqual(imageLayer.frame.midX, 100)
        XCTAssertEqual(imageLayer.frame.maxY, 600)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRpthorizontallyCenterCenter() {
        imageView.fillMode = .repeatHorizontally
        imageView.horizontalAlignment = .center
        imageView.verticalAlignment = .center
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.frame.midX
        let yOrigin = imageView.layer?.frame.midY
        XCTAssertEqual(imageLayer.frame.midX, xOrigin)
        XCTAssertEqual(imageLayer.frame.midY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 300)
        XCTAssertEqual(imageLayer.frame.height,57)
        XCTAssertEqual(imageLayer.frame.midX, 100)
        XCTAssertEqual(imageLayer.frame.midY, 300)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRptverticallyLeftTop() {
        imageView.fillMode = .repeatVertically
        imageView.horizontalAlignment = .left
        imageView.verticalAlignment = .top
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = CGFloat(0)
        let yOrigin = CGFloat(0)
        XCTAssertEqual(imageLayer.frame.minX, xOrigin)
        XCTAssertEqual(imageLayer.frame.minY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 100)
        XCTAssertEqual(imageLayer.frame.height, 657)
        XCTAssertEqual(imageLayer.frame.minX, 0)
        XCTAssertEqual(imageLayer.frame.minY, 0)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRptverticallyLeftBottom() {
        imageView.fillMode = .repeatVertically
        imageView.horizontalAlignment = .left
        imageView.verticalAlignment = .bottom
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = CGFloat(0)
        let yOrigin = imageView.layer?.bounds.maxY
        XCTAssertEqual(imageLayer.frame.minX, xOrigin)
        XCTAssertEqual(imageLayer.frame.maxY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 100)
        XCTAssertEqual(imageLayer.frame.height, 657)
        XCTAssertEqual(imageLayer.frame.minX, 0)
        XCTAssertEqual(imageLayer.frame.maxY, 630)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRptverticallyLeftCenter() {
        imageView.fillMode = .repeatVertically
        imageView.horizontalAlignment = .left
        imageView.verticalAlignment = .center
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = CGFloat(0)
        let yOrigin = imageView.layer?.frame.midY
        XCTAssertEqual(imageLayer.frame.minX, xOrigin)
        XCTAssertEqual(imageLayer.frame.midY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 100)
        XCTAssertEqual(imageLayer.frame.height,657)
        XCTAssertEqual(imageLayer.frame.minX, 0)
        XCTAssertEqual(imageLayer.frame.midY, 315)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRptverticallyRightTop() {
        imageView.fillMode = .repeatVertically
        imageView.horizontalAlignment = .right
        imageView.verticalAlignment = .top
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.bounds.maxX
        let yOrigin = CGFloat(0)
        XCTAssertEqual(imageLayer.frame.maxX, xOrigin)
        XCTAssertEqual(imageLayer.frame.minY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 100)
        XCTAssertEqual(imageLayer.frame.height,657)
        XCTAssertEqual(imageLayer.frame.maxX, 200)
        XCTAssertEqual(imageLayer.frame.minY, 0)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRptverticallyRightBottom() {
        imageView.fillMode = .repeatVertically
        imageView.horizontalAlignment = .right
        imageView.verticalAlignment = .bottom
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.bounds.maxX
        let yOrigin = imageView.layer?.bounds.maxY
        XCTAssertEqual(imageLayer.frame.maxX, xOrigin)
        XCTAssertEqual(imageLayer.frame.maxY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 100)
        XCTAssertEqual(imageLayer.frame.height,657)
        XCTAssertEqual(imageLayer.frame.maxX, 200)
        XCTAssertEqual(imageLayer.frame.maxY, 630)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRptverticallyRightCenter() {
        imageView.fillMode = .repeatVertically
        imageView.horizontalAlignment = .right
        imageView.verticalAlignment = .center
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.bounds.maxX
        let yOrigin = imageView.layer?.frame.midY
        XCTAssertEqual(imageLayer.frame.maxX, xOrigin)
        XCTAssertEqual(imageLayer.frame.midY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 100)
        XCTAssertEqual(imageLayer.frame.height,657)
        XCTAssertEqual(imageLayer.frame.maxX, 200)
        XCTAssertEqual(imageLayer.frame.midY, 315)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRptverticallyCenterTop() {
        imageView.fillMode = .repeatVertically
        imageView.horizontalAlignment = .center
        imageView.verticalAlignment = .top
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.frame.midX
        let yOrigin = CGFloat(0)
        XCTAssertEqual(imageLayer.frame.midX, xOrigin)
        XCTAssertEqual(imageLayer.frame.minY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 100)
        XCTAssertEqual(imageLayer.frame.height,657)
        XCTAssertEqual(imageLayer.frame.midX, 100)
        XCTAssertEqual(imageLayer.frame.minY, 0)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRptverticallyCenterBottom() {
        imageView.fillMode = .repeatVertically
        imageView.horizontalAlignment = .center
        imageView.verticalAlignment = .bottom
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.frame.midX
        let yOrigin = imageView.layer?.bounds.maxY
        XCTAssertEqual(imageLayer.frame.midX, xOrigin)
        XCTAssertEqual(imageLayer.frame.maxY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 100)
        XCTAssertEqual(imageLayer.frame.height, 657)
        XCTAssertEqual(imageLayer.frame.midX, 100)
        XCTAssertEqual(imageLayer.frame.maxY, 630)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRptverticallyCenterCenter() {
        imageView.fillMode = .repeatVertically
        imageView.horizontalAlignment = .center
        imageView.verticalAlignment = .center
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.frame.midX
        let yOrigin = imageView.layer?.frame.midY
        XCTAssertEqual(imageLayer.frame.midX, xOrigin)
        XCTAssertEqual(imageLayer.frame.midY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 100)
        XCTAssertEqual(imageLayer.frame.height,657)
        XCTAssertEqual(imageLayer.frame.midX, 100)
        XCTAssertEqual(imageLayer.frame.midY, 315)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRepeatLeftTop() {
        imageView.fillMode = .repeat
        imageView.horizontalAlignment = .left
        imageView.verticalAlignment = .top
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = CGFloat(0)
        let yOrigin = CGFloat(0)
        XCTAssertEqual(imageLayer.frame.minX, xOrigin)
        XCTAssertEqual(imageLayer.frame.minY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 300)
        XCTAssertEqual(imageLayer.frame.height,657)
        XCTAssertEqual(imageLayer.frame.minX, 0)
        XCTAssertEqual(imageLayer.frame.minY, 0)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRepeatLeftBottom() {
        imageView.fillMode = .repeat
        imageView.horizontalAlignment = .left
        imageView.verticalAlignment = .bottom
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = CGFloat(0)
        let yOrigin = imageView.layer?.bounds.maxY
        XCTAssertEqual(imageLayer.frame.minX, xOrigin)
        XCTAssertEqual(imageLayer.frame.maxY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 300)
        XCTAssertEqual(imageLayer.frame.height,657)
        XCTAssertEqual(imageLayer.frame.minX, 0)
        XCTAssertEqual(imageLayer.frame.maxY, 630)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRepeatLeftCenter() {
        imageView.fillMode = .repeat
        imageView.horizontalAlignment = .left
        imageView.verticalAlignment = .center
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = CGFloat(0)
        let yOrigin = imageView.layer?.frame.midY
        XCTAssertEqual(imageLayer.frame.minX, xOrigin)
        XCTAssertEqual(imageLayer.frame.midY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 300)
        XCTAssertEqual(imageLayer.frame.height,657)
        XCTAssertEqual(imageLayer.frame.minX, 0)
        XCTAssertEqual(imageLayer.frame.midY, 315)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRepeatRightTop() {
        imageView.fillMode = .repeat
        imageView.horizontalAlignment = .right
        imageView.verticalAlignment = .top
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.bounds.maxX
        let yOrigin = CGFloat(0)
        XCTAssertEqual(imageLayer.frame.maxX, xOrigin)
        XCTAssertEqual(imageLayer.frame.minY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 300)
        XCTAssertEqual(imageLayer.frame.height,657)
        XCTAssertEqual(imageLayer.frame.maxX, 200)
        XCTAssertEqual(imageLayer.frame.minY, 0)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRepeatRightBottom() {
        imageView.fillMode = .repeat
        imageView.horizontalAlignment = .right
        imageView.verticalAlignment = .bottom
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.bounds.maxX
        let yOrigin = imageView.layer?.bounds.maxY
        XCTAssertEqual(imageLayer.frame.maxX, xOrigin)
        XCTAssertEqual(imageLayer.frame.maxY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 300)
        XCTAssertEqual(imageLayer.frame.height,657)
        XCTAssertEqual(imageLayer.frame.maxX, 200)
        XCTAssertEqual(imageLayer.frame.maxY, 630)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRepeatRightCenter() {
        imageView.fillMode = .repeat
        imageView.horizontalAlignment = .right
        imageView.verticalAlignment = .center
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.bounds.maxX
        let yOrigin = imageView.layer?.frame.midY
        XCTAssertEqual(imageLayer.frame.maxX, xOrigin)
        XCTAssertEqual(imageLayer.frame.midY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 300)
        XCTAssertEqual(imageLayer.frame.height,657)
        XCTAssertEqual(imageLayer.frame.maxX, 200)
        XCTAssertEqual(imageLayer.frame.midY, 315)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRepeatCenterTop() {
        imageView.fillMode = .repeat
        imageView.horizontalAlignment = .center
        imageView.verticalAlignment = .top
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.frame.midX
        let yOrigin = CGFloat(0)
        XCTAssertEqual(imageLayer.frame.midX, xOrigin)
        XCTAssertEqual(imageLayer.frame.minY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 300)
        XCTAssertEqual(imageLayer.frame.height,657)
        XCTAssertEqual(imageLayer.frame.midX, 100)
        XCTAssertEqual(imageLayer.frame.minY, 0)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRepeatCenterBottom() {
        imageView.fillMode = .repeat
        imageView.horizontalAlignment = .center
        imageView.verticalAlignment = .bottom
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.frame.midX
        let yOrigin = imageView.layer?.bounds.maxY
        XCTAssertEqual(imageLayer.frame.midX, xOrigin)
        XCTAssertEqual(imageLayer.frame.maxY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 300)
        XCTAssertEqual(imageLayer.frame.height,657)
        XCTAssertEqual(imageLayer.frame.midX, 100)
        XCTAssertEqual(imageLayer.frame.maxY, 630)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    func testBGImageRepeatCenterCenter() {
        imageView.fillMode = .repeat
        imageView.horizontalAlignment = .center
        imageView.verticalAlignment = .center
<<<<<<< HEAD
        imageView.bgimage = getImageFile()
        let imageLayer = getImageLayer()
        let xOrigin = imageView.layer?.frame.midX
        let yOrigin = imageView.layer?.frame.midY
        XCTAssertEqual(imageLayer.frame.midX, xOrigin)
        XCTAssertEqual(imageLayer.frame.midY, yOrigin)
=======
        imageView.image = getImageFile()
        let imageLayer = getImageLayer()
        XCTAssertEqual(imageLayer.frame.width, 300)
        XCTAssertEqual(imageLayer.frame.height,657)
        XCTAssertEqual(imageLayer.frame.midX, 100)
        XCTAssertEqual(imageLayer.frame.midY, 315)
>>>>>>> 21bcfc368e494b635238d907f416c71571101082
    }
    
    
    private func getImageFile() -> NSImage {
        guard let bundle = Bundle(identifier: "com.test.test.AdaptiveCards"),
              let path = bundle.path(forResource: "cisco", ofType: "jpg") else {
            logError("Image Not Found")
            return NSImage()
        }
        let image = NSImage(byReferencing: URL(fileURLWithPath: path))
        return image
    }
    
    private func getImageLayer() -> CALayer {
        guard let imageLayer = imageView.layer?.sublayers?.first else { fatalError() }
        return imageLayer
    }
}

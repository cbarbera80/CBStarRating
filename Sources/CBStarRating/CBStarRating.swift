import UIKit

public class RatingStarsView: UIView {
    
    public var cornerRadius: CGFloat {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var rotation: CGFloat {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var rating: CGFloat {
        didSet {
            setNeedsDisplay()
        }
    }
   
    private let totalStars: Int
    private let starSize: CGFloat
    private let starSpacing: CGFloat
    private let fillColor: UIColor
    private let emptyColor: UIColor
    
    public init(
        totalStars: Int = 5,
        starSize: CGFloat = 20,
        starSpacing: CGFloat = 5,
        cornerRadius: CGFloat = 1,
        rotation: CGFloat = 54,
        rating: CGFloat = 0,
        fillColor: UIColor = .red,
        emptyColor: UIColor = .gray
    ) {
        self.totalStars = totalStars
        self.starSize = starSize
        self.starSpacing = starSpacing
        self.cornerRadius = cornerRadius
        self.rotation = rotation
        self.rating = rating
        self.fillColor = fillColor
        self.emptyColor = emptyColor
        super.init(frame: .zero)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override var intrinsicContentSize: CGSize {
        let totalWidth = CGFloat(totalStars) * starSize + CGFloat(totalStars - 1) * starSpacing
        return CGSize(width: totalWidth, height: starSize)
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        for i in 0..<totalStars {
            let dx = CGFloat(i) * (starSize + starSpacing)
            guard let context = UIGraphicsGetCurrentContext() else { return }
            context.saveGState()
            context.translateBy(x: dx, y: 0)
            
            let starRect = CGRect(x: 0, y: 0, width: starSize, height: starSize)
            let path = self.starPathInRect(rect: starRect)
            emptyColor.setFill()
            path.fill()
            
            let activeWidth = starSize * (rating - CGFloat(i))
            
            if activeWidth > 0 {
                context.clip(to: CGRect(x: 0, y: 0, width: min(activeWidth, starSize), height: starSize))
                fillColor.setFill()
                path.fill()
            }
            
            context.restoreGState()
        }
    }
    
    private func starPathInRect(rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath()
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let r = rect.width / 2
        let rc = cornerRadius
        let rn = r * 0.95 - rc
        
        var cangle = rotation
        for i in 1 ... 5 {
            // compute center point of tip arc
            let cc = CGPoint(x: center.x + rn * cos(cangle * .pi / 180), y: center.y + rn * sin(cangle * .pi / 180))
            
            // compute tangent point along tip arc
            let p = CGPoint(x: cc.x + rc * cos((cangle - 72) * .pi / 180), y: cc.y + rc * sin((cangle - 72) * .pi / 180))
            
            if i == 1 {
                path.move(to: p)
            } else {
                path.addLine(to: p)
            }
            
            // add 144 degree arc to draw the corner
            path.addArc(withCenter: cc, radius: rc, startAngle: (cangle - 72) * .pi / 180, endAngle: (cangle + 72) * .pi / 180, clockwise: true)
            
            cangle += 144
        }
        
        path.close()
        return path
    }
}

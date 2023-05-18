
import UIKit

class ViewController: UIViewController {

    lazy var square = {
        let view = UIView(frame: CGRect(x: view.center.x, y: view.center.y, width: 100, height: 100))
        
        view.layer.cornerRadius = 16
        view.backgroundColor = .systemBlue
        
        return view
    }()
    
    private var animator: UIDynamicAnimator!
    private var snap: UISnapBehavior!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        addSubviews()
        
        animator = UIDynamicAnimator(referenceView: self.view)

        let singleTap = UITapGestureRecognizer(target: self, action: #selector(changePositionSquare))
        view.addGestureRecognizer(singleTap)
    }
    
    func addSubviews() {
        view.addSubview(square)
    }
    
    func setupLayout() {
        view.backgroundColor = .white
    }

    @objc func changePositionSquare(sender: UITapGestureRecognizer) {
        let tapPoint: CGPoint = sender.location(in: view)
               
        if snap != nil {
            animator.removeBehavior(snap)
        }

        snap = UISnapBehavior(item: square, snapTo: tapPoint)
        animator.addBehavior(snap)
    }
    
//    func setupConstraints() {
//        NSLayoutConstraint.activate([
//            square.widthAnchor.constraint(equalToConstant: 100),
//            square.heightAnchor.constraint(equalToConstant: 100),
//            square.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            square.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//        ])
//    }
    
//    func simpleAnimation(sender: UITapGestureRecognizer) {
//        let startPoint = square.center
//        let finishPoint = sender.location(in: nil)
//        let angle = calculateAngle(start: startPoint, finish: finishPoint)
//
//        let animation = {
//            self.square.center = finishPoint
//            self.square.transform = self.square.transform.rotated(by: CGFloat(angle))
//        }
//
//        UIView.animate(
//            withDuration: 0.7,
//            delay: 0,
//            usingSpringWithDamping: 0.7,
//            initialSpringVelocity: 0.8,
//            animations: animation
//        )
//
//        let animation2 = {
//            self.square.transform = self.square.transform.rotated(by: CGFloat(-angle))
//        }
//
//        UIView.animate(
//            withDuration: 0.3,
//            delay: 0,
//            usingSpringWithDamping: 0.5,
//            initialSpringVelocity: 0.2,
//            animations: animation2
//        )
//    }
//
//    func calculateAngle(start: CGPoint, finish: CGPoint) -> Float {
//        let screenWidth = UIScreen.main.bounds.width
//        let screenHeight = UIScreen.main.bounds.height
//
//        let deltaX = start.x - finish.x
//        let percentChangeX = deltaX / screenWidth
//
//        let deltaY = start.y - finish.y
//        let percentChangeY = deltaY / screenHeight
//
//        let changeFactor = abs(percentChangeX) + abs(percentChangeY)
//        let changeFactorWithSign = deltaX > 0 ? changeFactor : -changeFactor
//
//        return Float(changeFactorWithSign)
//    }

}


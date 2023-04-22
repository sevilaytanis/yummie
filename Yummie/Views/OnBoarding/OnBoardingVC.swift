//
//  OnBoardingVC.swift
//  Yummie
//
//  Created by sevilay tanis on 18.03.2023.
//

import UIKit

class OnBoardingVC: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var nextBtn: UIButton!
    @IBOutlet var pageControl: UIPageControl!
    
    var slides: [OnBoardingSlide] = []
    var currentPage=0{
        didSet{
            pageControl.currentPage=currentPage

            if currentPage == slides.count-1{
                nextBtn.setTitle("Get Started", for: .normal)
            }
            else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        slides = [
            OnBoardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: UIImage(imageLiteralResourceName: "slide1")),
            OnBoardingSlide(title: "World Class Chefs", description: "Our Dishes are prepared by pnly the best.", image: UIImage(imageLiteralResourceName: "slide2") ),
            OnBoardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: UIImage(imageLiteralResourceName: "slide3"))
        ]
    }

    @IBAction func nextButtonClicked(_ sender: UIButton) {
        
        if(currentPage==slides.count-1){
            let controller=storyboard?.instantiateViewController(withIdentifier: "HomeNC") as!UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalPresentationStyle = .pageSheet
            present(controller, animated: true,completion: nil)
        }
        else{
            currentPage += 1
            let indexPath = IndexPath  (item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
            
       
        
    }
}

extension OnBoardingVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int{
        return slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingCollectionViewCell.identifier, for: indexPath) as! OnBoardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width =  scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }

}

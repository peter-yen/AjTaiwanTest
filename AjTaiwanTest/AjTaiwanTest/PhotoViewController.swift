import UIKit
import SnapKit

class PhotoViewController: UIViewController {
    
    var pageNumber: Int = 0
    convenience init(pageNumber: Int) {
        self.init()
        self.pageNumber = pageNumber
    }
    
    var photos: [Photo] = []
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupCollectionView()
        self.view.backgroundColor = .white
        
        if let url = URL(string: "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=f2d1f4ed70ad0b36ea7fdf8823408ada&text=%E7%BE%8E%E9%A3%9F&format=json&nojsoncallback=1&auth_token=72157716581183752-40c4d846f0076322&api_sig=f2402f3ed67b43b04dd5f80953065545") {
            URLSession.shared.dataTask(with: url) { [self] (data, response, err) in
                if let err = err {
                    self.view.showToast(text: err.localizedDescription)
                    return
                }
                if let data = data {
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] else { return }
                    if let photosData = json["photos"] as? [String: Any],
                       let photosArray = photosData["photo"] as? [[String: Any]] {
                        
                        for dict in photosArray[0...self.pageNumber - 1] {
                            let photo = Photo(dictionary: dict)
                            self.photos.append(photo)
                            print(self.pageNumber)
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                        }
                    }
                }
            }.resume()
        }
        
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 25
        
        self.collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        self.view.addSubview(self.collectionView)
        self.collectionView.backgroundColor = .clear
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        self.collectionView.snp.makeConstraints { (m) in
            m.edges.equalTo(self.view.safeAreaLayoutGuide.snp.edges)
        }
    }
    
}

extension PhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        let photo = photos[indexPath.item]
        cell.photoData = photo
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let size = CGSize(width: width / 2 - 10, height: 180)
        return size
    }
    
}

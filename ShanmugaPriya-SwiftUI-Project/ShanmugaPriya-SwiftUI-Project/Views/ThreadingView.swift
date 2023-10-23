//
//  ThreadingView.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 16/10/23.
//

import SwiftUI

struct ThreadingView: View {
    @State var images : [UIImage] = [
        UIImage(named: "login")!,
        UIImage(named: "think")!,
        UIImage(named: "settings")!,
        UIImage(named: "loginPageImg")!
    ]
    var queue = OperationQueue()
    var body: some View {
        VStack{
            HStack{
                Image(uiImage: images[0])
                    .resizable()
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    .frame(width: 180,height: 180)
                Image(uiImage: images[1])
                    .resizable()
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    .frame(width: 180,height: 180)
                
            }
            HStack{
                Image(uiImage: images[2])
                    .resizable()
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    .frame(width: 180,height: 180)
                Image(uiImage:images[3])
                    .resizable()
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    .frame(width: 180,height: 180)
            }
            HStack{
                CustomButton(action: {
    //                download()
                    downloadImageWithCaching()
                    
                }, buttonName: "Download", buttonWidth: 150)
                CustomButton(action: {
                    print("reset")
                    self.images = [
                        UIImage(named: "login")!,
                        UIImage(named: "think")!,
                        UIImage(named: "settings")!,
                        UIImage(named: "loginPageImg")!
                    ]
                }, buttonName: "Reset",buttonWidth: 150)
            }
            .padding(20)
            
            
        }
    }
    private func downloadImageWithCaching(){
        imageURLStrings.enumerated().map{
            index, imageUrlString in
            ImageLoader().downloadImageFrom(imageURLStrings[index]){
                image in self.images[index] = image
            }
        }
        
//        ImageLoader().downloadImageFrom(imageURLStrings[0]){
//            image in self.images[0] = image
//        }
    }
    private func download(){
        //directly add operation to the queue
//        queue.addOperation {
//            
//        }
        //create a block operation and add to queue
        queue.maxConcurrentOperationCount = 1
        let opBlocks = imageURLStrings.enumerated().map {
            (index, urlString) -> BlockOperation in
                return BlockOperation {
                    let image = Downloader().downloadImageFromURL(urlString)
                    print(image)
                    OperationQueue.main.addOperation {
                        self.images[index] = image
                        print("Operation \(index + 1) Completed")
                    }
                }
            }

            for operation in opBlocks {
                queue.addOperation(operation)
            }
//
//        let op1 = BlockOperation{
//            let image = Downloader().downloadImageFromURL(imageURLStrings[0])
//            //switch context to main thread
//            OperationQueue.main.addOperation{
//                self.images[0] = image
//                print("Operation 1 Completed")
//            }
//        }
//        let op2 = BlockOperation{
//            let image = Downloader().downloadImageFromURL(imageURLStrings[1])
//            //switch context to main thread
//            OperationQueue.main.addOperation{
//                self.images[1] = image
//                print("Operation 2 Completed")
//            }
//        }
//        let op3 = BlockOperation{
//            let image = Downloader().downloadImageFromURL(imageURLStrings[2])
//            //switch context to main thread
//            OperationQueue.main.addOperation{
//                self.images[2] = image
//                print("Operation 3 Completed")
//            }
//        }
//        let op4 = BlockOperation{
//            let image = Downloader().downloadImageFromURL(imageURLStrings[3])
//            //switch context to main thread
//            OperationQueue.main.addOperation{
//                self.images[3] = image
//                print("Operation 4 Completed")
//            }
//        }
//        queue.addOperation(op1)
//        queue.addOperation(op2)
//        queue.addOperation(op3)
//        queue.addOperation(op4)
    }
}
let imageURLStrings = [
    "https://www.planetware.com/photos-large/IND/india-top-attractions-taj-mahal.jpg",
   "https://www.planetware.com/photos-large/JPN/japan-attractions-hiroshima-itsukushima.jpg",
   "https://www.planetware.com/photos-large/IND/india-top-attractions-harmandir-sahib.jpg",
   "https://www.planetware.com/photos-large/IND/india-top-attractions-jaisalmer.jpg"
]

class Downloader{
    func downloadImageFromURL(_ imageURLString:String)-> UIImage{
        if let imageData = try? Data(contentsOf: URL( string : imageURLString)!){
            return UIImage(data: imageData)!
            
        }
        return UIImage(named: "login")!
    }
}
#Preview {
    ThreadingView()
}


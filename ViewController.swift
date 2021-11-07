//
//  ViewController.swift
//  Camera
//
//  Created by 綿野拓也 on 2017/07/27.
//  Copyright © 2017年 綿野拓也. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var imageView: UIImageView!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image=info[UIImagePickerControllerOriginalImage] as! UIImage
        self.imageView.image = image
        UIImageWriteToSavedPhotosAlbum(image,nil,nil,nil)
        self.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func launchCamera(_ sender: UIBarButtonItem) {
        //カメラ立ち上げる
        let camera=UIImagePickerControllerSourceType.camera
        
        if UIImagePickerController.isSourceTypeAvailable(camera){
            let picker=UIImagePickerController()
            
            picker.sourceType=camera
            picker.delegate=self
            self.present(picker,animated: true,completion: nil)
        }
    }
    
    @IBAction func Action(_ sender: UIBarButtonItem) {
        let photoLibrary=UIImagePickerControllerSourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(photoLibrary){
            let picker = UIImagePickerController()
            
            
            picker.sourceType = photoLibrary
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
        }

    }
}
//「設定」→「一般」→「リセット」→「位置情報とプライバシーをリセット」

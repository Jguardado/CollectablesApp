//
//  CreateCollectableViewController.swift
//  CollectorApp
//
//  Created by Juan Guardado on 1/31/19.
//  Copyright © 2019 Juan Guardado. All rights reserved.
//

import UIKit

class CreateCollectableViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var pickerContoller = UIImagePickerController()

    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerContoller.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        }
        pickerContoller.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func fileTapped(_ sender: Any) {
        pickerContoller.sourceType = .photoLibrary
        present(pickerContoller, animated: true, completion: nil)
    }
    @IBAction func cameraTapped(_ sender: Any) {
        pickerContoller.sourceType = .camera
        present(pickerContoller, animated: true, completion: nil)
    }
    
    @IBAction func addCollectable(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let collectable = Collectable(context: context)
            if let title = titleInput.text {
                collectable.title = title
                collectable.image = imageView.image?.jpegData(compressionQuality: 1.0)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            }
  
        }
        
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

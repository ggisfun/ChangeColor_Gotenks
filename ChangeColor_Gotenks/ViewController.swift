//
//  ViewController.swift
//  ChangeColor_Gotenks
//
//  Created by Adam Chen on 2024/8/8.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var gotenksImageView: UIImageView!
    @IBOutlet weak var auraView: UIView!
    @IBOutlet weak var hairView: UIView!
    @IBOutlet weak var pantsView: UIView!
    @IBOutlet var sliderValues: [UISlider]!
    @IBOutlet var showValues: [UILabel]!
    @IBOutlet weak var partSegmentedControl: UISegmentedControl!
    
    var hairSliderValue : [Float] = [0.5,0.5,0.5,0.5]
    var pantsSliderValue : [Float] = [0.5,0.5,0.5,0.5]
    var auraSliderValue : [Float] = [0.5,0.5,0.5,0.5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var image = UIImage(named: "aura")
        let auraImageView = UIImageView(image: image)
        auraImageView.frame = auraView.bounds
        auraImageView.contentMode = .scaleAspectFill
        auraView.mask = auraImageView
        auraView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        image = UIImage(named: "hair")
        let hairImageView = UIImageView(image: image)
        hairImageView.frame = hairView.bounds
        hairImageView.contentMode = .scaleAspectFill
        hairView.mask = hairImageView
        hairView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        image = UIImage(named: "pants")
        let pantsImageView = UIImageView(image: image)
        pantsImageView.frame = pantsView.bounds
        pantsImageView.contentMode = .scaleAspectFill
        pantsView.mask = pantsImageView
        pantsView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        for slider in sliderValues {              
            slider.setThumbImage(UIImage(named: "dragonball"), for: .normal)
        }
        
        auraView.layer.cornerRadius = 10
        auraView.clipsToBounds = true
        auraView.layer.borderWidth = 1
        auraView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        gotenksImageView.layer.cornerRadius = 10
        gotenksImageView.clipsToBounds = true
        gotenksImageView.layer.borderWidth = 1
        gotenksImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        backgroundImageView.layer.cornerRadius = 10
        backgroundImageView.clipsToBounds = true
        backgroundImageView.layer.borderWidth = 1
        backgroundImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        sliderValues[4].isHidden = true
        sliderValues[5].isHidden = true
        
    }
    
    //調整RGB,Alpha的Slider
    @IBAction func changeColor(_ sender: Any) {
        changeViewColor()
        colorValueSave()
        colorValueShow()
    }
    
    //切換SegmentedControl
    @IBAction func changePart(_ sender: UISegmentedControl) {
        colorValueSet()
        colorValueShow()
    }
    
    //調整圓角大小
    @IBAction func changeCornerRadius(_ sender: Any) {
        auraView.layer.cornerRadius = CGFloat(sliderValues[4].value)
        gotenksImageView.layer.cornerRadius = CGFloat(sliderValues[4].value)
        backgroundImageView.layer.cornerRadius = CGFloat(sliderValues[4].value)
    }
    
    //調整邊框寬度
    @IBAction func changeBorderWidth(_ sender: Any) {
        auraView.layer.borderWidth = CGFloat(sliderValues[5].value)
        gotenksImageView.layer.borderWidth = CGFloat(sliderValues[5].value)
        backgroundImageView.layer.borderWidth = CGFloat(sliderValues[5].value)
    }
    
    //圓角開關
    @IBAction func cornerRadiusSwitch(_ sender: UISwitch) {
        if sender.isOn{
            sliderValues[4].isHidden = false
            auraView.layer.cornerRadius = CGFloat(sliderValues[4].value)
            gotenksImageView.layer.cornerRadius = CGFloat(sliderValues[4].value)
            backgroundImageView.layer.cornerRadius = CGFloat(sliderValues[4].value)
        }else{
            sliderValues[4].isHidden = true
            auraView.layer.cornerRadius = 10
            gotenksImageView.layer.cornerRadius = 10
            backgroundImageView.layer.cornerRadius = 10
        }
    }
    
    //邊框開關
    @IBAction func borderWidthSwitch(_ sender: UISwitch) {
        if sender.isOn{
            sliderValues[5].isHidden = false
            auraView.layer.borderWidth = CGFloat(sliderValues[5].value)
            gotenksImageView.layer.borderWidth = CGFloat(sliderValues[5].value)
            backgroundImageView.layer.borderWidth = CGFloat(sliderValues[5].value)
        }else{
            sliderValues[5].isHidden = true
            auraView.layer.borderWidth = 1
            gotenksImageView.layer.borderWidth = 1
            backgroundImageView.layer.borderWidth = 1
        }
    }
    
    //Random按鈕
    @IBAction func randomColor(_ sender: Any) {
        sliderValues[0].value = Float.random(in: 0...1)
        sliderValues[1].value = Float.random(in: 0...1)
        sliderValues[2].value = Float.random(in: 0...1)
        sliderValues[3].value = Float.random(in: 0...1)
        
        changeViewColor()
        colorValueSave()
        colorValueShow()
    }
    
    //Reset按鈕
    @IBAction func resetColor(_ sender: Any) {
        sliderValues[0].value = 0.5
        sliderValues[1].value = 0.5
        sliderValues[2].value = 0.5
        sliderValues[3].value = 0.5
        
        changeViewColor()
        colorValueSave()
        colorValueShow()
    }
    
    //改變View的顏色
    func changeViewColor(){
        switch partSegmentedControl.selectedSegmentIndex {
        case 0 :
            hairView.backgroundColor = UIColor(red: CGFloat(sliderValues[0].value), green: CGFloat(sliderValues[1].value) , blue: CGFloat(sliderValues[2].value), alpha: CGFloat(sliderValues[3].value) )
        case 1 :
            pantsView.backgroundColor = UIColor(red: CGFloat(sliderValues[0].value), green: CGFloat(sliderValues[1].value) , blue: CGFloat(sliderValues[2].value), alpha: CGFloat(sliderValues[3].value) )
        case 2 :
            auraView.backgroundColor = UIColor(red: CGFloat(sliderValues[0].value), green: CGFloat(sliderValues[1].value) , blue: CGFloat(sliderValues[2].value), alpha: CGFloat(sliderValues[3].value) )
        default :
            return
        }
    }
    
    //保存各Slider數值
    func colorValueSave(){
        switch partSegmentedControl.selectedSegmentIndex {
        case 0 :
            hairSliderValue[0] = sliderValues[0].value
            hairSliderValue[1] = sliderValues[1].value
            hairSliderValue[2] = sliderValues[2].value
            hairSliderValue[3] = sliderValues[3].value
        case 1 :
            pantsSliderValue[0] = sliderValues[0].value
            pantsSliderValue[1] = sliderValues[1].value
            pantsSliderValue[2] = sliderValues[2].value
            pantsSliderValue[3] = sliderValues[3].value
        case 2 :
            auraSliderValue[0] = sliderValues[0].value
            auraSliderValue[1] = sliderValues[1].value
            auraSliderValue[2] = sliderValues[2].value
            auraSliderValue[3] = sliderValues[3].value
        default :
            return
        }
    }
    
    //切換SegmentedControl，設置各Slider數值
    func colorValueSet(){
        switch partSegmentedControl.selectedSegmentIndex {
        case 0 :
            sliderValues[0].setValue(hairSliderValue[0], animated: true)
            sliderValues[1].setValue(hairSliderValue[1], animated: true)
            sliderValues[2].setValue(hairSliderValue[2], animated: true)
            sliderValues[3].setValue(hairSliderValue[3], animated: true)
        case 1 :
            sliderValues[0].setValue(pantsSliderValue[0], animated: true)
            sliderValues[1].setValue(pantsSliderValue[1], animated: true)
            sliderValues[2].setValue(pantsSliderValue[2], animated: true)
            sliderValues[3].setValue(pantsSliderValue[3], animated: true)
        case 2 :
            sliderValues[0].setValue(auraSliderValue[0], animated: true)
            sliderValues[1].setValue(auraSliderValue[1], animated: true)
            sliderValues[2].setValue(auraSliderValue[2], animated: true)
            sliderValues[3].setValue(auraSliderValue[3], animated: true)
        default :
            return
        }
    }
    
    //顯示RGB數值
    func colorValueShow() {
        showValues[0].text = String(format: "%.0f", sliderValues[0].value*255)
        showValues[1].text = String(format: "%.0f", sliderValues[1].value*255)
        showValues[2].text = String(format: "%.0f", sliderValues[2].value*255)
        showValues[3].text = String(format: "%.1f", sliderValues[3].value)
    }
    

}

//#Preview {
//    UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
//}


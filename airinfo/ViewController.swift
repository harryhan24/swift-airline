//
//  ViewController.swift
//  airinfo
//
//  Created by DongSu Han on 2016. 12. 6..
//  Copyright © 2016년 DongSuHan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var selectDatePicker: UIDatePicker!
    
    @IBOutlet weak var returnDateLabel: UILabel!
    @IBOutlet weak var returnDateButton: UIButton!
    
    @IBOutlet weak var departureDateButton: UIButton!
    
    //버튼값 초기화
    var buttonTag:Int = 1;

    @IBAction func showReturnDateAction(_ sender: Any) {
        
        //sender은 이벤트를 받는 녀석이 들어온다.
        //sender을 UISwitch로 강제 형변환 시킴
//        if (sender as! UISwitch).isOn{
//            returnDateLabel.isHidden = false;
//            returnDateButton.isHidden = false;
//        }else{
//            returnDateLabel.isHidden = true;
//            returnDateButton.isHidden = true;
//
//        }
        
        returnDateLabel.isHidden = !(sender as! UISwitch).isOn
        returnDateButton.isHidden = !(sender as! UISwitch).isOn
    }
    @IBAction func departSelectDate(_ sender: Any) {
        if selectDatePicker.isHidden == false{
            selectDatePicker.isHidden = true
        }else{
            selectDatePicker.isHidden = false
        }
        buttonTag = (sender as! UIButton).tag;
    }
    @IBAction func selectedDateAction(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "YY-MM-d hh:mma"
        
//        let dateString = formatter.string(from: selectDatePicker.date)
        
        
                let dataString = formatter.string(from: (sender as! UIDatePicker).date)
        
        if buttonTag == 1 {
            departureDateButton.setTitle(dataString,for:UIControlState()) //컨트롤 스테이트는 노말로.
        }else{
            returnDateButton.setTitle(dataString,for:UIControlState()) //컨트롤 스테이트는 노말로.
        }
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        returnDateLabel.isHidden = true;
        selectDatePicker.isHidden = true;
        returnDateButton.isHidden = true;
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // 키보드 끝.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}


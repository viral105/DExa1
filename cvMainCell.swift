//
//  cvMainCell.swift
//  UISplitViewControllerExample
//
//  Created by Viral Narshana on 9/7/16.
//  Copyright © 2016 Ravi Shankar. All rights reserved.
//

import UIKit
import QuartzCore
import Haneke

class cvMainCell: UICollectionViewCell {
    @IBOutlet var viewWhite: UIView!
    @IBOutlet var headerView: UIView!
    @IBOutlet var lblTitle: UILabel!
    
    @IBOutlet var lblDateTime: UILabel!
    @IBOutlet var lblCC: UILabel!
    @IBOutlet var lblRefBy: UILabel!
    
    @IBOutlet var lblCurrMedi1: UILabel!
    @IBOutlet var lblCurrMedi2: UILabel!
    @IBOutlet var lblCurrMedi3: UILabel!
    
    @IBOutlet var tblLab: UITableView!
    @IBOutlet var tblAppointment: UITableView!
    var arrLab:NSMutableArray! = NSMutableArray()
    var arrAppointment:NSMutableArray! = NSMutableArray()
    
    @IBOutlet var btnDoc1: UIButton!
    @IBOutlet var btnDoc2: UIButton!
    @IBOutlet var btnDoc3: UIButton!
    @IBOutlet var btnDoc4: UIButton!
    @IBOutlet var btnDoc5: UIButton!
    
    func setUI() {
        
    }
    
    func setAppointmentData(_ arrAppointment:NSMutableArray) {
        self.lblTitle.text = "Appointments"
        let obj = arrAppointment.object(at: 0) as! AppointmentDM
        self.lblDateTime.text = (" \(obj.strDate) \(obj.strTime)")
        self.lblCC.text = (" \(obj.strRfv)")
        self.lblRefBy.text = (" \(obj.strRfdBy)")
    }
    func setCurrentMedicationData(_ arrCurrMedi:NSMutableArray) {
        self.lblTitle.text = "Medication List"
        for index in 0...arrCurrMedi.count-1 {
            let obj = arrCurrMedi.object(at: index) as! CurrentMedicationDM
            switch index {
            case 0:
                self.lblCurrMedi1.text = obj.strMedicineName + " " + obj.strStrength
            case 1:
                self.lblCurrMedi2.text = obj.strMedicineName + " " + obj.strStrength
            case 2:
                self.lblCurrMedi3.text = obj.strMedicineName + " " + obj.strStrength
            default:
                print("in default")
            }
            
            
        }
        
    }
    
    func setAllergyData(_ arrAllergy:NSMutableArray) {
        
        
        self.lblTitle.text = "Allergy"
        var yInd,xInd:CGFloat
        yInd = 5.0
        xInd = 5.0
        for index in 0...arrAllergy.count-1 {
            let obj = arrAllergy.object(at: index) as! AllergyDM
            let button = UIButton(type: UIButtonType.custom)
            
            button.titleLabel?.font = UIFont(name: "Helvetica", size: 14)
            button.titleLabel?.textColor = UIColor.white
            button.backgroundColor = UIColor(red: 237/255.0, green: 99/255.0, blue: 89/255.0, alpha: 1)
            button.setTitle(obj.strName, for: UIControlState())
            //button.addTarget(self, action: #selector(buttonAction), forControlEvents: .TouchUpInside)
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.sizeToFit()
            print((CGFloat(xInd)+button.frame.size.width+5+5))
            print(button.frame.size.width)
            if (CGFloat(xInd)+button.frame.size.width+5+5)>self.viewWhite.frame.size.width {
                yInd += 21
                xInd = 5
            }
            button.frame = CGRect(x: CGFloat(xInd), y: CGFloat(yInd), width: button.frame.size.width+5, height: 16)
            
            self.viewWhite.addSubview(button)
            
            xInd += button.frame.size.width+5
        }
    }
    func setActiveProblemData(_ arrActiveProblem:NSMutableArray) {
        
        
        self.lblTitle.text = "Active Problem"
        var yInd,xInd:CGFloat
        yInd = 5.0
        xInd = 5.0
        for index in 0...arrActiveProblem.count-1 {
            let obj = arrActiveProblem.object(at: index) as! ActiveProblemsDM
            let button = UIButton(type: UIButtonType.custom)
            
            button.titleLabel?.font = UIFont(name: "Helvetica", size: 14)
            button.titleLabel?.textColor = UIColor.white
            button.backgroundColor = UIColor(red: 237/255.0, green: 99/255.0, blue: 89/255.0, alpha: 1)
            button.setTitle(obj.strProblemName, for: UIControlState())
            //button.addTarget(self, action: #selector(buttonAction), forControlEvents: .TouchUpInside)
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.sizeToFit()
            print((CGFloat(xInd)+button.frame.size.width+5+5))
            print(button.frame.size.width)
            if (CGFloat(xInd)+button.frame.size.width+5+5)>self.viewWhite.frame.size.width {
                yInd += 21
                xInd = 5
            }
            button.frame = CGRect(x: CGFloat(xInd), y: CGFloat(yInd), width: button.frame.size.width+5, height: 16)
            
            self.viewWhite.addSubview(button)
            
            xInd += button.frame.size.width+5
        }
    }
    
    func setDocumentData(_ arrDocument:NSMutableArray) {
        
        var obj = arrDocument.object(at: 0) as! DocumentDM
//        self.btnDoc1.hnk_setImageFromURL(NSURL(string: obj.strThumbUrl)!)
        self.btnDoc1.hnk_setBackgroundImageFromURL(URL(string: obj.strThumbUrl)!)
        
        obj = arrDocument.object(at: 1) as! DocumentDM
//        self.btnDoc2.hnk_setImageFromURL(NSURL(string: obj.strThumbUrl)!)
        self.btnDoc2.hnk_setBackgroundImageFromURL(URL(string: obj.strThumbUrl)!)
        
        obj = arrDocument.object(at: 2) as! DocumentDM
//        self.btnDoc3.hnk_setImageFromURL(NSURL(string: obj.strThumbUrl)!)
        self.btnDoc3.hnk_setBackgroundImageFromURL(URL(string: obj.strThumbUrl)!)
        
        obj = arrDocument.object(at: 3) as! DocumentDM
//        self.btnDoc4.hnk_setImageFromURL(NSURL(string: obj.strThumbUrl)!)
        self.btnDoc4.hnk_setBackgroundImageFromURL(URL(string: obj.strThumbUrl)!)
        
        obj = arrDocument.object(at: 4) as! DocumentDM
//        self.btnDoc5.hnk_setImageFromURL(NSURL(string: obj.strThumbUrl)!)
        self.btnDoc5.hnk_setBackgroundImageFromURL(URL(string: obj.strThumbUrl)!)
        
        print("self.imgDoc1 \(self.btnDoc1.frame)")
    }
}
extension cvMainCell:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            if tableView.tag == 101 {
                if self.arrAppointment.count > 0 {
                    return self.arrAppointment.count+1
                }
                else{
                    return self.arrAppointment.count
                }
            }
            else if tableView.tag == 102 {
                return self.arrLab.count
            }
            else{
                return 0
            }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch tableView.tag {
        case 102:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellidlabtbl") as! PDTblLabCell
            cell.setLabData(arrLab.object(at: indexPath.row) as! LabDM)
            return cell
        case 101:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellidtblappointment") as! PDTblAppointmentCell
            if indexPath.row == 0 {
                cell.setAppointmentData(arrAppointment.object(at: indexPath.row) as! AppointmentDM,index: indexPath.row)
            }
            else{
                cell.setAppointmentData(arrAppointment.object(at: indexPath.row-1) as! AppointmentDM,index: indexPath.row)
            }
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellid") as UITableViewCell!
            return cell!
        }
        
        
    }
}

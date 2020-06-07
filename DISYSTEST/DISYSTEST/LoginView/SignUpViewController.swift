//
//  SignUpViewController.swift
//  StudyTech
//
//  Created by  Mani S 29/07/19.
//  Copyright © 2018 MANIKANDAN. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
//import Toaster
public struct LoginViewControllerUX {
    static let textFieldCornerRadius:CGFloat = 20
    static let loginBtnCornerRadius:CGFloat = 25
    
}
struct SIGNUPViewControllerUX {
    static let textFieldDefaultHeight:CGFloat = 40
    static let logoViewBottomDefaultConstraint:CGFloat = 30
    static let socialTopDefaultConstraint:CGFloat = 20
    
    static let mobileNumberLimit:Int = 10
}

class SignUpViewController: UIViewController {
    
    //UI Elements IBoutlets
    @IBOutlet weak var signUpContainerView:UIView!
    @IBOutlet weak var emailIdTextField:UITextField!
    //@IBOutlet weak var : UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var signUpBtn:UIButton!
    @IBOutlet weak var mobileNumberView:UIView!
    
    //Constraint IBoutlets
    @IBOutlet weak var logoViewBottomConstraint:NSLayoutConstraint!
    @IBOutlet weak var socialViewTopConstraint:NSLayoutConstraint!
    @IBOutlet weak var signUpLabelTopConstraints:NSLayoutConstraint!
    
    var isNavigateLoginView:Bool = false

    override func viewDidLoad() {
        
        //UIScren Constraint Setup
        constraintsSetup()
        
    }
    
    func constraintsSetup(){
        
        switch Utility.screensType() {
        case .iPhones_5_5s_5c_SE:
            signUpLabelTopConstraints.constant = 40
            //TextField
            textFieldUISetup(cornerRadius: LoginViewControllerUX.textFieldCornerRadius, height: SIGNUPViewControllerUX.textFieldDefaultHeight)
            break
            
        case .iPhones_6_6s_7_8:
            
            uiElementConstraintUpdate(socialTopConstraint: SIGNUPViewControllerUX.socialTopDefaultConstraint, logoViewBottom: (SIGNUPViewControllerUX.logoViewBottomDefaultConstraint))
            
            textFieldUISetup(cornerRadius: LoginViewControllerUX.textFieldCornerRadius+2, height: SIGNUPViewControllerUX.textFieldDefaultHeight + 5)
            break
            
         
        case .iPhones_X_XS:
            uiElementConstraintUpdate(socialTopConstraint: SIGNUPViewControllerUX.socialTopDefaultConstraint, logoViewBottom: (SIGNUPViewControllerUX.logoViewBottomDefaultConstraint*2))
            //TextField
            textFieldUISetup(cornerRadius: LoginViewControllerUX.textFieldCornerRadius+5, height: SIGNUPViewControllerUX.textFieldDefaultHeight + 10)
            break
        default:
            break
        }
        
        //Make SQuare View For Container View
        if let signUpWidthContainerConstraint = (signUpContainerView.constraints.filter{$0.firstAttribute == .width}.first){
            signUpWidthContainerConstraint.constant = self.view.frame.size.width - 10
            
            if let signUpHeightContainerConstraint = (signUpContainerView.constraints.filter{$0.firstAttribute == .height}.first){
                signUpHeightContainerConstraint.constant = signUpWidthContainerConstraint.constant
                
                //Make Circle Code
                signUpContainerView.roundCorners(cornerRadius: (signUpHeightContainerConstraint.constant/2), borderWidth: 7.0, borderColor: UIColor.init(red:225/255.0 , green: 230/255.0, blue: 236/255.0, alpha: 0.40))
            }
        }
        
        //SignUp Button make Round Corners
        signUpBtn.roundCorners(cornerRadius: LoginViewControllerUX.loginBtnCornerRadius)
    }
    
    func uiElementConstraintUpdate(socialTopConstraint:CGFloat,logoViewBottom:CGFloat){
        socialViewTopConstraint.constant = socialTopConstraint
        logoViewBottomConstraint.constant = logoViewBottom
    }
    
    //UItextField Setup
    func textFieldUISetup(cornerRadius:CGFloat,height:CGFloat){
        
        emailIdTextField.returnKeyType = .next
        nameTextField.returnKeyType = .next
        mobileNumberTextField.returnKeyType = .done
        
        emailIdTextField.keyboardType = .emailAddress
        mobileNumberTextField.keyboardType = .numberPad
       
        emailIdTextField.delegate = self
        mobileNumberTextField.delegate = self
        nameTextField.delegate = self
        
        
        //UserNameText Round corners Setup
        emailIdTextField.roundCorners(cornerRadius: cornerRadius, borderWidth: 1.0)
        
        mobileNumberView.roundCorners(cornerRadius: cornerRadius, borderWidth: 1.0, borderColor: UIColor.gray)
        //Password Field Round corners Setub
        nameTextField.roundCorners(cornerRadius: cornerRadius, borderWidth: 1.0)
        
        mobileNumberTextField.layer.borderWidth = 0.5
        
        //Constraint Update
        //Update Height Based Screen Layout
        if let emailIdHeightConstraint = (emailIdTextField.constraints.filter{$0.firstAttribute == .height}.first){
            emailIdHeightConstraint.constant = height
        }
  
        if let mobileNoHeightConstraint = (mobileNumberView.constraints.filter{$0.firstAttribute == .height}.first){
            mobileNoHeightConstraint.constant = height
        }
        
        
        if let passwordHeightConstraint = (nameTextField.constraints.filter{$0.firstAttribute == .height}.first){
            passwordHeightConstraint.constant = height
        }
        
        //init toolbar
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        //create left side empty space so that done button set on right side
        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        
        let doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        //setting toolbar as inputAccessoryView
        self.mobileNumberTextField.inputAccessoryView = toolbar
        
    }
    
    @objc func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    //MARK:EMAIL ID & Password Validation
    //Validate MailId
    func validateMailId(_ textField: UITextField)->Bool{
        guard !(textField.text?.isEmpty)!,Utility.isValidEmail(emailID: textField.text!) else {
            textField.becomeFirstResponder()
            return false
        }
        return true
    }
    
    //Validate Password
    func nameValidation(_ textField: UITextField)->Bool{
        guard !(textField.text?.isEmpty)! else {
            textField.becomeFirstResponder()
            return false
        }
        return true
    }
    
    //UItouch Delegate
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: - SIGNIN ACTION
    @IBAction func loginAction(){
        //check valid Mail Id
        guard validateMailId(emailIdTextField),nameValidation(nameTextField) else {
            //Show General Toast Message
            return
        }
        
        //API Call Implementation
       /* ServiceManager.userLoginRequest(nameTextField.text!, email: emailIdTextField.text!,phone: mobileNumberTextField.text!) { (loginResponce) in
            
            Logger.log(items: loginResponce)
            
            
        }*/
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)
        let memberDetailsViewController = storyBoard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        self.navigationController?.pushViewController(memberDetailsViewController, animated:true)
        
        
        
//        let listViewContollerOBj = self.storyboard!.instantiateViewController(withIdentifier: "ListViewController_ID") as! ListViewController
//        
//        
//        self.present(listViewContollerOBj, animated: true, completion: nil)
        
    }
}

extension SignUpViewController:UITextFieldDelegate{
    
    public func textFieldDidBeginEditing(_ textField: UITextField){
        Logger.log(items: textField.text!)
    }

    
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool{
        if textField == emailIdTextField {
            //Validate Mail_Id
            if(!validateMailId(textField)){
                return false
            }
        }else if (textField == nameTextField){
            if(!nameValidation(textField)){
                return false
            }
        }else{
            //Need to Validate MobileNumber
            return true
        }
        return true
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        if textField == emailIdTextField {
            //Validate Mail_Id
            if(validateMailId(textField)){
                nameTextField.becomeFirstResponder()
            }
        }else if( textField == nameTextField ){
            if(nameValidation(textField)){
                mobileNumberTextField.becomeFirstResponder()
            }
            return true
        }else{
             mobileNumberTextField.resignFirstResponder()
        }
        return false
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      
        
        //WhiteSpace Not allowed.
        if string.containsWhitespace{
            return false
        }
        //CheckMobileNumber
        if textField == mobileNumberTextField {
            
            //Check Numbers Only
            let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
            let compSepByCharInSet = string.components(separatedBy: aSet)
            let numberFiltered = compSepByCharInSet.joined(separator: "")
            if(string == numberFiltered){
                if((mobileNumberTextField.text?.count)! + string.count <= SIGNUPViewControllerUX.mobileNumberLimit){
                    return true
                }
                return false
            }
            return string == numberFiltered
        }
        return true
    }
}
//MARK:UIBUTTON Extension For RoundCornes
extension UIButton{
    public func roundCorners(cornerRadius:CGFloat){
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        self.layer.cornerRadius = 25
    }
}


//MARK:UIVIEW Extension For RoundCorners
extension UIView{
    public func roundCorners(cornerRadius:CGFloat,borderWidth:CGFloat,borderColor:UIColor? = nil){
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor?.cgColor
    }
    
    public func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}



//MARK:UIString Contaion Space Sections
extension String {
    var containsWhitespace : Bool {
        return(self.rangeOfCharacter(from: .whitespaces) != nil)
    }
}

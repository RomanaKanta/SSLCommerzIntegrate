//
//  MainViewController.swift
//  SSLCommerzIntegration
//
//  Created by Romana on 22/8/21.
//

import UIKit
import SSLCommerzSDK

class MainViewController: UIViewController, SSLCommerzDelegate {
    
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var msgLabel: UILabel!
    
    @IBAction func submit(_ sender: Any) {
        initSSLCommerz()
    }
    
//    to get storeId, password, callback_ip you will have to register on https://developer.sslcommerz.com/registration/
//    login account with https://sandbox.sslcommerz.com/manage/ and
//    Go to console and click the developer tab. you can now download iOS SDK file.
    
    var storeId = ""  // set your store ID
    var password = ""  // set your store password
    var currency = ""  // set currency
    var productCategory = ""  // set your product category
    let callback_ip = ""  // set callback ip where sslCommerz will send transaction details
    let transactionId = ""  // transactionId will be your tracking ID for this transaction
    
    func initSSLCommerz(){
        let integrationInfo = IntegrationInformation(storeID: storeId,
                                                         storePassword: password,
                                                         totalAmount: Double(self.amount.text ?? "0")!,
                                                         currency: currency,
                                                         transactionId: transactionId,
                                                         productCategory: productCategory)
            
        integrationInfo.ipnURL = callback_ip
            
        let SDKObject = SSLCommerz(integrationInformation: integrationInfo,
                                   emiInformation: nil,
                                   customerInformation: nil,
                                   shipmentInformation: nil,
                                   productInformation: nil,
                                   additionalInformation: nil)
            
        SDKObject.delegate = self
        SDKObject.start(in: self, shouldRunInTestMode: true) // make "shouldRunInTestMode" false for real action

    }
    
    func transactionCompleted(withTransactionData transactionData: TransactionDetails?) {
        // Here you will get transaction detail in 'transactionData' object
        msgLabel.text = "SSL Commerz Transaction \n\(transactionData?.status ?? "")"
    }
}

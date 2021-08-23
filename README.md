# SSLCommerzIntegrate

Implementation of SSLCommerz payment gateway in iOS.

SSLCOMMERZ is a payment gateway aggregator in Bangladesh. 

To integrate SSLCommerzSDK you need to complete following steps.

## STEPS TO INTEGRATE

#### Step 1:
Go to this link https://developer.sslcommerz.com/registration/ and register.

#### Step 2: 
Login account with https://sandbox.sslcommerz.com/manage/

#### Step 3:
Go to console and click the developer tab. you can now download iOS SDK file.

#### Step 4:
Unzip 'SSLCommerz.framework.zip' file.

#### Step 5:
Drag and Drop 'SSLCommerzSDK.framework' folder to your Xcode Project.

#### Step 6:
Make sure 'SSLCommerzSDK.framework' properly added under 'Frameworks, Libraries, and Embedded Content' and make it 'Emded & Sign'.

Now SSLCommerzSDK set in your Xcode Project :) .

It's time to add code in your payment gateway Controller.

#### 1. 
import 'SSLCommerzSDK' in your payment gateway Controller.

```swift
import SSLCommerzSDK
```
#### 2.
Include SSLCommerzDelegate  in your class.

```swift
class PaymentViewController: UIViewController, SSLCommerzDelegate {
```

#### 3.
Create a reference of SSLCommerz 

```swift
var SSLCommerzObject : SSLCommerz?
```

#### 4.
Initialize the Object with your required parameters and set delegate

```swift
let integrationInfo = IntegrationInformation(storeID: storeId,storePassword: password,totalAmount: amount,currency: currency,transactionId: transactionId,productCategory: productCategory)
integrationInfo.ipnURL = callback_ip
        SSLCommerzObject = SSLCommerz(integrationInformation: integrationInfo,emiInformation: nil,customerInformation: nil,shipmentInformation: nil,productInformation: nil,additionalInformation: nil)
        SSLCommerzObject?.delegate = self
```

Initialize SSLCommerz object with your required payment way.

#### 5.
For Payment, Call the following Function

```swift
SSLCommerzObject?.start(in: self, shouldRunInTestMode: true) // make "shouldRunInTestMode" false for real action
```

#### 6.
Check transaction status with following Delegate function

```swift
func transactionCompleted(withTransactionData transactionData: TransactionDetails?) {
        // Here you will get transaction detail in 'transactionData' object
    }
```

Hope above steps will be helpful for you.

## License
[MIT](https://choosealicense.com/licenses/mit/)

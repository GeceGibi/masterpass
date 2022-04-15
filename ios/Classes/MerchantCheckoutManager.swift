//
//  MerchantCheckoutManager.swift
//  masterpass
//
//  Created by Siyah on 15.04.2022.
//

import MCCMerchant
import Foundation


// class MerchantCheckoutManager: NSObject, MCCMerchantDelegate {
    
//     /// the FlutterResult instance to use for returning results back to flutter.
//     var result: FlutterResult
    
//     /// Constructor used to initialize flutterResult.
//     init(result: @escaping FlutterResult) {
//         self.result = result
//         super.init()
//     }
    
//     func didGetCheckoutRequest(_ completionBlock: ((MCCCheckoutRequest) -> Bool)? = nil) {
//         let transactionRequest = MCCCheckoutRequest()

//         //check merchant on-boarding process for checkoutId & cartID
//         transactionRequest.checkoutId = "{ADD_YOUR_CHECKOUTID}"
//         transactionRequest.cartId = "{ADD_YOUR_CARTID}"

//         //amount and currency
//         let amount:MCCAmount = MCCAmount()
//         amount.total = NSDecimalNumber(string: "75")
//         amount.currencyCode = "USD"
//         transactionRequest.amount = amount

//         //network type
//         var allowedNetworkTypesSet = Set<MCCCardType>()
//         allowedNetworkTypesSet.insert(MCCCardType(type: MCCCard.MASTER)!);
//         transactionRequest.allowedCardTypes = allowedNetworkTypesSet

//         //shipping required
//         transactionRequest.isShippingRequired = true

//         _ = completionBlock!(transactionRequest)
//     }

//     func didFinishCheckout(_ checkoutResponse: MCCCheckoutResponse) {
//         let checkoutType : MCCResponseType = checkoutResponse.responseType
//         if (checkoutType == .appCheckout) {
//             //embedded checkout experience
//         } else if (checkoutType == .webCheckout) {
//             //web checkout
//         }
//     }

//     func didReceiveCheckoutError(_ error: Error) {

//         let errorObject = error as NSError
//         if (errorObject.code == MCCMerchantErrorCode.MCCTransactionError.rawValue) {
//             //Do something with Transaction error
//         } else {
//             //Do something with error
//         }
//     }

//     func loadPaymentMethod() -> MCCPaymentMethod {
        
//     }

//     func didGetAddPaymentMethodRequest(_ completionBlock: ((Set<MCCCardType>, String) -> Void)? = nil) {
        
//     }
// }

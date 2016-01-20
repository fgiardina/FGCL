//
//  FGStoreKit.m
//  FGCommonLibrary
//
//  Created by Fernando Giardina on 1/19/16.
//  Copyright © 2016 Fernando Giardina. All rights reserved.
//

#import "FGStoreKit.h"

@implementation FGStoreKit

- (void)comprar: (NSString *)productID{
    
    self.productID = productID;
    
    if ([SKPaymentQueue canMakePayments]) {
        
        SKProductsRequest *productRequest = [[SKProductsRequest alloc]  initWithProductIdentifiers:[NSSet setWithObject:productID]];
        
        productRequest.delegate = self;
        [productRequest start];
    }
    else {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"didPaymentQueueStopActivity" object:nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"didCanMakePaymentsError" object:nil];
        
    }
    
}

- (void)restoreAll{
    SKPaymentQueue *paymentQueue = [SKPaymentQueue defaultQueue];
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    [paymentQueue restoreCompletedTransactions];
}

#pragma mark SKPaymentTransactionObserver
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
    
    for (SKPaymentTransaction *transaction in transactions) {
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchasing:
                break;
            case SKPaymentTransactionStatePurchased:
            {
                
                
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                
                if(![transaction error])
                {
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"didPaymentQueueTransactionOK" object:transaction];
                }
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"didPaymentQueueStopActivity" object:nil];
                
                break;
                
            }
            case SKPaymentTransactionStateRestored:
            {
                
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                if(![transaction error])
                {
                    
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"didPaymentQueueRestoredTransaction" object:transaction];
                }
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"didPaymentQueueStopActivity" object:nil];
                
                break;
            }
            case SKPaymentTransactionStateFailed:
            {
                if (transaction.error.code != SKErrorPaymentCancelled) {
                    
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"didPaymentQueueTransactionError" object:transaction.error];
                }
                
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"didPaymentQueueStopActivity" object:nil];
                break;
            }
            default:
                break;
        }
    }
}
- (void) paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue
{
    
    
    if(queue.transactions.count < 1)
    {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"didPaymentQueueRestoreEmpty" object:nil];
        
    }else{
        for (SKPaymentTransaction *transaction in queue.transactions)
        {
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"didPaymentQueueCompletedTransactionsOk" object:transaction];
        }
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"didPaymentQueueStopActivity" object:nil];
    
}




- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
    NSArray *misProductos = response.products;
    
    
    if (misProductos.count > 0) {
        self.product = [misProductos objectAtIndex:0];
        NSLog(@"productolocalizedDescription es: %@",[self.product localizedDescription]);
        NSLog(@"productolocalizedTitle es: %@",[self.product localizedTitle]);
        NSLog(@"productoprice es: %@",[self.product price]);
        NSLog(@"productopriceLocale es: %@",[self.product priceLocale]);
        NSLog(@"productoproductIdentifier es: %@",[self.product productIdentifier]);
        
        
        SKPayment *pago = [SKPayment paymentWithProduct:self.product];
        [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
        [[SKPaymentQueue defaultQueue] addPayment:pago];
        
    }
    else{
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"didProductsRequestUnAvailable" object:self.productID];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"didPaymentQueueStopActivity" object:nil];
        
    }
    
}
- (void)request:(SKRequest *)request didFailWithError:(NSError *)error
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"didPaymentQueueFailWithError" object:error];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"didPaymentQueueStopActivity" object:nil];
}


- (NSString *)getReceipt {
    
    NSURL *receiptURL = [[NSBundle mainBundle] appStoreReceiptURL];
    NSData *receipt = [NSData dataWithContentsOfURL:receiptURL];
    if (!receipt) {
        return @"";
    }
    return [receipt base64EncodedStringWithOptions:0];
}

@end

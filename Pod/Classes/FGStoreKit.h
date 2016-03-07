//
//  FGStoreKit.h
//  FGCommonLibrary
//
//  Created by Fernando Giardina on 1/19/16.
//  Copyright © 2016 Fernando Giardina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

/*
 // Notificaciones que deben agregarse en la view que realice la compra
 
 
 
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didPaymentQueueStopActivity:) name:@"didPaymentQueueStopActivity" object:nil];
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didCanMakePaymentsError:) name:@"didCanMakePaymentsError" object:nil];
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didPaymentQueueRestoreEmpty:) name:@"didPaymentQueueRestoreEmpty" object:nil];
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didPaymentQueueTransactionOK:) name:@"didPaymentQueueTransactionOK" object:nil];
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didPaymentQueueRestoredTransaction:) name:@"didPaymentQueueRestoredTransaction" object:nil];
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didPaymentQueueCompletedTransactionsOk:) name:@"didPaymentQueueCompletedTransactionsOk" object:nil];
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didPaymentQueueTransactionError:) name:@"didPaymentQueueTransactionError" object:nil];
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didProductsRequestUnAvailable:) name:@"didProductsRequestUnAvailable" object:nil];
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didPaymentQueueFailWithError:) name:@"didPaymentQueueFailWithError" object:nil];
 
 
 
 
 // Metodos para las notificaciones.
 
 - (void) didPaymentQueueStopActivity:(NSNotification *)notification {
 NSLog(@"hide activity");
 
 }
 
 - (void) didCanMakePaymentsError:(NSNotification *)notification {
 NSLog(@"Error por control parental, no permite realizar compras desde este device");
 _alert(@"AppStore", @"Control parental activado");
 
 
 
 }
 
 - (void) didPaymentQueueRestoreEmpty:(NSNotification *)notification {
 NSLog(@"No hay productos comprados anteriormente para restorear");
 _alert(@"AppStore", @"No hay productos comprados anteriormente");
 }
 
 - (void) didPaymentQueueTransactionOK:(NSNotification *)notification {
 SKPaymentTransaction *transaction = (SKPaymentTransaction *)[notification object];
 NSLog(@"La compra fue exitosa: %@",transaction.transactionIdentifier);
 
 // transaction.transactionIdentifier
 // transaction.transactionDate
 // transaction.payment.productIdentifier
 
 }
 
 - (void) didPaymentQueueRestoredTransaction:(NSNotification *)notification {
 SKPaymentTransaction *transaction = (SKPaymentTransaction *)[notification object];
 NSLog(@"Restore de 1 producto del primer delegate fue exitosa: %@",transaction.originalTransaction.transactionIdentifier);
 
 // transaction.originalTransaction.transactionIdentifier
 // transaction.originalTransaction.transactionDate
 // transaction.originalTransaction.payment.productIdentifier
 
 
 
 }
 
 - (void) didPaymentQueueCompletedTransactionsOk:(NSNotification *)notification {
 SKPaymentTransaction *transaction = (SKPaymentTransaction *)[notification object];
 
 // recibire esta notificacion por cada producto restoreado
 NSLog(@"Restore fue exitosa: %@",transaction.originalTransaction.transactionIdentifier);
 
 // transaction.originalTransaction.transactionIdentifier
 // transaction.originalTransaction.transactionDate
 // transaction.originalTransaction.payment.productIdentifier
 
 
 
 }
 - (void) didProductsRequestUnAvailable:(NSNotification *)notification {
 NSString *productID = (NSString *)[notification object];
 
 // El producto no existe en los InApps configurados en Itunes
 NSLog(@"Producto no exite: %@",productID);
 _alert(@"AppStore", @"Producto no Disponible");
 
 }
 
 - (void) didPaymentQueueFailWithError:(NSNotification *)notification {
 NSError *error = (NSError *)[notification object];
 
 // la compra fallo con un error/
 NSLog(@"FailWithError: %@",error.localizedDescription);
 _alert(@"AppStore", error.localizedDescription);
 
 
 }
 
 
 - (void) didPaymentQueueTransactionError:(NSNotification *)notification {
 NSError *error = (NSError *)[notification object];
 
 // salio con error al entrar al delegate paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
 NSLog(@"TransactionError: %@",error.localizedDescription);
 _alert(@"AppStore", error.localizedDescription);
 
 
 }
 
 */

@interface FGStoreKit : NSObject <SKPaymentTransactionObserver, SKProductsRequestDelegate>
@property (strong, nonatomic) SKProduct *product;
@property (strong, nonatomic) NSString *productID;

- (void)comprar: (NSString *)productID;
- (void)restoreAll;
+ (NSString *)getReceipt;
@end

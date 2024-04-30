//
//  STPBankAccountCollector.swift
//  StripePayments
//
//  Copyright © 2022 Stripe, Inc. All rights reserved.
//

import Foundation
@_spi(STP) import StripeCore
import UIKit

/// Error codes generated by STPBankAccountCollector
@objc public enum STPCollectBankAccountError: Int {

    /// Error when using APIs that require the linking the StripeFinancialConnections SDK
    @objc(STPCollectBankAccountErrorFinancialConnectionsSDKNotLinked)
    case financialConnectionsSDKNotLinked

    /// Error when a secret can not be parsed to retrieve the ID
    @objc(STPCollectBankAccountErrorInvalidClientSecret)
    case invalidClientSecret

    /// Unexpected behavior in calling the API
    @objc(STPCollectBankAccountErrorUnexpectedError)
    case unexpectedError
}

/// A class responsible for collecting bank account information
public class STPBankAccountCollector: NSObject {

    /// By default `sharedHandler` initializes with STPAPIClient.shared.
    public var apiClient: STPAPIClient

    @objc(`init`)
    @available(swift, deprecated: 0.0.1, obsoleted: 0.0.1, renamed: "init()")
    public convenience override init() {
        self.init(apiClient: STPAPIClient.shared)
    }

    public init(
        apiClient: STPAPIClient = .shared
    ) {
        self.apiClient = apiClient
    }

    // MARK: Collect Bank Account - Payment Intent
    public typealias STPCollectBankAccountForPaymentCompletionBlock = (STPPaymentIntent?, NSError?)
        -> Void

    /// Presents a modal from the viewController to collect bank account
    /// and if completed successfully, link your bank account to a PaymentIntent
    /// - Parameters:
    ///   - clientSecret:      Client secret of the payment intent
    ///   - params:            Parameters for this call
    ///   - viewController:    Presenting view controller that will present the modal
    ///   - completion:        Completion block to be called on completion of the operation.
    ///                        Upon success, the `STPPaymentIntent` instance will have an
    ///                        expanded `paymentMethod` containing detailed payment method information
    @objc(collectBankAccountForPaymentWithClientSecret:params:from:completion:)
    public func collectBankAccountForPayment(
        clientSecret: String,
        params: STPCollectBankAccountParams,
        from viewController: UIViewController,
        completion: @escaping STPCollectBankAccountForPaymentCompletionBlock
    ) {
        collectBankAccountForPayment(
            clientSecret: clientSecret,
            returnURL: nil,
            params: params,
            from: viewController,
            completion: completion
        )
    }

    /// Presents a modal from the viewController to collect bank account
    /// and if completed successfully, link your bank account to a PaymentIntent
    /// - Parameters:
    ///   - clientSecret:      Client secret of the payment intent
    ///   - returnURL:         A URL that redirects back to your app to be used to return after completing authentication in another app (such as bank app or Safari).
    ///   - params:            Parameters for this call
    ///   - viewController:    Presenting view controller that will present the modal
    ///   - completion:        Completion block to be called on completion of the operation.
    ///                        Upon success, the `STPPaymentIntent` instance will have an
    ///                        expanded `paymentMethod` containing detailed payment method information
    @objc(collectBankAccountForPaymentWithClientSecret:returnURL:params:from:completion:)
    public func collectBankAccountForPayment(
        clientSecret: String,
        returnURL: String?,
        params: STPCollectBankAccountParams,
        from viewController: UIViewController,
        completion: @escaping STPCollectBankAccountForPaymentCompletionBlock
    ) {
        collectBankAccountForPayment(
            clientSecret: clientSecret,
            returnURL: returnURL,
            params: params,
            from: viewController,
            onEvent: nil,
            completion: completion
        )
    }

    /// Presents a modal from the viewController to collect bank account
    /// and if completed successfully, link your bank account to a PaymentIntent
    /// - Parameters:
    ///   - clientSecret:      Client secret of the payment intent
    ///   - returnURL:         A URL that redirects back to your app to be used to return after completing authentication in another app (such as bank app or Safari).
    ///   - params:            Parameters for this call
    ///   - viewController:    Presenting view controller that will present the modal
    ///   - onEvent:           The `onEvent` closure is triggered upon the occurrence of specific events during the process of a user connecting their financial accounts.
    ///   - completion:        Completion block to be called on completion of the operation.
    ///                        Upon success, the `STPPaymentIntent` instance will have an
    ///                        expanded `paymentMethod` containing detailed payment method information
    public func collectBankAccountForPayment(
        clientSecret: String,
        returnURL: String?,
        params: STPCollectBankAccountParams,
        from viewController: UIViewController,
        onEvent: ((FinancialConnectionsEvent) -> Void)?,
        completion: @escaping STPCollectBankAccountForPaymentCompletionBlock
    ) {
        let paymentIntentID = STPPaymentIntent.id(fromClientSecret: clientSecret)
        logCollectBankAccountStarted(type: .payment, intentID: paymentIntentID)
        // Overwrite completion to send an analytic before calling the caller-supplied completion
        let completion: (FinancialConnectionsSDKResult?, STPPaymentIntent?, NSError?) -> Void = { result, paymentIntent, error in
            self.logCollectBankAccountFinished(type: .payment, intentID: paymentIntent?.stripeId, linkAccountSessionID: nil, financialConnectionsSDKResult: result, error: error)
            completion(paymentIntent, error)
        }
        guard let paymentIntentID else {
            completion(nil, nil, error(for: .invalidClientSecret))
            return
        }
        let financialConnectionsCompletion:
            (FinancialConnectionsSDKResult?, LinkAccountSession?, NSError?) -> Void = {
                result,
                linkAccountSession,
                error in
                if let error {
                    completion(result, nil, error)
                    return
                }
                guard let result else {
                    completion(result, nil, self.error(for: .unexpectedError, loggingSafeErrorMessage: "collectBankAccountForPayment() completed without a result"))
                    return
                }
                guard let linkAccountSession else {
                    completion(result, nil, self.error(for: .unexpectedError, loggingSafeErrorMessage: "collectBankAccountForPayment() completed without a link account session"))
                    return
                }

                switch result {
                case .completed:
                    self.attachLinkAccountSessionToPaymentIntent(
                        paymentIntentID: paymentIntentID,
                        clientSecret: clientSecret,
                        linkAccountSession: linkAccountSession
                    ) { paymentIntent, error in
                        completion(result, paymentIntent, error)
                    }
                case .cancelled:
                    self.apiClient.retrievePaymentIntent(withClientSecret: clientSecret) {
                        intent,
                        error in
                        if let intent {
                            completion(result, intent, nil)
                        } else if let error {
                            completion(result, nil, error as NSError)
                        } else {
                            completion(result, nil, self.error(for: .unexpectedError, loggingSafeErrorMessage: "Canceled and retrieved PI without an error or intent"))
                        }
                    }
                case .failed(let error):
                    completion(result, nil, error as NSError)
                }
            }
        _collectBankAccountForPayment(
            clientSecret: clientSecret,
            returnURL: returnURL,
            onEvent: onEvent,
            params: params,
            from: viewController,
            financialConnectionsCompletion: financialConnectionsCompletion
        )
    }

    @_spi(STP) public func collectBankAccountForPayment(
        clientSecret: String,
        returnURL: String?,
        onEvent: ((FinancialConnectionsEvent) -> Void)?,
        params: STPCollectBankAccountParams,
        from viewController: UIViewController,
        financialConnectionsCompletion: @escaping (
            FinancialConnectionsSDKResult?, LinkAccountSession?, NSError?
        ) -> Void
    ) {
        let paymentIntentID = STPPaymentIntent.id(fromClientSecret: clientSecret)
        logCollectBankAccountStarted(type: .payment, intentID: paymentIntentID)
        // Overwrite completion to send an analytic before calling the caller-supplied completion
        let financialConnectionsCompletion: (FinancialConnectionsSDKResult?, LinkAccountSession?, NSError?) -> Void = { result, linkAccountSession, error in
            self.logCollectBankAccountFinished(type: .payment, intentID: paymentIntentID, linkAccountSessionID: linkAccountSession?.stripeID, financialConnectionsSDKResult: result, error: error)
            financialConnectionsCompletion(result, linkAccountSession, error)
        }
        _collectBankAccountForPayment(
            clientSecret: clientSecret,
            returnURL: returnURL,
            onEvent: onEvent,
            params: params,
            from: viewController,
            financialConnectionsCompletion: financialConnectionsCompletion
        )
    }

    private func _collectBankAccountForPayment(
        clientSecret: String,
        returnURL: String?,
        onEvent: ((FinancialConnectionsEvent) -> Void)?,
        params: STPCollectBankAccountParams,
        from viewController: UIViewController,
        financialConnectionsCompletion: @escaping (
            FinancialConnectionsSDKResult?, LinkAccountSession?, NSError?
        ) -> Void
    ) {
        guard
            let financialConnectionsAPI = FinancialConnectionsSDKAvailability.financialConnections()
        else {
            assertionFailure("FinancialConnections SDK has not been linked into your project")
            financialConnectionsCompletion(nil, nil, error(for: .financialConnectionsSDKNotLinked))
            return
        }

        guard let paymentIntentID = STPPaymentIntent.id(fromClientSecret: clientSecret) else {
            financialConnectionsCompletion(nil, nil, error(for: .invalidClientSecret))
            return
        }

        let linkAccountSessionCallback: STPLinkAccountSessionBlock = { linkAccountSession, error in
            if let error {
                financialConnectionsCompletion(nil, nil, error as NSError)
                return
            }
            guard let linkAccountSession else {
                financialConnectionsCompletion(
                    nil,
                    nil,
                    self.error(for: .unexpectedError, loggingSafeErrorMessage: "createLinkAccountSession w/ PI called without an error or link account session")
                )
                return
            }
            financialConnectionsAPI.presentFinancialConnectionsSheet(
                apiClient: self.apiClient,
                clientSecret: linkAccountSession.clientSecret,
                returnURL: returnURL,
                onEvent: onEvent,
                from: viewController
            ) { result in
                financialConnectionsCompletion(result, linkAccountSession, nil)
            }
        }

        apiClient.createLinkAccountSession(
            paymentIntentID: paymentIntentID,
            clientSecret: clientSecret,
            paymentMethodType: params.paymentMethodParams.type,
            customerName: params.paymentMethodParams.billingDetails?.name,
            customerEmailAddress: params.paymentMethodParams.billingDetails?.email,
            completion: linkAccountSessionCallback
        )
    }

    // MARK: Helper
    private func attachLinkAccountSessionToPaymentIntent(
        paymentIntentID: String,
        clientSecret: String,
        linkAccountSession: LinkAccountSession,
        completion: @escaping STPCollectBankAccountForPaymentCompletionBlock
    ) {
        STPAPIClient.shared.attachLinkAccountSession(
            paymentIntentID: paymentIntentID,
            linkAccountSessionID: linkAccountSession.stripeID,
            clientSecret: clientSecret
        ) { paymentIntent, error in
            if let error {
                completion(
                    nil,
                    error as NSError
                )
                return
            }
            guard let paymentIntent = paymentIntent else {
                completion(nil, self.error(for: .unexpectedError, loggingSafeErrorMessage: "attachLinkAccountSession() returned neither error nor PaymentIntent"))
                return
            }
            completion(paymentIntent, nil)
        }
    }

    // MARK: Collect Bank Account - Setup Intent
    public typealias STPCollectBankAccountForSetupCompletionBlock = (STPSetupIntent?, NSError?) ->
        Void

    /// Presents a modal from the viewController to collect bank account
    /// and if completed successfully, link your bank account to a SetupIntent
    /// - Parameters:
    ///   - clientSecret:      Client secret of the setup intent
    ///   - params:            Parameters for this call
    ///   - viewController:    Presenting view controller that will present the modal
    ///   - completion:        Completion block to be called on completion of the operation.
    ///                        Upon success, the `STPSetupIntent` instance will have an
    ///                        expanded `paymentMethod` containing detailed payment method information
    @objc(collectBankAccountForSetupWithClientSecret:params:from:completion:)
    public func collectBankAccountForSetup(
        clientSecret: String,
        params: STPCollectBankAccountParams,
        from viewController: UIViewController,
        completion: @escaping STPCollectBankAccountForSetupCompletionBlock
    ) {
        collectBankAccountForSetup(
            clientSecret: clientSecret,
            returnURL: nil,
            params: params,
            from: viewController,
            completion: completion
        )
    }

    /// Presents a modal from the viewController to collect bank account
    /// and if completed successfully, link your bank account to a SetupIntent
    /// - Parameters:
    ///   - clientSecret:      Client secret of the setup intent
    ///   - returnURL:         A URL that redirects back to your app to be used to return after completing authentication in another app (such as bank app or Safari).
    ///   - params:            Parameters for this call
    ///   - viewController:    Presenting view controller that will present the modal
    ///   - completion:        Completion block to be called on completion of the operation.
    ///                        Upon success, the `STPSetupIntent` instance will have an
    ///                        expanded `paymentMethod` containing detailed payment method information
    @objc(collectBankAccountForSetupWithClientSecret:returnURL:params:from:completion:)
    public func collectBankAccountForSetup(
        clientSecret: String,
        returnURL: String?,
        params: STPCollectBankAccountParams,
        from viewController: UIViewController,
        completion: @escaping STPCollectBankAccountForSetupCompletionBlock
    ) {
        collectBankAccountForSetup(
            clientSecret: clientSecret,
            returnURL: returnURL,
            params: params,
            from: viewController,
            onEvent: nil,
            completion: completion
        )
    }

    /// Presents a modal from the viewController to collect bank account
    /// and if completed successfully, link your bank account to a SetupIntent
    /// - Parameters:
    ///   - clientSecret:      Client secret of the setup intent
    ///   - returnURL:         A URL that redirects back to your app to be used to return after completing authentication in another app (such as bank app or Safari).
    ///   - params:            Parameters for this call
    ///   - viewController:    Presenting view controller that will present the modal
    ///   - onEvent:           The `onEvent` closure is triggered upon the occurrence of specific events during the process of a user connecting their financial accounts.
    ///   - completion:        Completion block to be called on completion of the operation.
    ///                        Upon success, the `STPSetupIntent` instance will have an
    ///                        expanded `paymentMethod` containing detailed payment method information
    public func collectBankAccountForSetup(
        clientSecret: String,
        returnURL: String?,
        params: STPCollectBankAccountParams,
        from viewController: UIViewController,
        onEvent: ((FinancialConnectionsEvent) -> Void)?,
        completion: @escaping STPCollectBankAccountForSetupCompletionBlock
    ) {
        let setupIntentID = STPSetupIntent.id(fromClientSecret: clientSecret)
        logCollectBankAccountStarted(type: .setup, intentID: setupIntentID)
        // Overwrite completion to send an analytic before calling the caller-supplied completion
        let completion: (FinancialConnectionsSDKResult?, STPSetupIntent?, NSError?) -> Void = { result, setupIntent, error in
            self.logCollectBankAccountFinished(type: .setup, intentID: setupIntent?.stripeID, linkAccountSessionID: nil, financialConnectionsSDKResult: result, error: error)
            completion(setupIntent, error)
        }
        guard let setupIntentID else {
            completion(nil, nil, error(for: .invalidClientSecret))
            return
        }
        let financialConnectionsCompletion:
            (FinancialConnectionsSDKResult?, LinkAccountSession?, NSError?) -> Void = {
                result,
                linkAccountSession,
                error in
                if let error {
                    completion(result, nil, error as NSError)
                    return
                }
                guard let result else {
                    completion(result, nil, self.error(for: .unexpectedError, loggingSafeErrorMessage: "collectBankAccountForSetup() completed without a result"))
                    return
                }
                guard let linkAccountSession else {
                    completion(result, nil, self.error(for: .unexpectedError, loggingSafeErrorMessage: "collectBankAccountForSetup() completed without a link account session"))
                    return
                }
                switch result {
                case .completed:
                    self.attachLinkAccountSessionToSetupIntent(
                        setupIntentID: setupIntentID,
                        clientSecret: clientSecret,
                        linkAccountSession: linkAccountSession
                    ) { setupIntent, error in
                        completion(result, setupIntent, error)
                    }
                case .cancelled:
                    self.apiClient.retrieveSetupIntent(withClientSecret: clientSecret) {
                        intent,
                        error in
                        if let intent = intent {
                            completion(result, intent, nil)
                        } else if let error {
                            completion(result, nil, error as NSError)
                        } else {
                            completion(result, nil, self.error(for: .unexpectedError, loggingSafeErrorMessage: "Canceled and retrieved SI without an error or intent"))
                        }
                    }
                case .failed(let error):
                    completion(result, nil, error as NSError)
                }
            }
        collectBankAccountForSetup(
            clientSecret: clientSecret,
            returnURL: returnURL,
            onEvent: onEvent,
            params: params,
            from: viewController,
            financialConnectionsCompletion: financialConnectionsCompletion
        )
    }

    @_spi(STP) public func collectBankAccountForSetup(
        clientSecret: String,
        returnURL: String?,
        onEvent: ((FinancialConnectionsEvent) -> Void)?,
        params: STPCollectBankAccountParams,
        from viewController: UIViewController,
        financialConnectionsCompletion: @escaping (
            FinancialConnectionsSDKResult?, LinkAccountSession?, NSError?
        ) -> Void
    ) {
        let setupIntentID = STPSetupIntent.id(fromClientSecret: clientSecret)
        logCollectBankAccountStarted(type: .setup, intentID: setupIntentID)
        // Overwrite completion to send an analytic before calling the caller-supplied completion
        let financialConnectionsCompletion: (FinancialConnectionsSDKResult?, LinkAccountSession?, NSError?) -> Void = { result, linkAccountSession, error in
            self.logCollectBankAccountFinished(type: .setup, intentID: setupIntentID, linkAccountSessionID: linkAccountSession?.stripeID, financialConnectionsSDKResult: result, error: error)
            financialConnectionsCompletion(result, linkAccountSession, error)
        }
        _collectBankAccountForSetup(
            clientSecret: clientSecret,
            returnURL: returnURL,
            onEvent: onEvent,
            params: params,
            from: viewController,
            financialConnectionsCompletion: financialConnectionsCompletion
        )
    }

    private func _collectBankAccountForSetup(
        clientSecret: String,
        returnURL: String?,
        onEvent: ((FinancialConnectionsEvent) -> Void)?,
        params: STPCollectBankAccountParams,
        from viewController: UIViewController,
        financialConnectionsCompletion: @escaping (
            FinancialConnectionsSDKResult?, LinkAccountSession?, NSError?
        ) -> Void
    ) {
        guard
            let financialConnectionsAPI = FinancialConnectionsSDKAvailability.financialConnections()
        else {
            assertionFailure("FinancialConnections SDK has not been linked into your project")
            financialConnectionsCompletion(nil, nil, error(for: .financialConnectionsSDKNotLinked))
            return
        }
        guard let setupIntentID = STPSetupIntent.id(fromClientSecret: clientSecret) else {
            financialConnectionsCompletion(nil, nil, error(for: .invalidClientSecret))
            return
        }
        let linkAccountSessionCallback: STPLinkAccountSessionBlock = { linkAccountSession, error in
            if let error {
                financialConnectionsCompletion(nil, nil, error as NSError)
                return
            }
            guard let linkAccountSession else {
                financialConnectionsCompletion(
                    nil,
                    nil,
                    self.error(for: .unexpectedError, loggingSafeErrorMessage: "createLinkAccountSession w/ SI called without an error or link account session")
                )
                return
            }

            financialConnectionsAPI.presentFinancialConnectionsSheet(
                apiClient: self.apiClient,
                clientSecret: linkAccountSession.clientSecret,
                returnURL: returnURL,
                onEvent: onEvent,
                from: viewController
            ) { result in
                financialConnectionsCompletion(result, linkAccountSession, nil)
            }
        }
        apiClient.createLinkAccountSession(
            setupIntentID: setupIntentID,
            clientSecret: clientSecret,
            paymentMethodType: params.paymentMethodParams.type,
            customerName: params.paymentMethodParams.billingDetails?.name,
            customerEmailAddress: params.paymentMethodParams.billingDetails?.email,
            completion: linkAccountSessionCallback
        )
    }

    // MARK: Helper
    private func attachLinkAccountSessionToSetupIntent(
        setupIntentID: String,
        clientSecret: String,
        linkAccountSession: LinkAccountSession,
        completion: @escaping STPCollectBankAccountForSetupCompletionBlock
    ) {
        STPAPIClient.shared.attachLinkAccountSession(
            setupIntentID: setupIntentID,
            linkAccountSessionID: linkAccountSession.stripeID,
            clientSecret: clientSecret
        ) { setupIntent, error in
            if let error {
                completion(nil, error as NSError)
                return
            }
            guard let setupIntent else {
                completion(nil, self.error(for: .unexpectedError, loggingSafeErrorMessage: "attachLinkAccountSession() returned neither error nor SetupIntent"))
                return
            }
            completion(setupIntent, nil)
        }
    }

    // MARK: - Collect Bank Account - Deferred Intent
    @_spi(STP) public func collectBankAccountForDeferredIntent(
        sessionId: String,
        returnURL: String?,
        onEvent: ((FinancialConnectionsEvent) -> Void)?,
        amount: Int?,
        currency: String?,
        onBehalfOf: String?,
        from viewController: UIViewController,
        financialConnectionsCompletion: @escaping (
            FinancialConnectionsSDKResult?, LinkAccountSession?, NSError?
        ) -> Void
    ) {
        logCollectBankAccountStarted(type: .deferred, intentID: nil)
        // Overwrite completion to send an analytic before calling the caller-supplied completion
        let financialConnectionsCompletion: (FinancialConnectionsSDKResult?, LinkAccountSession?, NSError?) -> Void = { result, linkAccountSession, error in
            self.logCollectBankAccountFinished(type: .deferred, intentID: nil, linkAccountSessionID: linkAccountSession?.stripeID, financialConnectionsSDKResult: result, error: error)
            financialConnectionsCompletion(result, linkAccountSession, error)
        }

        guard
            let financialConnectionsAPI = FinancialConnectionsSDKAvailability.financialConnections()
        else {
            assertionFailure("FinancialConnections SDK has not been linked into your project")
            financialConnectionsCompletion(nil, nil, error(for: .financialConnectionsSDKNotLinked))
            return
        }

        apiClient.createLinkAccountSessionForDeferredIntent(
            sessionId: sessionId,
            amount: amount,
            currency: currency,
            onBehalfOf: onBehalfOf
        ) { linkAccountSession, error in
            if let error {
                financialConnectionsCompletion(nil, nil, error as NSError)
                return
            }
            guard let linkAccountSession else {
                financialConnectionsCompletion(nil, nil, self.error(for: .unexpectedError, loggingSafeErrorMessage: "createLinkAccountSessionForDeferredIntent called without an error or link account session"))
                return
            }
            financialConnectionsAPI.presentFinancialConnectionsSheet(
                apiClient: self.apiClient,
                clientSecret: linkAccountSession.clientSecret,
                returnURL: returnURL,
                onEvent: onEvent,
                from: viewController
            ) { result in
                financialConnectionsCompletion(result, linkAccountSession, nil)
            }
        }
    }
}

// MARK: - Error
extension STPBankAccountCollector {
    private func error(
        for errorCode: STPCollectBankAccountError,
        loggingSafeErrorMessage: String? = nil
    ) -> NSError {
        var userInfo: [String: String] = [:]
        switch errorCode {
        case .financialConnectionsSDKNotLinked:
            userInfo[STPError.errorMessageKey] =
                "StripeFinancialConnections SDK has not been linked into your project"
        case .invalidClientSecret:
            userInfo[STPError.errorMessageKey] = "Unable to parse client secret"
        case .unexpectedError:
            userInfo[STPError.errorMessageKey] = loggingSafeErrorMessage
        }
        return STPBankAccountCollectorError(code: errorCode, loggingSafeUserInfo: userInfo) as NSError
    }
}

/// STPBankAccountCollector errors (i.e. errors that are created by the STPBankAccountCollector class and have a corresponding STPCollectBankAccountError) used to be NSErrors.
/// This struct exists so that these errors can be Swift errors to conform to AnalyticLoggableError, while still looking like the old NSErrors to users (i.e. same domain and code).
struct STPBankAccountCollectorError: Error, CustomNSError, AnalyticLoggableError {
    // AnalyticLoggableError properties
    let analyticsErrorType: String = errorDomain
    let analyticsErrorCode: String
    let additionalNonPIIErrorDetails: [String: Any]

    // CustomNSError properties, to not break old behavior when this was an NSError
    static let errorDomain: String = "STPBankAccountCollectorErrorDomain"
    let errorUserInfo: [String: Any]
    let errorCode: Int

    init(code: STPCollectBankAccountError, loggingSafeUserInfo: [String: String]) {
        errorCode = code.rawValue
        // Set analytics error code to the description (e.g. "invalidClientSecret")
        analyticsErrorCode = code.description
        errorUserInfo = loggingSafeUserInfo
        additionalNonPIIErrorDetails = loggingSafeUserInfo
    }
}

// MARK: - Analytic
extension STPBankAccountCollector {
    fileprivate struct Analytic: StripeCore.Analytic {
        let event: StripeCore.STPAnalyticEvent
        let intentID: String?
        let linkAccountSessionID: String?
        let intentType: IntentType
        let financialConnectionsSDKResult: FinancialConnectionsSDKResult?
        let error: Error?

        var params: [String: Any] {
            var params: [String: Any] = error?.serializeForV1Analytics() ?? [:]
            params["intent_id"] = intentID
            params["intent_type"] = intentType.rawValue
            params["link_account_session_id"] = linkAccountSessionID
            params["fc_sdk_result"] = {
                switch financialConnectionsSDKResult {
                case nil:
                    return nil
                case .cancelled:
                    return "cancelled"
                case .completed:
                    return "completed"
                case .failed:
                    return "failed"
                }
            }()
            return params
        }

    }
    enum IntentType: String {
        case payment
        case setup
        case deferred
    }

    func logCollectBankAccountStarted(type: IntentType, intentID: String?) {
        let analytic = Analytic(event: .bankAccountCollectorStarted, intentID: intentID, linkAccountSessionID: nil, intentType: type, financialConnectionsSDKResult: nil, error: nil)
        STPAnalyticsClient.sharedClient.log(analytic: analytic, apiClient: self.apiClient)
    }

    func logCollectBankAccountFinished(type: IntentType, intentID: String?, linkAccountSessionID: String?, financialConnectionsSDKResult: FinancialConnectionsSDKResult?, error: Error?) {
        let analytic = Analytic(event: .bankAccountCollectorFinished, intentID: intentID, linkAccountSessionID: linkAccountSessionID, intentType: type, financialConnectionsSDKResult: financialConnectionsSDKResult, error: error)
        STPAnalyticsClient.sharedClient.log(analytic: analytic, apiClient: self.apiClient)
    }
}

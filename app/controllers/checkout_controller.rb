class CheckoutController < ApplicationController
  TRANSACTION_SUCCESS_STATUSES = [
    Braintree::Transaction::Status::Authorizing,
    Braintree::Transaction::Status::Authorized,
    Braintree::Transaction::Status::Settled,
    Braintree::Transaction::Status::SettlementConfirmed,
    Braintree::Transaction::Status::SettlementPending,
    Braintree::Transaction::Status::Settling,
    Braintree::Transaction::Status::SubmittedForSettlement,
  ]
def gateway
@gateway = Braintree::Gateway.new(
  :environment => :sandbox,
  :merchant_id => 'g82dbc9xdvtp4yx9',
  :public_key => '7gnp3pdhks7bfsr6',
  :private_key => 'c35c38c1ce0eb6b9643e273347de08fa',
)
end
 def index
  @ctoken = gateway.client_token.generate()
  puts @ctoken
 end

def show
    @transaction = gateway.transaction.find(params[:id])
    @result = _create_result_hash(@transaction)
end

def create
    
      nonce = params["payment_method_nonce"]
      #amount = params["amount"]
      
      result = gateway.transaction.sale(
        :amount => "10.00",
        :payment_method_nonce => nonce, 
        :options => {
          :submit_for_settlement => true
        }
      )


    if result.success? || result.transaction
      puts (result.transaction.id)
      redirect_to checkout_txnResult_path(result.transaction.id)
    else
      error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
      flash[:error] = error_messages
      redirect_to checkout_index_path
    end
  
end

  def _create_result_hash(transaction)
    status = transaction.status

    if TRANSACTION_SUCCESS_STATUSES.include? status
      result_hash = {
        :header => "Sweet Success!",
        :icon => "success",
        :message => "Your test transaction has been successfully processed. See the Braintree API response and try again."
      }
    else
      result_hash = {
        :header => "Transaction Failed",
        :icon => "fail",
        :message => "Your test transaction has a status of #{status}. See the Braintree API response and try again."
      }
    end
  end

  
end


      
   
  
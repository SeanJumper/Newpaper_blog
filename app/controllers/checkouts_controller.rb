class CheckoutsController < ApplicationController
 

  def new
    @ctoken = gateway.client_token.generate()
   # puts @ctoken
  end

  def show
    @transaction = gateway.subscription.find(params[:id])
    p @transaction
    #@result = _create_result_hash(@transaction)
  end

  def create
   # amount = params["amount"] # In production you should not take amounts directly from clients
    nonce = params["payment_method_nonce"]

    result = gateway.customer.create(
      :first_name => "Charity",
      :last_name => "Smith",
      :payment_method_nonce => nonce
    )
    

    if result.success?
      #redirect_to checkout_path(result.customer.id)
      token = result.customer.credit_cards[0].token
      
      # lets create a subscription

      newSubscription = gateway.subscription.create(
        :payment_method_token => token,
        :plan_id => "KieransPlan",
      )   
    #  p newSubscription.subscription.id
        
    if newSubscription.success?
      redirect_to checkout_path(newSubscription.subscription.id)
    else
      error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
      flash[:error] = error_messages
      redirect_to new_checkout_path
    end
      
      # end of subscription create
    else
      error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
      flash[:error] = error_messages
      redirect_to new_checkout_path
    end
  end

  def _create_result_hash(transaction)
    

    if !@transaction.nil?
      result_hash = {
        :header => "Sweet Success!",
        :icon => "success",
        :message => "Your test transaction has been successfully processed. See the Braintree API response and try again."
      }
    else
      result_hash = {
        :header => "Transaction Failed",
        :icon => "fail",
        :message => "Your test transaction has a status of . See the Braintree API response and try again."
      }
    end
  end

  def gateway
    @gateway = Braintree::Gateway.new(
      :environment => :sandbox,
      :merchant_id => 'g82dbc9xdvtp4yx9',
      :public_key => '7gnp3pdhks7bfsr6',
      :private_key => 'c35c38c1ce0eb6b9643e273347de08fa',
    )
    end
    
end

module BraintrreNonse
	extend ActiveSupport::Concern
def trans 
  @product=Product.find(params[:id])
  end
  
    def trans_pay
      current_user=User.find session[:user_id]
      @product=Product.find(params[:id])
      @result = Braintree::Transaction.sale(
      :amount => @product.price,
      :credit_card => {
        :number => params[:braintree][:credit_card_number],
        :expiration_date => "#{params[:braintree]['date(3i)']}/#{params[:braintree]['date(1i)']}"
      },
      :options=> {
                      store_in_vault: true
                    })
    byebug
    if @result.success?
    current_user.update(braintree_customer_id: @result.transaction.customer_details.id)
    redirect_to :action=>"index", notice: "Congraulations! Your transaction has been successfully!"
    else
    redirect_to :controller=>"products",:action=>"index", notice: "Transaction fail"
    end
  end
end
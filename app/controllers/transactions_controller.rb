class TransactionsController < ApplicationController

    def create
        @transaction = Transaction.create(transaction_params)
        render json: @transaction
    end

    def destroy
        @transaction = Transaction.find(params[:id])
        @transaction.destroy
    end

    private
        def transaction_params
            params.require(:transaction).permit(:stock_symbol, :cost, :user_id )
        end
end

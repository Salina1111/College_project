class TablesController < ApplicationController
	def index
	  @tables = Table.all
	end

	def create
    @table = Table.create(table_params[:id])
    	  

  end

  def new
  	
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show

  end


	private
	def table_params
		 params.require(:table).permit(:Roll_No, :Name , :Faculty, :Year, :Contact_Number, :Donation_quantity)
	end
end


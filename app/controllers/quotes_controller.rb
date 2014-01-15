class QuotesController < ApplicationController

  def index
    @quotes = Quote.all
  end

  def new
    @quote = Quote.new
  end

  def create
    new_quote = Quote.create(params[:quote])
    redirect_to index
  end

  def show
    @quote = Quote.find(params[:id])
  end

end

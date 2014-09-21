class MustdosController < ApplicationController

  def new
  end

  def create
    @mustdo = Mustdo.new(mustdo_params)
    @mustdo.save
    redirect_to @mustdo, notice: 'Your new Mustdu item was saved'    
  end

  def show
    @mustdo = Mustdo.find(params[:id])
  end

  private

  def mustdo_params
    params.require(:mustdo).permit(:description)
  end

end
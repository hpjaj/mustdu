class MustdosController < ApplicationController

  def index
    @mustdos = current_user.mustdos
  end

  def new
  end

  def create
    @mustdo = Mustdo.new(mustdo_params)
    @mustdo.user = current_user
    @mustdo.save
    redirect_to @mustdo, notice: 'Your new Mustdu item was saved'    
  end

  def show
    @mustdo = Mustdo.find params[:id]
  end

  private

  def mustdo_params
    params.require(:mustdo).permit(:description)
  end

end
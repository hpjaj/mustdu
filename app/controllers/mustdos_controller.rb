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
    if @mustdo.save
      redirect_to mustdos_path, notice: 'Your new Mustdu item was saved'
    else
      flash[:error] = "There was a problem saving your Mustdu.  Please try again."
      render mustdos_path
    end
  end

  def show
    @mustdo = Mustdo.find params[:id]
  end

  private

  def mustdo_params
    params.require(:mustdo).permit(:description, :complete)
  end

end
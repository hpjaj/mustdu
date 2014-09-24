class MustdosController < ApplicationController

  respond_to :html, :js

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

  def update
    @mustdo = Mustdo.find(params[:id])
    @mustdo.update_attributes(params[:mustdo])
  end

  def destroy
    @mustdo = Mustdo.find(params[:id])
    if @mustdo.destroy
      flash[:notice] = "Destroyed"
      redirect_to to mustdos_path
    else
      flash[:error] = "Did not work."
      redirect_to mustdos_path
    end
  end

  private

  def mustdo_params
    params.require(:mustdo).permit(:description, :complete)
  end

end
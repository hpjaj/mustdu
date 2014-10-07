class MustdosController < ApplicationController

  respond_to :html, :js

  before_action :authenticate_user!

  def index
    @mustdos = current_user.mustdos.incomplete
    @mustdo = Mustdo.new
  end

  def new
  end

  def create
    @mustdo = Mustdo.new(mustdo_params)
    @mustdo.user = current_user
    if @mustdo.save
      redirect_to mustdos_path
    else
      flash[:error] = @mustdo.errors.full_messages.first
      redirect_to mustdos_path
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
    @mustdo.update_attributes(complete: true)
  end

  private

  def mustdo_params
    params.require(:mustdo).permit(:description, :complete)
  end

end
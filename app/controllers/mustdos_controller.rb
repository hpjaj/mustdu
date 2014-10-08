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
    mustdo = current_user.mustdos.build(params.require(:mustdo).permit(:description))
    if !mustdo.save
      flash[:error] = mustdo.errors.full_messages.first
    end
    redirect_to mustdos_path
  end

  def destroy
    @mustdo = current_user.mustdos.find(params[:id])
    @mustdo.update_attributes(complete: true)
  end

end
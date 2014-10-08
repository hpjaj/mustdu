require 'rails_helper'

RSpec.describe MustdosController, :type => :controller do

  include Devise::TestHelpers

  describe "GET index" do

    before do
      @user = create(:user)
      # Have a mix of completed and incomplete mustdos
      completed_mustdo = create(:mustdo, user: @user, complete: true)
      @mustdo = create(:mustdo, user: @user, complete: false)
      sign_in @user
    end

    it "redirects anonymous user to sign in" do
      sign_out :user
      get :index
      expect(response).to redirect_to new_user_session_path
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "finds incomplete mustdos for user" do
      get :index
      incomplete_mustdos = [@mustdo]
      expect(assigns(:mustdos)).to eq(incomplete_mustdos)
    end

    it "initializes a new instance for the create mustdo form" do
      get :index
      expect(assigns(:mustdo)).to be_a_new(Mustdo)
    end
  end

  describe "POST create" do
    it "shows error when mustdo is invalid" do
      params = {mustdo: {description: nil}}
      post :create, params
      expect(flash[:error]).to eq("Description is too short (minimum is 5 characters)")
      expect(response).to redirect_to(mustdos_path)
    end

    it "redirects anonymous user to sign in" do
      post :create
      expect(response).to redirect_to new_user_session_path
    end

    it "redirects to index with error message for invalid params" do
      user = create(:user)
      sign_in user

      too_short_description = "xyz!"
      post :create, mustdo: { description: too_short_description }

      expect(response).to redirect_to mustdos_path
      expect(flash[:error]).to eq "Description is too short (minimum is 5 characters)"
      expect(Mustdo.count).to eq(0)
    end

    it "creates mustdo and redirects to index" do
      user = create(:user)
      sign_in user

      post :create, mustdo: { description: "Drink coffee" }

      expect(response).to redirect_to mustdos_path
      expect(user.mustdos.first.description).to eq("Drink coffee")
    end


  end


  # describe "GET destroy" do
  #   xit "returns http success" do
  #     get :destroy
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end

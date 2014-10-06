require 'rails_helper'

RSpec.describe MustdosController, :type => :controller do

  include Devise::TestHelpers

  before do
    @user = create(:user)
    @mustdo = create(:mustdo, user: @user, complete: false)
    sign_in @user
  end

  describe "GET index" do

    before(:all) do
      # Have a mix of completed and incomplete mustdos
      completed_mustdo = create(:mustdo, user: @user, complete: true)
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
    # before do
    #   Mustdo.should.stub(:valid?).and_return(true)
    #   post :create, :mustdo => { :description => "A mustdo description of good length.", :complete => false } 
    # end

    # it "returns http success" do
    #   post :create
    #   expect(response).to have_http_status(:success)
    # end

    #expect(assigns(:mustdo))

    it "shows error when mustdo is invalid" do
      params = {mustdo: {description: nil}}
      post :create, params
      expect(flash[:error]).to eq("Description is too short (minimum is 5 characters)")
      expect(response).to redirect_to(mustdos_path)
    end
  end


  describe "GET edit" do
    xit "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET show" do
    xit "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET update" do
    xit "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET destroy" do
    xit "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end

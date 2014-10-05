require 'rails_helper'

RSpec.describe MustdosController, :type => :controller do

  include Devise::TestHelpers

  before do
    @user = create(:user)
    @mustdo = create(:mustdo)
    sign_in @user
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "finds current_user's mustdos, where complete is false, and assigns the array to @mustdos" do
      get :index
      expect(Mustdo.find_by_complete(false).description).to eq("This item needs to get done this week")
    end

    it "assigns @musdo" do
      get :index
      expect(assigns(:mustdo)).to be_a_new(Mustdo)
    end
  end


  describe "POST create" do
    before do
      Mustdo.should.stub(:valid?).and_return(true)
      post :create, :mustdo => { :description => "A mustdo description of good length.", :complete => false } 
    end

    it "returns http success" do
      mustdo = 
      post :create
      expect(response).to have_http_status(:success)
    end

    it "assigns @musdo" do
      post :create
      expect(assigns(:mustdo)).to be_a_new(Mustdo)
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

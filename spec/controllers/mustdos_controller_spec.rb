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
      expect(assigns(:mustdos)).to eq([@mustdo])
    end

    it "initializes a new instance for the create mustdo form" do
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

  describe "GET destroy" do
    xit "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end

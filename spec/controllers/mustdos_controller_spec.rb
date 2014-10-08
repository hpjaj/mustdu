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
      expect(assigns(:mustdos)).to eq([@mustdo])
    end

    it "initializes a new instance for the create mustdo form" do
      get :index
      expect(assigns(:mustdo)).to be_a_new(Mustdo)
    end
  end

  describe "POST create" do

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

  describe "DELETE destroy" do

    it "redirects anonymous user to sign in" do
      params = { id: 'mustdo id goes here' }
      delete :destroy, params
      expect(response).to redirect_to new_user_session_path
    end

    it "marks mustdo as complete" do
      user = create(:user)
      mustdo = create(:mustdo, user: user, complete: false)
      sign_in user

      params = { id: mustdo.id, format: :js }
      delete :destroy, params

      mustdo.reload
      expect(mustdo.complete).to eq(true)
      expect(response).to have_http_status(:success)
    end

    it "responds with 404 Not Found for unknown id" do
      user = create(:user)
      sign_in user

      unknown_mustdo_id = 888
      params = { id: unknown_mustdo_id }

      assert_raises(ActiveRecord::RecordNotFound) do
        delete :destroy, params
      end
    end

    it "provides completed mustdo to view" do

      user = create(:user)
      mustdo = create(:mustdo, user: user, complete: false)
      sign_in user

      params = { id: mustdo.id, format: :js }
      delete :destroy, params

      mustdo.reload
      expect(assigns(:mustdo)).to eq(mustdo)
    end

    it "protects the mustdo from attacker" do

      attacker = create(:user)
      mustdo_from_another = create(:mustdo, user: create(:user), complete: false)
      sign_in attacker

      params = { id: mustdo_from_another.id, format: :js }
      assert_raises(ActiveRecord::RecordNotFound) do
        delete :destroy, params
      end

      mustdo_from_another.reload
      expect(mustdo_from_another).not_to be_complete
      expect(assigns(:mustdo)).to be_nil
    end

    context "view rendering" do
      render_views

      it "responds with JavaScript for AJAX request" do
        user = create(:user)
        mustdo = create(:mustdo, user: user, complete: false)
        sign_in user

        params = { format: :js, id: mustdo.id }
        delete :destroy, params
        
        expect(response.headers["Content-Type"]).to eq "text/javascript; charset=utf-8"
        expect(response).to render_template(:destroy)
        
        css_selector_for_todo = "#todo-#{mustdo.id}"
        expect(response.body).to include(css_selector_for_todo)
        
        javascript_snippet = "mustdoRowElement.addClass('deleted');"
        expect(response.body).to include(javascript_snippet)
      end
    end

  end


end

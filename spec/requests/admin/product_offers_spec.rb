require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/admin/product_offers", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Admin::ProductOffer. As you add validations to Admin::ProductOffer, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Admin::ProductOffer.create! valid_attributes
      get admin_product_offers_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      product_offer = Admin::ProductOffer.create! valid_attributes
      get admin_product_offer_url(product_offer)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_admin_product_offer_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      product_offer = Admin::ProductOffer.create! valid_attributes
      get edit_admin_product_offer_url(product_offer)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Admin::ProductOffer" do
        expect {
          post admin_product_offers_url, params: { admin_product_offer: valid_attributes }
        }.to change(Admin::ProductOffer, :count).by(1)
      end

      it "redirects to the created admin_product_offer" do
        post admin_product_offers_url, params: { admin_product_offer: valid_attributes }
        expect(response).to redirect_to(admin_product_offer_url(Admin::ProductOffer.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Admin::ProductOffer" do
        expect {
          post admin_product_offers_url, params: { admin_product_offer: invalid_attributes }
        }.to change(Admin::ProductOffer, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post admin_product_offers_url, params: { admin_product_offer: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested admin_product_offer" do
        product_offer = Admin::ProductOffer.create! valid_attributes
        patch admin_product_offer_url(product_offer), params: { admin_product_offer: new_attributes }
        product_offer.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the admin_product_offer" do
        product_offer = Admin::ProductOffer.create! valid_attributes
        patch admin_product_offer_url(product_offer), params: { admin_product_offer: new_attributes }
        product_offer.reload
        expect(response).to redirect_to(admin_product_offer_url(product_offer))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        product_offer = Admin::ProductOffer.create! valid_attributes
        patch admin_product_offer_url(product_offer), params: { admin_product_offer: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested admin_product_offer" do
      product_offer = Admin::ProductOffer.create! valid_attributes
      expect {
        delete admin_product_offer_url(product_offer)
      }.to change(Admin::ProductOffer, :count).by(-1)
    end

    it "redirects to the admin_product_offers list" do
      product_offer = Admin::ProductOffer.create! valid_attributes
      delete admin_product_offer_url(product_offer)
      expect(response).to redirect_to(admin_product_offers_url)
    end
  end
end

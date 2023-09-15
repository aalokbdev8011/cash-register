require 'rails_helper'

RSpec.describe '/admin/product_offers', type: :request do
  let(:product) { create(:product) }
  let(:product_offer) { create(:product_offer, product:) }
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'should allow user to view the list of product offers' do
      sign_in user

      product_offers1 = create(:product_offer, created_at: 2.days.ago)
      product_offers2 = create(:product_offer, created_at: 1.day.ago)
      product_offers3 = create(:product_offer, created_at: Time.now)

      get '/product_offers'
      expect(response.status).to eq(200)
      expect(assigns(:product_offers)).to eq([product_offers1, product_offers2, product_offers3])
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_admin_product_offer_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders the edit template and assigns the requested product offer' do
      get "/product_offers/#{product_offer.id}/edit"

      expect(response).to be_successful
      expect(assigns(:product_offer)).to eq(product_offer)
      expect(response).to render_template('edit')
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a product offer and redirects to the index page' do
        valid_params = { product_offer: { product_id: product.id, for_quantity: 3, discount: 10 } }

        expect do
          post '/product_offers', params: valid_params
        end.to change(ProductOffer, :count).by(1)

        expect(response).to redirect_to(admin_product_offers_path)
        expect(flash[:notice]).to eq('Product offer was successfully created.')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a product offer and renders the new template with unprocessable_entity status' do
        invalid_params = { product_offer: { product_id: nil, for_quantity: nil, discount: nil } }

        expect do
          post '/product_offers', params: invalid_params
        end.not_to change(ProductOffer, :count)

        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      it 'updates the product offer and redirects to the index page' do
        valid_params = { product_offer: { for_quantity: 5 } }
        patch "/product_offers/#{product_offer.id}", params: valid_params

        product_offer.reload

        expect(product_offer.for_quantity).to eq(5)
        expect(response).to redirect_to(admin_product_offers_path)
        expect(flash[:notice]).to eq('Product offer was successfully updated.')
      end
    end

    context 'with invalid parameters' do
      it 'does not update the product offer and renders the edit template with unprocessable_entity status' do
        invalid_params = { product_offer: { product_id: '' } }
        patch "/product_offers/#{product_offer.id}", params: invalid_params

        product_offer.reload

        expect(product_offer.for_quantity).not_to eq('')
        expect(response).to render_template(:edit)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the product offer and redirects to the index page' do
      delete "/product_offers/#{product_offer.id}"

      expect { product_offer.reload }.to raise_error(ActiveRecord::RecordNotFound)

      expect(response).to redirect_to(admin_product_offers_url)
      expect(flash[:notice]).to eq('Product offer was successfully destroyed.')
    end
  end
end

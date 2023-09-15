require 'rails_helper'

RSpec.describe '/products', type: :request do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  let(:product) { create(:product) }
  let(:user) { create(:user) }

  describe 'GET /index' do
    before do
      @product1 = create(:product, created_at: 2.days.ago)
      @product2 = create(:product, created_at: 1.day.ago)
      @product3 = create(:product, created_at: Time.now)
    end

    it 'should allow user to view the list of products' do
      sign_in user

      get '/products'
      expect(response.status).to eq(200)
      expect(assigns(:products)).to eq([@product1, @product2, @product3])
    end

    it 'should not list orders if the user is not logged in' do
      get '/products'
      expect(response.status).to eq(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      sign_in user
      get '/products/new'
      expect(response).to be_successful
    end

    it 'renders login page if the user is not logged in' do
      get '/products/new'
      expect(response.status).to eq(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'GET /edit' do
    it 'renders the edit template and assigns the requested product' do
      sign_in user
      get "/products/#{product.id}/edit"

      expect(response).to be_successful
      expect(assigns(:product)).to eq(product)
      expect(response).to render_template('edit')
    end

    it 'renders login page if the user is not logged in' do
      get "/products/#{product.id}/edit"
      expect(response.status).to eq(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a product and redirects to the index page' do
        sign_in user
        valid_params = { product: { product_code: 'CF1', name: 'Coffee', price: 10 } }

        expect do
          post '/products', params: valid_params
        end.to change(Product, :count).by(1)

        expect(response).to redirect_to(admin_products_path)
        expect(flash[:notice]).to eq('Product was successfully created.')
      end

      it 'renders login page if the user is not logged in' do
        valid_params = { product: { product_code: 'CF1', name: 'Coffee', price: 10 } }

        expect do
          post '/products', params: valid_params
        end.to change(Product, :count).by(0)

        expect(response.status).to eq(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a product and renders the new template with unprocessable_entity status' do
        sign_in user
        invalid_params = { product: { product_code: nil, name: nil, price: nil } }

        expect do
          post '/products', params: invalid_params
        end.not_to change(Product, :count)

        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'renders login page if the user is not logged in' do
        invalid_params = { product: { product_code: nil, name: nil, price: nil } }

        expect do
          post '/products', params: invalid_params
        end.not_to change(Product, :count)

        expect(response.status).to eq(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      it 'updates the product and redirects to the index page' do
        sign_in user
        valid_params = { product: { name: 'Green tea' } }
        patch "/products/#{product.id}", params: valid_params

        product.reload

        expect(product.name).to eq('Green tea')
        expect(response).to redirect_to(admin_products_path)
        expect(flash[:notice]).to eq('Product was successfully updated.')
      end

      it 'renders login page if the user is not logged in' do
        valid_params = { product: { name: 'Green tea' } }
        patch "/products/#{product.id}", params: valid_params

        expect(response.status).to eq(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not update the product and renders the edit template with unprocessable_entity status' do
        sign_in user
        invalid_params = { product: { product_code: '' } }
        patch "/products/#{product.id}", params: invalid_params

        product.reload

        expect(product.product_code).not_to eq('')
        expect(response).to render_template(:edit)
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'renders login page if the user is not logged in' do
        invalid_params = { product: { product_code: '' } }
        patch "/products/#{product.id}", params: invalid_params

        expect(response.status).to eq(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the product and redirects to the index page' do
      sign_in user
      delete "/products/#{product.id}"

      expect { product.reload }.to raise_error(ActiveRecord::RecordNotFound)

      expect(response).to redirect_to(admin_products_url)
      expect(flash[:notice]).to eq('Product was successfully destroyed.')
    end

    it 'renders login page if the user is not logged in' do
      delete "/products/#{product.id}"

      expect(response.status).to eq(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end

require 'rails_helper'

RSpec.describe Admin::ProductOffersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'product_offers').to route_to('admin/product_offers#index')
    end

    it 'routes to #new' do
      expect(get: 'product_offers/new').to route_to('admin/product_offers#new')
    end

    it 'routes to #edit' do
      expect(get: 'product_offers/1/edit').to route_to('admin/product_offers#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: 'product_offers').to route_to('admin/product_offers#create')
    end

    it 'routes to #update via PUT' do
      expect(put: 'product_offers/1').to route_to('admin/product_offers#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'product_offers/1').to route_to('admin/product_offers#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'product_offers/1').to route_to('admin/product_offers#destroy', id: '1')
    end
  end
end

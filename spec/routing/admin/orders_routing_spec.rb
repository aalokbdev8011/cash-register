require 'rails_helper'

RSpec.describe Admin::OrdersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'orders').to route_to('admin/orders#index')
    end

    it 'routes to #create' do
      expect(post: 'orders').to route_to('admin/orders#create')
    end
  end
end

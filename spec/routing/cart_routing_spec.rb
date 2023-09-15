require 'rails_helper'

RSpec.describe CartController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/').to route_to('cart#show')
    end

    it 'routes to #add' do
      expect(post: 'cart/add').to route_to('cart#add')
    end

    it 'routes to #remove' do
      expect(post: 'cart/remove').to route_to('cart#remove')
    end
  end
end

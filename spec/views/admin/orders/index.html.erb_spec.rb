require 'rails_helper'

RSpec.describe 'admin/orders/index', type: :view do
  before(:each) do
    assign(:orders, [
      create(:order, total_amount: 20),
      create(:order, total_amount: 20),
    ])
  end

  it 'renders a list of orders' do
    render
    cell_selector1 = 'div>h2'

    assert_select cell_selector1, text: Regexp.new('Orders'.to_s), count: 1
  end
end

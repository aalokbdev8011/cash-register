require 'rails_helper'

RSpec.describe 'admin/products/edit', type: :view do
  before(:each) do
    assign(:product, product)
  end

  let(:product) do
    create(
      :product,
      product_code: 'MyString',
      name: 'MyString',
      price: '9.99',
    )
  end

  it 'renders the edit product form' do
    render

    assert_select 'form[action=?][method=?]', admin_product_path(product), 'post' do
      assert_select 'input[name=?]', 'product[product_code]'

      assert_select 'input[name=?]', 'product[name]'

      assert_select 'input[name=?]', 'product[price]'
    end
  end
end

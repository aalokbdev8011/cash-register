require 'rails_helper'

RSpec.describe 'admin/products/new', type: :view do
  before(:each) do
    assign(:product, build(
                       :product,
                       product_code: 'MyString',
                       name: 'MyString',
                       price: '9.99',
                     ))
  end

  it 'renders new product form' do
    render

    assert_select 'form[action=?][method=?]', admin_products_path, 'post' do
      assert_select 'input[name=?]', 'product[product_code]'

      assert_select 'input[name=?]', 'product[name]'

      assert_select 'input[name=?]', 'product[price]'
    end
  end
end

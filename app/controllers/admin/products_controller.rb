module Admin
  class ProductsController < AdminController
    before_action :set_product, only: %i[show edit update destroy]

    def index
      @products = Product.order(created_at: :asc).all
    end

    def new
      @product = Product.new
    end

    def edit; end

    def create
      @product = Product.new(product_params)

      if @product.save
        redirect_to admin_products_path, notice: 'Product was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @product.update(product_params)
        redirect_to admin_products_path, notice: 'Product was successfully updated.', status: :see_other
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @product.destroy
      redirect_to admin_products_url, notice: 'Product was successfully destroyed.', status: :see_other
    end

    private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:product_code, :name, :price)
    end
  end
end

class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :edit_name, :update_name]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end
  
  def edit_name
  
  end
  def update_name

  end
	require 'csv'
	
	def related_products_csv
	  csv = CSV.generate(col_sep: "\t") do |csv|
			csv << ["Product SKU", "Related Products"]
			Product.all.sort_by(&:sku).each do |product|
				  csv << [product.sku, product.related_products.map(&:sku).join(",")]
			end
		end
		file ="related_products.txt"
		File.open(file, "w"){ |f| f << csv }
		send_file( file, type: 'text/csv')
	end
	
	def related_exercises_csv
	  csv = CSV.generate(col_sep: "\t") do |csv|
			csv << ["Product SKU", "Related Exercise"]
			Product.all.sort_by(&:sku).each do |product|
				  csv << [product.sku, product.exercises.map(&:url_key).join(",")]
			end
		end
		file ="related_exercises.txt"
		File.open(file, "w"){ |f| f << csv }
		send_file( file, type: 'text/csv')
	end


  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
        
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
        format.js {render :update_name }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :sku)
    end
end

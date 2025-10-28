require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context '商品出品できる（出品データが保存される）場合' do
      it 'すべての項目に適切な値が存在すれば出品できる' do
        expect(@product).to be_valid
      end
    end

    context '商品出品できない（出品データが保存されない）場合' do
      it 'product_nameが空では出品できない' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end

      it 'descriptionが空では出品できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end

      it 'product_imageが空では出品できない' do
        @product.product_image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Product image can't be blank")
      end

      it 'product_status_idがid=1(---)では出品できない' do
        @product.product_status_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Product status can't be blank")
      end

      it 'category_idが空ではid=1(---)では出品できない' do
        @product.category_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it 'delivery_cost_idがid=1(---)では出品できない' do
        @product.delivery_cost_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery cost can't be blank")
      end

      it 'prefecture_idがid=1(---)では出品できない' do
        @product.prefecture_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'delivery_time_idがid=1(---)では出品できない' do
        @product.delivery_time_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery time can't be blank")
      end

      it 'product_priceが空では出品できない' do
        @product.product_price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product price can't be blank")
      end

      it 'product_priceが300円未満では出品できない' do
        @product.product_price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include('Product price must be greater than or equal to 300')
      end

      it 'product_priceが10000000円以上では出品できない' do
        @product.product_price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include('Product price must be less than or equal to 9999999')
      end

      it 'product_priceが全角文字では出品できない' do
        @product.product_price = '１２３４５'
        @product.valid?
        expect(@product.errors.full_messages).to include('Product price is not a number')
      end

      it 'product_priceが半角英字では出品できない' do
        @product.product_price = 'abcdef'
        @product.valid?
        expect(@product.errors.full_messages).to include('Product price is not a number')
      end
      
      it 'userが紐付いていないと保存できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end

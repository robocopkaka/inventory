class Product
  include Mongoid::Document
  #include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :name, type: String
  field :model, type: String
  field :manufacturer, type: String
  field :quantity, type: Integer
  field :price, type: Integer
  field :accessible, type: Boolean, default: false
  field :expiry_date, type: String
  field :_id, type: String, default: ->{name.to_s.parameterize}

   before_save :check_exists

  validates :name, uniqueness: true, presence: true
  validates :_id, uniqueness:{message: 'The product already exists. Try editing it instead'}

  protected
  def check_exists
    product = Product.where(id: self._id)
    if product.nil?
    	redirect_to root_url, notice: "Product already exists" and return
    else
    	product = Product.new(name: self.name, model: self.model, 
    							manufacturer: self.manufacturer, quantity: self.quantity,
    							price: self.price)
    end
  end
end

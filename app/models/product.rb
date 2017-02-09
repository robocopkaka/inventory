class Product
  include Mongoid::Document
  #include Mongoid::Paranoia
  include Mongoid::Timestamps
  field :name, type: String
  field :model, type: String
  field :manufacturer, type: String
  field :quantity, type: Integer
  field :accessible, type: Boolean, default: false
  field :expiry_date, type: String
  field :_id, type: String, default: ->{name.to_s.parameterize}

  validates :name, uniqueness: true, presence: true
end

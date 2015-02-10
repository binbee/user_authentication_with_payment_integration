class Author < ActiveRecord::Base
validates :name, presence: true, length: {minimum: 7}
validates :email, presence: true, uniqueness: true
has_one :image, as: :entity #to make polymorphic association
end

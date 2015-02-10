class Image < ActiveRecord::Base

has_attached_file :photo , :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo , :content_type => /\Aimage\/.*\Z/
belongs_to :entity, polymorphic: true
#validates_attachment_content_type :photo , :content_type => ["image/png","image/jpeg"]
scope :manav, lambda { self.last(5)}
scope :bineesh, Proc.new {"hi m proc"}
end

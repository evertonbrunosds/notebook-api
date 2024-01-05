class ContactSerializer < ActiveModel::Serializer
  attributes %i[ id name email birthdate created_at updated_at ]

  belongs_to :kind do 
    link(:related) { kind_url(object.kind.id) }
  end
  has_many :phones
  has_one :address

  def attributes(*args)
    hash = super(*args)
    hash[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    hash
  end

end

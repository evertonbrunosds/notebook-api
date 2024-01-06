class ContactSerializer < ActiveModel::Serializer
  attributes %i[ id name email birthdate created_at updated_at ]

  belongs_to :kind do 
    link(:related) { contact_kind_url(object.id) }
  end
  has_many :phones do
    link(:related) { contact_phones_url(object.id) }
  end
  has_one :address

  def attributes(*args)
    hash = super(*args)
    hash[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    hash
  end

end

class ContactSerializer < ActiveModel::Serializer
  attributes %i[ id name email birthdate created_at updated_at ]

  belongs_to :kind
  has_many :phones, dependent: :destroy
  has_one :address, dependent: :destroy

  def attributes(*args)
    hash = super(*args)
    # pt-BR ---> hash[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    hash[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    hash
  end

end

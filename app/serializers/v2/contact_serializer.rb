module V2
  class ContactSerializer < ActiveModel::Serializer
    attributes %i[ id name email birthdate created_at updated_at ]

    belongs_to :kind do 
      link(:related) { v2_contact_kind_url(object.id) }
    end

    has_many :phones do
      link(:related) { v2_contact_phones_url(object.id) }
    end

    has_one :address do
      link(:related) { v2_contact_address_url(object.id) }
    end

    def attributes(*args)
      hash = super(*args)
      hash[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
      hash
    end

  end
end

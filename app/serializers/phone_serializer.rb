class PhoneSerializer < ActiveModel::Serializer
  attributes %i[ id number ]

  belongs_to :contact do
    link(:related) { contact_phones_url(object.contact.id) }
  end

end

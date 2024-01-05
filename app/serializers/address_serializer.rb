class AddressSerializer < ActiveModel::Serializer
  attributes %i[ id street city ]
end

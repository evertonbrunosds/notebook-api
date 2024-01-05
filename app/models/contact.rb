class Contact < ApplicationRecord
    belongs_to :kind
    has_many :phones, dependent: :destroy
    has_one :address, dependent: :destroy
    accepts_nested_attributes_for :phones, allow_destroy: true
    accepts_nested_attributes_for :address, update_only: true #IMPEDE A CRIAÇÃO DE NOVOS REGISTROS (ATUA COMO UMA RESTRIÇÃO UNIQUE)

    def as_json(options={})
        json = super(options)
        json[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
        json
    end

end

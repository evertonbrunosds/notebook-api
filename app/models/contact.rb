class Contact < ApplicationRecord
    belongs_to :kind
    has_many :phones, dependent: :destroy
    accepts_nested_attributes_for :phones

    def as_json(options={})
        json = super(options)
        json[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
        json
    end

end

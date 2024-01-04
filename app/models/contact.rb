class Contact < ApplicationRecord
    belongs_to :kind
    has_many :phones, dependent: :destroy

    def as_json
        json = super(
            except: %i[ created_at updated_at kind_id birthdate ],
            include: {
                kind: {except: %i[ created_at updated_at ]}
            }
        )
        json[:birthdate] = (I18n.l(birthdate) unless birthdate.blank?)
        json
    end

end

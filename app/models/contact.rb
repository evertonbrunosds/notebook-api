class Contact < ApplicationRecord
    belongs_to :kind
    has_many :phones, dependent: :destroy

    def as_json()
        super(
            except: %i[ created_at updated_at kind_id ],
            include: {
                kind: {except: %i[ created_at updated_at ]}
            }
        )
    end

end

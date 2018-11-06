class Recording < ApplicationRecord
  belongs_to :user, optional: :true    
end
